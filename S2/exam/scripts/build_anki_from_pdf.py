#!/usr/bin/env python3
from __future__ import annotations

import argparse
import glob
import html
import json
import re
import shutil
import subprocess
import sys
import tempfile
import unicodedata
from dataclasses import asdict, dataclass
from pathlib import Path


EXPECTED_QUESTION_COUNT = 35
QUESTION_RE = re.compile(
    r"^Question (?P<number>\d+) — (?P<theme>[^\n]+)\n+(?P<body>.*?)(?=^Question \d+ — |\Z)",
    re.MULTILINE | re.DOTALL,
)

JUNK_LINE_PATTERNS = (
    re.compile(r"^M2 Méthodologie & Statistique en Recherche Biomédicale.*$"),
    re.compile(r"^Examen Final RC.*$"),
    re.compile(r"^Fang W\. et al\..*$"),
    re.compile(r"^Page \d+$"),
    re.compile(r"^PARTIE [IVX]+ .*$"),
    re.compile(r"^TABLE DES MATIÈRES$"),
    re.compile(r"^THÈME \d+ — .*$"),
)


@dataclass
class QuestionAnswer:
    number: int
    theme: str
    question: str
    approach: str
    reference: str
    answer: str
    tags: list[str]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build an Anki .apkg deck from the RC 2026 exhaustive PDF."
    )
    parser.add_argument("pdf", type=Path, help="Input PDF file.")
    parser.add_argument(
        "--output",
        type=Path,
        help="Output .apkg path. Defaults to annales/anki/<pdf-stem>.apkg.",
    )
    parser.add_argument(
        "--deck-name",
        default="M2MSR::RC::2026::Exhaustif",
        help="Deck name inside Anki.",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        help="Optional JSON export of the parsed Q/A content.",
    )
    return parser.parse_args()


def ensure_anki_on_path() -> None:
    try:
        import anki  # noqa: F401

        return
    except ModuleNotFoundError:
        pass

    candidates = glob.glob(
        str(
            Path.home()
            / "Library/Application Support/AnkiProgramFiles/.venv/lib/python*/site-packages"
        )
    )
    for candidate in sorted(candidates):
        if candidate not in sys.path:
            sys.path.insert(0, candidate)

    try:
        import anki  # noqa: F401
    except ModuleNotFoundError as exc:
        raise SystemExit(
            "Unable to import Anki's Python package. Install Anki locally or update "
            "ensure_anki_on_path() to point to your AnkiProgramFiles environment."
        ) from exc


def slugify(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value)
    ascii_value = normalized.encode("ascii", "ignore").decode("ascii")
    slug = re.sub(r"[^a-zA-Z0-9]+", "_", ascii_value).strip("_").lower()
    return slug or "untagged"


def extract_pdf_text(pdf_path: Path) -> str:
    try:
        result = subprocess.run(
            ["pdftotext", str(pdf_path), "-"],
            check=True,
            capture_output=True,
            text=True,
        )
    except FileNotFoundError as exc:
        raise SystemExit("pdftotext is required but was not found in PATH.") from exc
    except subprocess.CalledProcessError as exc:
        raise SystemExit(f"pdftotext failed: {exc.stderr.strip()}") from exc

    return result.stdout.replace("\x0c", "\n")


def clean_line(line: str) -> str:
    line = line.replace("\u00a0", " ").replace("\u00ad", "")
    line = re.sub(r"\s+", " ", line).strip()
    if not line:
        return ""
    for pattern in JUNK_LINE_PATTERNS:
        if pattern.match(line):
            return ""
    return line


def line_kind(line: str) -> str:
    if line.startswith("•"):
        return "bullet"
    if re.match(r"^\d+\.", line):
        return "numbered"
    return "plain"


def is_continuation(current: str) -> bool:
    return not re.search(r"[.!?:]$", current)


def looks_like_labeled_line(line: str) -> bool:
    return bool(re.match(r"^[A-Z0-9ÉÈÀÙÂÊÎÔÛÇ][^•]{0,90} :", line))


