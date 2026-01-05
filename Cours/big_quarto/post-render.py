#!/usr/bin/env python3
"""
Post-render script pour générer automatiquement la markmap avec configuration interactive
"""
import subprocess
import sys
import os
import re
import shutil
from pathlib import Path


def main():
    # Chemin du script
    base_dir = Path(__file__).resolve().parent
    # Le fichier markdown source
    md_file = base_dir / "NOTES_S1_MSR.qmd"
    markmap_output = base_dir / "NOTES_S1_MSR.qmd-markmap.html"
    
    print("🗺️  Generating markmap...")
    
    try:
        # Générer la markmap avec markmap-cli
        markmap_binary = shutil.which("markmap") or shutil.which("markmap-cli")
        if markmap_binary:
            cmd = [markmap_binary, str(md_file), "-o", str(markmap_output), "--offline"]
        else:
            cmd = ["npx", "markmap-cli", str(md_file), "-o", str(markmap_output), "--offline"]
        result = subprocess.run(cmd, cwd=base_dir, capture_output=True, text=True, check=True)
        print("✅ Markmap generated successfully!")
        
        # Modifier le HTML pour ajouter la configuration interactive
        print("🎨 Adding interactive configuration...")
        with open(markmap_output, 'r', encoding='utf-8') as f:
            html_content = f.read()
        
        # Ajouter la configuration pour démarrer avec le niveau 2 seulement déplié
        # et permettre le clic pour déplier progressivement
        config_script = """
    <script>
      // Configuration interactive de la markmap - VERSION ROBUSTE
      (function() {
        let attempts = 0;
        const maxAttempts = 50; // 5 secondes max
        // Profondeur initiale visible (Markmap utilise une profondeur qui commence à 1).
        // 2 => titre + sections principales (H1) visibles, le reste replié.
        const initialExpandLevel = 2;
        
        const initCollapse = async () => {
          attempts++;
          
          const svg = document.querySelector('svg.markmap');
          const mm = window.mm || (svg && svg.__markmap__);
          if (!mm || !mm.state || !mm.state.data) {
            if (attempts < maxAttempts) {
              setTimeout(initCollapse, 100);
            } else {
              console.warn('⚠️  Markmap instance not found; cannot apply initial collapse.');
            }
            return;
          }
          
          try {
            // Replier via l'option native (plus fiable que manipuler directement les nœuds)
            await mm.setData(mm.state.data, { initialExpandLevel });

            // Recentrer la vue
            setTimeout(() => {
              mm.fit();
              console.log(`✅ Markmap repliée (initialExpandLevel=${initialExpandLevel}) - cliquez sur les nœuds pour explorer!`);
            }, 100);
          } catch (error) {
            console.error('❌ Erreur lors du repliement:', error);
          }
        };
        
        // Démarrer l'initialisation
        if (document.readyState === 'loading') {
          document.addEventListener('DOMContentLoaded', initCollapse);
        } else {
          initCollapse();
        }
      })();
    </script>
  </body>"""
        
        # Remplacer la balise </body> par notre script + </body>
        html_content = html_content.replace('</body>', config_script)
        
        # Écrire le fichier modifié
        with open(markmap_output, 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        print("✅ Interactive configuration added!")
        print(f"   Output: {markmap_output}")
        print("   🎯 La markmap démarre repliée - cliquez pour découvrir!")
        return 0
    except subprocess.CalledProcessError as e:
        print("❌ Error generating markmap:")
        print(e.stderr)
        print("\n⚠️  You may need to install markmap-cli:")
        print("   npm install -g markmap-cli")
        return 1
    except FileNotFoundError:
        print("❌ npx not found. Please install Node.js and npm.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
