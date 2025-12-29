# ✅ Markmap automatique (setup terminé)

## 📌 Ce qui est en place

- Bouton "🗺️ Voir la Markmap" en haut à droite de `QUARTO BIG NOTES.html`
- Hook `post-render.py` (appelé via la tâche VS Code) qui génère la markmap après le render HTML
- Markmap repliée par défaut (titre + sections principales visibles)
- YAML configuré dans `QUARTO BIG NOTES.md` :
  ```yaml
  format:
    html:
      include-after-body: markmap-link.html
      post-render: python3 post-render.py
  ```

## 🚀 Utilisation simple (terminal)

```bash
quarto render "QUARTO BIG NOTES.md" --to html && python3 post-render.py
```

Le render HTML est suivi de `post-render.py`, qui régénère `QUARTO-BIG-NOTES-markmap.html` et met le bouton à jour. Aucun script de surveillance n'est nécessaire.

## 🧰 Utilisation via VS Code

1. Cmd+Shift+P → "Run Task"
2. Choisir **Render QUARTO BIG NOTES (HTML + markmap)** (tâche par défaut, inclut `python3 post-render.py`)
3. Optionnel : tâche **Render Quarto book (PDF)** si besoin du PDF complet

## 📂 Fichiers utiles

- `post-render.py` : génération markmap + pliage initial
- `markmap-link.html` : bouton d'accès à la carte
- `README-markmap.md` : guide rapide

## 🗺️ Accès à la carte

Après render, ouvrir `QUARTO BIG NOTES.html` et cliquer sur le bouton "🗺️ Voir la Markmap" (ouvre `QUARTO-BIG-NOTES-markmap.html`).

## 🐛 Dépannage rapide

- Vérifier markmap-cli : `npx markmap-cli --version` (installer si besoin : `npm install -g markmap-cli`)
- Vérifier Python : `python3 --version`

---

La markmap se met à jour à chaque render. Aucun watcher ou script annexe n'est requis. 🎉
