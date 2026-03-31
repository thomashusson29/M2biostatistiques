#!/bin/zsh
set -euo pipefail

script_dir=${0:A:h}
docs_dir="/Users/thomashusson/Documents/Projets/M2biostatistiques/docs"

src_poly="$script_dir/poly_revision_nsn.html"
src_index="$script_dir/github_pages/index.html"
src_sem1="$script_dir/github_pages/premier-semestre.html"
pdf_candidates=(
  "$script_dir/poly_revision_nsn.pdf"
  "$script_dir/poly_revision_nsn_magazine.pdf"
  "$script_dir/poly_revision_nsn_weasyprint.pdf"
  "$script_dir/poly_revision_nsn_latex.pdf"
)

dest_poly="$docs_dir/poly_revision_nsn.html"
dest_index="$docs_dir/index.html"
dest_sem1="$docs_dir/premier-semestre.html"
dest_pdf="$docs_dir/poly_revision_nsn.pdf"

if [[ ! -f "$src_poly" ]]; then
  echo "Missing rendered HTML: $src_poly" >&2
  exit 1
fi

if [[ ! -d "$docs_dir" ]]; then
  echo "Missing docs directory: $docs_dir" >&2
  exit 1
fi

/usr/bin/install -m 0644 "$src_poly" "$dest_poly"
/usr/bin/install -m 0644 "$src_index" "$dest_index"
/usr/bin/install -m 0644 "$src_sem1" "$dest_sem1"

for candidate in "${pdf_candidates[@]}"; do
  if [[ -f "$candidate" ]]; then
    /usr/bin/install -m 0644 "$candidate" "$dest_pdf"
    pdf_source="$candidate"
    break
  fi
done

if [[ -z "${pdf_source:-}" ]]; then
  echo "No PDF source found to publish." >&2
  exit 1
fi

echo "Published to docs:"
echo "  - $dest_index"
echo "  - $dest_sem1"
echo "  - $dest_poly"
echo "  - $dest_pdf (from $pdf_source)"