def logical_blocks(text: str) -> list[str]:
    blocks: list[str] = []
    current = ""

    for raw_line in text.splitlines():
        line = clean_line(raw_line)
        if not line:
            if current:
                blocks.append(current)
                current = ""
            continue

        if not current:
            current = line
            continue

        kind = line_kind(line)
        if kind in {"bullet", "numbered"}:
            blocks.append(current)
            current = line
            continue

        if looks_like_labeled_line(line):
            blocks.append(current)
            current = line
            continue

        if is_continuation(current):
            current = f"{current} {line}"
        else:
            blocks.append(current)
            current = line

    if current:
        blocks.append(current)

    return [block for block in blocks if block]


def parse_questions(text: str) -> list[QuestionAnswer]:
    questions: list[QuestionAnswer] = []

    for match in QUESTION_RE.finditer(text):
        number = int(match.group("number"))
        theme = match.group("theme").strip()
        body = match.group("body")

        if "RÉPONSE DÉTAILLÉE" not in body:
            raise ValueError(f"Question {number} has no answer block.")

        prompt_raw, answer_raw = body.split("RÉPONSE DÉTAILLÉE", 1)
        answer_blocks = logical_blocks(answer_raw)

        prompt_lines = [clean_line(line) for line in prompt_raw.splitlines()]
        prompt_text = "\n".join(line for line in prompt_lines if line)
        prompt_match = re.search(
            r"^(?P<question>.*?)\nApproche\s*:\s*(?P<approach>.*?)\nRéférence annale\s*:\s*(?P<reference>.*)$",
            prompt_text,
            re.DOTALL,
        )
        if not prompt_match:
            raise ValueError(f"Question {number} prompt could not be parsed.")

        question = " ".join(logical_blocks(prompt_match.group("question")))
        approach = " ".join(logical_blocks(prompt_match.group("approach")))
        reference = " ".join(logical_blocks(prompt_match.group("reference")))

        if not question:
            raise ValueError(f"Question {number} question text is empty.")
        if not approach:
            raise ValueError(f"Question {number} approach could not be parsed.")
        if not reference:
            raise ValueError(f"Question {number} reference could not be parsed.")
        if not answer_blocks:
            raise ValueError(f"Question {number} answer is empty.")

        questions.append(
            QuestionAnswer(
                number=number,
                theme=theme,
                question=question,
                approach=approach,
                reference=reference,
                answer="\n".join(answer_blocks),
                tags=[
                    "rc_m2msr_2026",
                    "exhaustif",
                    f"theme_{slugify(theme)}",
                    f"q{number:02d}",
                ],
            )
        )

    if len(questions) != EXPECTED_QUESTION_COUNT:
        raise ValueError(
            f"Expected {EXPECTED_QUESTION_COUNT} questions, found {len(questions)}."
        )

    return questions


def paragraph_html(text: str) -> str:
    return f"<p>{html.escape(text)}</p>"


def answer_html(answer: str) -> str:
    parts: list[str] = []
    bullet_buffer: list[str] = []

    def flush_bullets() -> None:
        nonlocal bullet_buffer
        if not bullet_buffer:
            return
        items = "".join(f"<li>{html.escape(item[1:].strip())}</li>" for item in bullet_buffer)
        parts.append(f"<ul>{items}</ul>")
        bullet_buffer = []

    for block in answer.splitlines():
        if block.startswith("•"):
            bullet_buffer.append(block)
            continue

        flush_bullets()
        parts.append(paragraph_html(block))

    flush_bullets()
    return "\n".join(parts)


def front_html(item: QuestionAnswer) -> str:
    meta = (
        "<div style=\"font-size:13px;color:#666;text-transform:uppercase;"
        "letter-spacing:0.04em;\">"
        f"Q{item.number:02d} &bull; {html.escape(item.theme)}"
        "</div>"
    )
    prompt = (
        "<div style=\"font-size:24px;font-weight:600;line-height:1.35;"
        "margin-top:12px;\">"
        f"{html.escape(item.question)}"
        "</div>"
    )
    return meta + prompt


