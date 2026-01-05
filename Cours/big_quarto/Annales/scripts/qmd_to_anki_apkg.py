#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import html
import os
import re
import shutil
import sys
import unicodedata
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

import genanki
import markdown as md


@dataclass(frozen=True)
class CardSpec:
    question: str
    answer_markdown: str
    year_label: str
    status_label: str
    type_label: str
    tags: tuple[str, ...]


HEADING_RE = re.compile(r"^(#{1,6})\s+(.*\S)\s*$")
IMAGE_RE = re.compile(r"!\[([^\]]*)\]\(([^)]+)\)(?:\{[^}]*\})?")


def strip_accents(text: str) -> str:
    normalized = unicodedata.normalize("NFKD", text)
    return "".join(ch for ch in normalized if not unicodedata.combining(ch))


def slug(text: str) -> str:
    text = strip_accents(text).lower().strip()
    text = re.sub(r"[\s\-]+", "_", text)
    text = re.sub(r"[^a-z0-9_]+", "", text)
    text = re.sub(r"_+", "_", text).strip("_")
    return text or "na"


def stable_int_id(namespace: str, name: str) -> int:
    digest = hashlib.sha1(f"{namespace}:{name}".encode("utf-8")).digest()
    return int.from_bytes(digest[:8], byteorder="big", signed=False) & ((1 << 63) - 1)


def status_from_h1(h1: str) -> tuple[str, str]:
    """
    Returns (status_label_for_footer, status_tag_component)
    """
    norm = slug(h1)
    if "non" in norm and ("officiel" in norm or "corrig" in norm or "correction" in norm):
        return ("Annale non corrigée", "non_corrigee")
    if "non_corrig" in norm:
        return ("Annale non corrigée", "non_corrigee")
    if "officiel" in norm:
        return ("Annale corrigée", "corrigee")
    if "corrig" in norm:
        return ("Annale corrigée", "corrigee")
    return ("Annale corrigée", "corrigee")


def split_front_matter(lines: list[str]) -> list[str]:
    if not lines:
        return lines
    if lines[0].strip() != "---":
        return lines
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            return lines[i + 1 :]
    return lines


def normalize_question_for_dedupe(question: str) -> str:
    q = strip_accents(question).lower()
    q = re.sub(r"\s+", " ", q).strip()
    return q


def iter_cards_from_qmd(qmd_path: Path, base_tag: str) -> list[CardSpec]:
    raw_lines = qmd_path.read_text(encoding="utf-8").splitlines()
    lines = split_front_matter(raw_lines)

    in_fence = False
    current_h1 = ""
    current_h2 = ""
    current_h3 = ""
    current_status_label, current_status_tag = ("Annale corrigée", "corrigee")

    cards: list[CardSpec] = []
    question: str | None = None
    answer_lines: list[str] = []
    seen_questions: set[str] = set()

    def finalize_current() -> None:
        nonlocal question, answer_lines
        if question is None:
            return

        normalized_q = normalize_question_for_dedupe(question)
        if normalized_q in seen_questions:
            question = None
            answer_lines = []
            return
        seen_questions.add(normalized_q)

        answer = "\n".join(answer_lines).strip()
        answer = re.sub(r"(?m)^\s*\\\\newpage\s*$", "", answer).strip()

        year_label = current_h2.strip() or "NA"
        type_label = current_h3.strip() or "NA"

        footer = f"{year_label} - {current_status_label} - {type_label}"
        if answer:
            answer += "\n\n---\n" + footer
        else:
            answer = footer

        tags: list[str] = [base_tag]
        year_match = re.search(r"\b(19|20)\d{2}\b", year_label)
        if year_match:
            tags.append(f"annee::{year_match.group(0)}")
            rest = year_label.replace(year_match.group(0), "").strip()
            if rest:
                tags.append(f"session::{slug(rest)}")
        else:
            tags.append(f"annee::{slug(year_label)}")

        tags.append(f"statut::{current_status_tag}")
        tags.append(f"type::{slug(type_label)}")

        cards.append(
            CardSpec(
                question=question.strip(),
                answer_markdown=answer,
                year_label=year_label,
                status_label=current_status_label,
                type_label=type_label,
                tags=tuple(sorted(set(tags))),
            )
        )
        question = None
        answer_lines = []

    for line in lines:
        if line.startswith("```"):
            in_fence = not in_fence
            if question is not None:
                answer_lines.append(line)
            continue

        if not in_fence:
            m = HEADING_RE.match(line)
            if m:
                level = len(m.group(1))
                text = m.group(2).strip()
                if level <= 4:
                    if level == 1:
                        finalize_current()
                        current_h1 = text
                        current_status_label, current_status_tag = status_from_h1(current_h1)
                    elif level == 2:
                        finalize_current()
                        current_h2 = text
                    elif level == 3:
                        finalize_current()
                        current_h3 = text
                    elif level == 4:
                        finalize_current()
                        question = text
                        answer_lines = []
                    continue

        if question is not None:
            answer_lines.append(line)

    finalize_current()
    return cards


