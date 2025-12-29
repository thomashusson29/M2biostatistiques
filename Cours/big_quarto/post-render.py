#!/usr/bin/env python3
"""
Post-render script pour générer automatiquement la markmap avec configuration interactive
"""
import subprocess
import sys
import os
import re

def main():
    # Le fichier markdown source
    md_file = "QUARTO BIG NOTES.md"
    markmap_output = "QUARTO-BIG-NOTES-markmap.html"
    
    print("🗺️  Generating markmap...")
    
    try:
        # Générer la markmap avec markmap-cli
        result = subprocess.run(
            ["npx", "markmap-cli", md_file, "-o", markmap_output],
            capture_output=True,
            text=True,
            check=True
        )
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
        
        const initCollapse = () => {
          attempts++;
          
          const svg = document.querySelector('svg.markmap');
          if (!svg || !svg.__markmap__) {
            if (attempts < maxAttempts) {
              setTimeout(initCollapse, 100);
            }
            return;
          }
          
          const mm = svg.__markmap__;
          
          // Fonction récursive pour replier tous les nœuds au-delà du niveau spécifié
          const collapseFromLevel = (node, currentLevel, targetLevel) => {
            // Replier ce nœud si on est au-delà du niveau cible ET qu'il a des enfants
            if (currentLevel >= targetLevel && node.children && node.children.length > 0) {
              node.payload = node.payload || {};
              node.payload.fold = 1; // 1 = replié
            }
            
            // Continuer récursivement pour tous les enfants
            if (node.children) {
              node.children.forEach(child => {
                collapseFromLevel(child, currentLevel + 1, targetLevel);
              });
            }
          };
          
          try {
            // Replier à partir du niveau 2 (titre visible, H1 visibles, tout le reste replié)
            if (mm.state && mm.state.data) {
              collapseFromLevel(mm.state.data, 0, 2);
              
              // Forcer la mise à jour complète
              mm.setData(mm.state.data);
              
              // Recentrer la vue
              setTimeout(() => {
                mm.fit();
                console.log('✅ Markmap repliée au niveau 2 - cliquez sur les nœuds pour explorer!');
              }, 100);
            }
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