def back_html(item: QuestionAnswer) -> str:
    sections = [
        "<div style=\"font-size:13px;color:#666;text-transform:uppercase;"
        "letter-spacing:0.04em;margin-bottom:12px;\">Reponse detaillee</div>",
        answer_html(item.answer),
        "<hr>",
        paragraph_html(f"Approche: {item.approach}"),
        paragraph_html(f"Reference annale: {item.reference}"),
    ]
    return "\n".join(sections)


def write_json(json_path: Path, questions: list[QuestionAnswer]) -> None:
    json_path.parent.mkdir(parents=True, exist_ok=True)
    payload = [asdict(question) for question in questions]
    json_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")


def build_package(
    questions: list[QuestionAnswer], deck_name: str, output_path: Path
) -> int:
    ensure_anki_on_path()

    from anki.collection import (
        Collection,
        DeckIdLimit,
        ExportAnkiPackageOptions,
        ImportAnkiPackageRequest,
    )

    output_path.parent.mkdir(parents=True, exist_ok=True)

    temp_root = Path(tempfile.mkdtemp(prefix="anki-build-", dir="/tmp"))
    collection_path = temp_root / "build.anki2"
    count = 0

    try:
        col = Collection(str(collection_path))
        did = col.decks.id(deck_name)
        model = col.models.by_name("Basic")
        if did is None or model is None:
            raise RuntimeError("Unable to initialize the Basic note type or target deck.")

        for item in questions:
            note = col.new_note(model)
            note["Front"] = front_html(item)
            note["Back"] = back_html(item)
            for tag in item.tags:
                note.add_tag(tag)
            col.add_note(note, did)

        if output_path.exists():
            output_path.unlink()

        count = col.export_anki_package(
            out_path=str(output_path),
            options=ExportAnkiPackageOptions(
                with_scheduling=False,
                with_deck_configs=False,
                with_media=False,
                legacy=False,
            ),
            limit=DeckIdLimit(deck_id=did),
        )
        col.close()

        verify_package(output_path, len(questions))
        return count
    finally:
        shutil.rmtree(temp_root, ignore_errors=True)


def verify_package(apkg_path: Path, expected_notes: int) -> None:
    ensure_anki_on_path()

    from anki.collection import Collection, ImportAnkiPackageRequest

    temp_root = Path(tempfile.mkdtemp(prefix="anki-verify-", dir="/tmp"))
    collection_path = temp_root / "verify.anki2"

    try:
        col = Collection(str(collection_path))
        options = col._backend.get_import_anki_package_presets()
        log = col.import_anki_package(
            ImportAnkiPackageRequest(package_path=str(apkg_path), options=options)
        )
        note_count = col.note_count()
        card_count = col.card_count()
        col.close()

        if note_count != expected_notes or card_count != expected_notes:
            raise RuntimeError(
                "Verification import failed: "
                f"expected {expected_notes} notes/cards, got {note_count}/{card_count}."
            )
        if len(log.log.new) != expected_notes:
            raise RuntimeError(
                "Verification import did not report the expected number of new notes: "
                f"{len(log.log.new)} instead of {expected_notes}."
            )
    finally:
        shutil.rmtree(temp_root, ignore_errors=True)


def default_output_path(pdf_path: Path) -> Path:
    return pdf_path.parent / "anki" / f"{pdf_path.stem}.apkg"


def main() -> None:
    args = parse_args()
    pdf_path = args.pdf.resolve()
    if not pdf_path.exists():
        raise SystemExit(f"PDF not found: {pdf_path}")

    output_path = args.output.resolve() if args.output else default_output_path(pdf_path)
    text = extract_pdf_text(pdf_path)
    questions = parse_questions(text)

    if args.json_out:
        write_json(args.json_out.resolve(), questions)

    count = build_package(questions, args.deck_name, output_path)

    print(f"Parsed {len(questions)} questions.")
    print(f"Exported {count} cards.")
    print(f"APKG: {output_path}")
    if args.json_out:
        print(f"JSON: {args.json_out.resolve()}")


if __name__ == "__main__":
    main()
