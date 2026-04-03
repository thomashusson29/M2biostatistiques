#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import html
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

try:
    import genanki  # type: ignore
except ModuleNotFoundError:
    genanki = None  # type: ignore[assignment]

try:
    import markdown as md  # type: ignore
except ModuleNotFoundError:
    md = None  # type: ignore[assignment]


HEADING_RE = re.compile(r"^####\s+(.*\S)\s*$")
DEFAULT_DECK = "EPI::Questions"


@dataclass(frozen=True)
class CardSpec:
    question: str
    answer_markdown: str


def stable_int_id(namespace: str, name: str) -> int:
    digest = hashlib.sha1(f"{namespace}:{name}".encode("utf-8")).digest()
    return int.from_bytes(digest[:8], byteorder="big", signed=False) & ((1 << 63) - 1)


def normalize_question(question: str) -> str:
    return re.sub(r"\s+", " ", question).strip().lower()


def iter_cards_from_lines(lines: Iterable[str]) -> list[CardSpec]:
    cards: list[CardSpec] = []
    current_question: str | None = None
    current_answer: list[str] = []
    in_fence = False

    def flush() -> None:
        nonlocal current_question, current_answer
        if current_question is None:
            return
        answer_markdown = "\n".join(current_answer).strip()
        cards.append(CardSpec(question=current_question, answer_markdown=answer_markdown))
        current_question = None
        current_answer = []

    for line in lines:
        stripped = line.lstrip()
        if stripped.startswith("```"):
            in_fence = not in_fence

        if not in_fence:
            match = HEADING_RE.match(line)
            if match:
                flush()
                current_question = match.group(1).strip()
                current_answer = []
                continue

        if current_question is not None:
            current_answer.append(line)

    flush()
    return cards


def load_cards(md_path: Path) -> list[CardSpec]:
    lines = md_path.read_text(encoding="utf-8").splitlines()
    return iter_cards_from_lines(lines)


def require_dependencies() -> None:
    missing: list[str] = []
    if genanki is None:
        missing.append("genanki")
    if md is None:
        missing.append("markdown")
    if missing:
        joined = " ".join(missing)
        raise RuntimeError(f"Dépendances manquantes. Installe-les avec: python3 -m pip install {joined}")


def protect_latex(md_text: str) -> tuple[str, dict[str, str]]:
    placeholder_to_math: dict[str, str] = {}
    out: list[str] = []

    in_code_fence = False
    in_inline_code = False
    in_math_inline = False
    in_math_block = False
    buffer: list[str] = []
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

        if not in_inline_code and not in_math_inline and not in_math_block and (i == 0 or md_text[i - 1] == "\n"):
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

        if not in_math_inline and md_text.startswith("$$", i):
            if in_math_block:
                buffer.append("$$")
                emit_placeholder("".join(buffer))
                buffer = []
                in_math_block = False
            else:
                in_math_block = True
                buffer = ["$$"]
            i += 2
            continue

        if in_math_block:
            buffer.append(ch)
            i += 1
            continue

        if ch == "$" and not md_text.startswith("$$", i) and (i == 0 or md_text[i - 1] != "\\"):
            if in_math_inline:
                buffer.append("$")
                emit_placeholder("".join(buffer))
                buffer = []
                in_math_inline = False
            else:
                in_math_inline = True
                buffer = ["$"]
            i += 1
            continue

        if in_math_inline:
            buffer.append(ch)
            i += 1
            continue

        out.append(ch)
        i += 1

    if in_math_inline or in_math_block:
        out.extend(buffer)

    return "".join(out), placeholder_to_math