def rewrite_images_and_collect_media(
    markdown_text: str, qmd_dir: Path, media_dir: Path
) -> tuple[str, list[Path]]:
    media_files: list[Path] = []
    used_names: set[str] = set()
    mapping: dict[str, str] = {}

    def unique_name(original: str) -> str:
        base = Path(original).name
        if base not in used_names:
            used_names.add(base)
            return base
        suffix = hashlib.sha1(original.encode("utf-8")).hexdigest()[:10]
        candidate = f"{Path(base).stem}_{suffix}{Path(base).suffix}"
        used_names.add(candidate)
        return candidate

    def repl(match: re.Match[str]) -> str:
        alt = match.group(1)
        path_raw = match.group(2).strip()
        if re.match(r"^(https?:)?//", path_raw):
            return match.group(0)

        path_clean = path_raw.split("#", 1)[0].split("?", 1)[0]
        src = (qmd_dir / path_clean).resolve()
        if not src.exists() or not src.is_file():
            return match.group(0)

        if path_raw not in mapping:
            dst_name = unique_name(path_clean)
            dst = media_dir / dst_name
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(src, dst)
            media_files.append(dst)
            mapping[path_raw] = dst_name

        dst_name = mapping[path_raw]
        return f"![{alt}]({dst_name})"

    rewritten = IMAGE_RE.sub(repl, markdown_text)
    return rewritten, media_files


def protect_latex(md_text: str) -> tuple[str, dict[str, str]]:
    """
    Prevent the Markdown renderer from interpreting characters inside $...$ / $$...$$.
    We replace math segments by placeholders, run markdown->html, then restore them.
    """
    placeholder_to_math: dict[str, str] = {}
    out: list[str] = []

    in_code_fence = False
    in_inline_code = False
    in_math_inline = False
    in_math_block = False
    buf: list[str] = []
    placeholder_index = 0

    def emit_placeholder(latex_src: str) -> None:
        nonlocal placeholder_index
        key = f"@@ANKIMATH{placeholder_index}@@"
        placeholder_index += 1
        placeholder_to_math[key] = latex_src
        out.append(key)

    i = 0
    while i < len(md_text):
        ch = md_text[i]

        # Code fence toggling only at line start (after \n or at 0), allow leading spaces.
        if not in_inline_code and not in_math_inline and not in_math_block and (
            i == 0 or md_text[i - 1] == "\n"
        ):
            j = i
            while j < len(md_text) and md_text[j] == " ":
                j += 1
            if md_text.startswith("```", j):
                in_code_fence = not in_code_fence
                out.append(ch)
                i += 1
                continue

        if in_code_fence:
            out.append(ch)
            i += 1
            continue

        if not in_math_inline and not in_math_block and ch == "`":
            in_inline_code = not in_inline_code
            out.append(ch)
            i += 1
            continue

        if in_inline_code:
            out.append(ch)
            i += 1
            continue

        # Math block $$...$$
        if not in_math_inline and md_text.startswith("$$", i):
            if in_math_block:
                buf.append("$$")
                emit_placeholder("".join(buf))
                buf = []
                in_math_block = False
            else:
                in_math_block = True
                buf = ["$$"]
            i += 2
            continue

        if in_math_block:
            buf.append(ch)
            i += 1
            continue

        # Inline math $...$ (ignore $$ which is handled above; ignore escaped \$)
        if ch == "$" and not md_text.startswith("$$", i) and (i == 0 or md_text[i - 1] != "\\"):
            if in_math_inline:
                buf.append("$")
                emit_placeholder("".join(buf))
                buf = []
                in_math_inline = False
            else:
                in_math_inline = True
                buf = ["$"]
            i += 1
            continue

        if in_math_inline:
            buf.append(ch)
            i += 1
            continue

        out.append(ch)
        i += 1

    # Unclosed math: put it back as-is.
    if in_math_inline or in_math_block:
        out.extend(buf)

    return "".join(out), placeholder_to_math


