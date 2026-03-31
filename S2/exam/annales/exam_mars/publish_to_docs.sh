#!/bin/zsh
set -euo pipefail

script_dir=${0:A:h}
docs_dir="/Users/thomashusson/Documents/Projets/M2biostatistiques/docs"

src_index="$script_dir/github_pages/index.html"
src_sem1="$script_dir/github_pages/premier-semestre.html"
src_sem2="$script_dir/github_pages/deuxieme-semestre.html"

if [[ ! -d "$docs_dir" ]]; then
  echo "Missing docs directory: $docs_dir" >&2
  exit 1
fi

publish_html_if_present() {
  local base_name="$1"
  local src_file="$script_dir/$base_name"
  local dest_file="$docs_dir/$base_name"

  if [[ -f "$src_file" ]]; then
    /usr/bin/install -m 0644 "$src_file" "$dest_file"
    echo "  - $dest_file"
  else
    echo "  - skipped missing HTML: $src_file"
  fi
}

publish_pdf_if_present() {
  local src_file="$1"
  local dest_file="$2"

  if [[ -f "$src_file" ]]; then
    /usr/bin/install -m 0644 "$src_file" "$dest_file"
    echo "  - $dest_file"
  fi
}

/usr/bin/install -m 0644 "$src_index" "$docs_dir/index.html"
/usr/bin/install -m 0644 "$src_sem1" "$docs_dir/premier-semestre.html"
/usr/bin/install -m 0644 "$src_sem2" "$docs_dir/deuxieme-semestre.html"

echo "Published to docs:"
echo "  - $docs_dir/index.html"
echo "  - $docs_dir/premier-semestre.html"
echo "  - $docs_dir/deuxieme-semestre.html"

publish_html_if_present "poly_revision_nsn.html"
publish_html_if_present "poly_revision_RC_codex.html"
publish_html_if_present "poly_revision_epi_codex.html"

publish_pdf_if_present "$script_dir/poly_revision_nsn.pdf" "$docs_dir/poly_revision_nsn.pdf"
publish_pdf_if_present "$script_dir/poly_revision_RC_codex.pdf" "$docs_dir/poly_revision_RC_codex.pdf"
publish_pdf_if_present "$script_dir/poly_revision_epi_codex.pdf" "$docs_dir/poly_revision_epi_codex.pdf"
