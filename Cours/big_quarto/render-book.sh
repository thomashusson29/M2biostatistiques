#!/usr/bin/env bash

set -e

# Aller dans le dossier du script (sécurité)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Vérifications minimales
if [ ! -f "_quarto.yml" ]; then
  echo "Erreur : _quarto.yml introuvable"
  exit 1
fi

if [ ! -f "index.qmd" ]; then
  echo "Erreur : index.qmd introuvable (obligatoire pour un book)"
  exit 1
fi

echo "Rendu du book Quarto (PDF)..."

quarto render . --to pdf

echo "OK : rendu terminé"