def restore_latex(html_text: str, placeholder_to_math: dict[str, str]) -> str:
    def to_mathjax_delimiters(latex_src: str) -> str:
        if latex_src.startswith("$$") and latex_src.endswith("$$") and len(latex_src) >= 4:
            inner = latex_src[2:-2]
            return f"\\[{inner}\\]"
        if latex_src.startswith("$") and latex_src.endswith("$") and len(latex_src) >= 2:
            inner = latex_src[1:-1]
            return f"\\({inner}\\)"
        return latex_src

    for placeholder, latex_src in placeholder_to_math.items():
        html_text = html_text.replace(
            placeholder, html.escape(to_mathjax_delimiters(latex_src), quote=False)
        )
    return html_text


def build_apkg(
    cards: Iterable[CardSpec],
    output_path: Path,
    deck_name: str,
    include_images: bool,
    qmd_dir: Path,
) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)

    model_id = stable_int_id("anki-model", "M2biostatistiques Annales Basic")
    deck_id = stable_int_id("anki-deck", deck_name)

    model = genanki.Model(
        model_id=model_id,
        name="M2biostatistiques Annales (Q/A)",
        fields=[
            {"name": "Front"},
            {"name": "Back"},
        ],
        templates=[
            {
                "name": "Card 1",
                "qfmt": "<anki-mathjax>{{Front}}</anki-mathjax>",
                "afmt": "<anki-mathjax>{{FrontSide}}<hr id='answer'>{{Back}}</anki-mathjax>",
            }
        ],
        css="""
.card {
  font-family: arial;
  font-size: 16px;
  text-align: left;
  color: black;
  background-color: white;
}
pre, code { font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace; }
""",
    )

    deck = genanki.Deck(deck_id=deck_id, name=deck_name)

    media_files: list[str] = []
    media_dir = output_path.parent / ".anki_media"
    if include_images:
        if media_dir.exists():
            shutil.rmtree(media_dir)
        media_dir.mkdir(parents=True, exist_ok=True)

    for card in cards:
        front_protected, front_placeholders = protect_latex(card.question)
        front_html = html.escape(front_protected, quote=False).replace("\n", "<br>")
        front_html = restore_latex(front_html, front_placeholders)

        answer_md = card.answer_markdown
        if include_images:
            answer_md, collected = rewrite_images_and_collect_media(answer_md, qmd_dir, media_dir)
            media_files.extend(str(p) for p in collected)

        protected, placeholders = protect_latex(answer_md)
        back_html = md.markdown(protected, extensions=["extra"])
        back_html = restore_latex(back_html, placeholders)

        note = genanki.Note(
            model=model,
            fields=[front_html, back_html],
            tags=list(card.tags),
            guid=genanki.guid_for(normalize_question_for_dedupe(card.question)),
        )
        deck.add_note(note)

    package = genanki.Package(deck)
    if include_images and media_files:
        package.media_files = media_files
    package.write_to_file(str(output_path))


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description="Convert a QMD of annales into an Anki .apkg package.")
    parser.add_argument("--input", default="Annales.qmd", help="Input QMD file")
    parser.add_argument("--output", default="Annales.apkg", help="Output .apkg file")
    parser.add_argument("--deck", default="M2biostatistiques::Annales", help="Anki deck name")
    parser.add_argument("--base-tag", default="M2biostatistiques::annales", help="Tag applied to every note")
    parser.add_argument(
        "--include-images",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="If enabled, bundles local images referenced by markdown into the .apkg",
    )
    args = parser.parse_args(argv)

    raw_input = Path(args.input).expanduser()
    candidates: list[Path] = [raw_input]
    script_root = Path(__file__).resolve().parent.parent
    if not raw_input.is_absolute():
        candidates.append(script_root / raw_input)
    qmd_path = next((p for p in candidates if p.exists()), raw_input)

    if not qmd_path.exists():
        print(f"Input not found: {raw_input}", file=sys.stderr)
        if not raw_input.is_absolute():
            print(f"Tried also: {script_root / raw_input}", file=sys.stderr)
        print(f"Current working directory: {Path.cwd()}", file=sys.stderr)
        print("Tip: re-run with --input /full/path/to/Annales.qmd", file=sys.stderr)
        return 2

    cards = iter_cards_from_qmd(qmd_path, base_tag=args.base_tag)
    if not cards:
        print("No cards found (no #### headings?)", file=sys.stderr)
        return 1

    output_path = Path(args.output)
    build_apkg(
        cards=cards,
        output_path=output_path,
        deck_name=args.deck,
        include_images=bool(args.include_images),
        qmd_dir=qmd_path.parent,
    )

    print(f"Wrote {output_path} with {len(cards)} notes.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