def restore_latex(html_text: str, placeholder_to_math: dict[str, str]) -> str:
    def to_anki_mathjax_delimiters(latex_src: str) -> str:
        if latex_src.startswith("$$") and latex_src.endswith("$$") and len(latex_src) >= 4:
            inner = latex_src[2:-2]
            return f"\\[{inner}\\]"
        if latex_src.startswith("$") and latex_src.endswith("$") and len(latex_src) >= 2:
            inner = latex_src[1:-1]
            return f"\\({inner}\\)"
        return latex_src

    for placeholder, latex_src in placeholder_to_math.items():
        mathjax = to_anki_mathjax_delimiters(latex_src)
        html_text = html_text.replace(placeholder, html.escape(mathjax, quote=False))
    return html_text


def build_apkg(cards: Iterable[CardSpec], output_path: Path, deck_name: str) -> int:
    require_dependencies()
    assert genanki is not None
    assert md is not None

    output_path.parent.mkdir(parents=True, exist_ok=True)

    model = genanki.Model(
        model_id=stable_int_id("anki-model", "markdown-heading-4-basic"),
        name="Markdown Heading 4 Basic",
        fields=[{"name": "Front"}, {"name": "Back"}],
        templates=[
            {
                "name": "Carte",
                "qfmt": "<anki-mathjax>{{Front}}</anki-mathjax>",
                "afmt": "<anki-mathjax>{{FrontSide}}<hr id='answer'>{{Back}}</anki-mathjax>",
            }
        ],
        css="""
.card {
  font-family: Arial, sans-serif;
  font-size: 18px;
  text-align: left;
  color: #111;
  background: white;
}
pre, code {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
}
""",
    )

    deck = genanki.Deck(
        deck_id=stable_int_id("anki-deck", deck_name),
        name=deck_name,
    )

    count = 0
    for card in cards:
        protected_front, front_placeholders = protect_latex(card.question)
        front = html.escape(protected_front, quote=False).replace("\n", "<br>")
        front = restore_latex(front, front_placeholders)

        protected_back, back_placeholders = protect_latex(card.answer_markdown)
        back = md.markdown(protected_back, extensions=["extra"])
        back = restore_latex(back, back_placeholders)

        note = genanki.Note(
            model=model,
            fields=[front, back],
            guid=genanki.guid_for(normalize_question(card.question)),
        )
        deck.add_note(note)
        count += 1

    genanki.Package(deck).write_to_file(str(output_path))
    return count


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convertit un fichier Markdown en paquet Anki .apkg. Chaque question doit commencer par '#### '."
    )
    parser.add_argument(
        "input",
        nargs="?",
        default="ANKI/questions_epi.md",
        help="Fichier Markdown source. Défaut: ANKI/questions_epi.md",
    )
    parser.add_argument(
        "-o",
        "--output",
        help="Chemin du fichier .apkg de sortie. Défaut: même nom que le .md",
    )
    parser.add_argument(
        "--deck",
        default=DEFAULT_DECK,
        help=f"Nom du deck Anki. Défaut: {DEFAULT_DECK}",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Valide le parsing et affiche le nombre de cartes sans générer de .apkg.",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    input_path = Path(args.input).expanduser()

    if not input_path.exists():
        print(f"Fichier introuvable: {input_path}", file=sys.stderr)
        return 2
    if input_path.suffix.lower() != ".md":
        print(f"Le fichier doit être un .md: {input_path}", file=sys.stderr)
        return 2

    cards = load_cards(input_path)
    if not cards:
        print("Aucune carte trouvée. Chaque question doit commencer par '#### '.", file=sys.stderr)
        return 1

    empty_answers = [card.question for card in cards if not card.answer_markdown.strip()]
    if empty_answers:
        print(
            "Certaines questions n'ont pas de réponse: " + ", ".join(empty_answers),
            file=sys.stderr,
        )
        return 1

    if args.check:
        print(f"{len(cards)} cartes détectées dans {input_path}")
        return 0

    output_path = Path(args.output).expanduser() if args.output else input_path.with_suffix(".apkg")

    try:
        count = build_apkg(cards, output_path=output_path, deck_name=args.deck)
    except RuntimeError as exc:
        print(str(exc), file=sys.stderr)
        return 2

    print(f"Wrote {output_path} with {count} notes.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
