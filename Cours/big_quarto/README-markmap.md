# Génération automatique de Markmap Interactive

Ce dossier contient la configuration pour générer automatiquement une **markmap interactive** (carte mentale qui se découvre au clic) à partir du document "QUARTO BIG NOTES.md".

## 🎯 Fonctionnement

Lorsque vous rendez le document HTML avec Quarto :
1. Une markmap est automatiquement générée
2. Un lien est ajouté en haut à droite du document HTML
3. La markmap démarre **repliée** et se découvre au clic pour une exploration progressive

## ✨ Fonctionnalités interactives

- **Navigation progressive** : Seuls le titre et les sections principales sont visibles au démarrage
- **Clic pour déplier** : Cliquez sur un nœud pour révéler ses sous-sections
- **Clic pour replier** : Re-cliquez pour masquer les détails
- **Zoom et navigation** : Déplacez et zoomez dans la carte mentale

## 📋 Prérequis

Installer markmap-cli globalement :

```bash
npm install -g markmap-cli
```

## 🚀 Utilisation (simple)

Rendre le document et générer la markmap :

```bash
quarto render "QUARTO BIG NOTES.md" --to html && python3 post-render.py
```

`post-render.py` régénère la markmap et met le lien à jour. Aucun script en arrière-plan nécessaire.

## 📁 Fichiers créés

- `QUARTO BIG NOTES.html` : Document HTML principal avec lien vers la markmap
- `QUARTO-BIG-NOTES-markmap.html` : Markmap interactive

## 🗺️ Accès à la markmap

Une fois le render terminé, ouvrez `QUARTO BIG NOTES.html` dans un navigateur. Vous verrez un bouton "🗺️ Voir la Markmap" en haut à droite qui ouvre la carte mentale interactive.

## 🔧 Configuration

La configuration se trouve dans le YAML header de `QUARTO BIG NOTES.md` :

```yaml
format:
  html:
    include-after-body: markmap-link.html
    post-render: python3 post-render.py
```

Le niveau de repli initial se règle dans `post-render.py` via `initialExpandLevel` (par défaut `2` = titre + H1 visibles).

## 🐛 Dépannage

Si la markmap ne se génère pas :

1. Vérifiez que markmap-cli est installé : `npx markmap-cli --version`
2. Installez-le si nécessaire : `npm install -g markmap-cli`
3. Vérifiez que Python 3 est disponible : `python3 --version`
