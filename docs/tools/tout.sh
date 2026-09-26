#!/bin/bash
# Refait toutes les images des deux READMEs, dans les deux thèmes, puis les
# repose dans docs/ pour le français, docs/en/ pour l'anglais, et leur
# sous-dossier clair/ pour les jumelles claires.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS="banniere sections projets serenity cybersas smartbudget aesthetic
         stack-tuiles stack-intitules contact"

for TH in sombre clair; do
  echo; echo "##### $TH"
  echo "pastilles.sh"; THEME=$TH bash "$D/pastilles.sh"
  for LG in fr en; do
    echo; echo "=== $LG ==="
    for s in $SCRIPTS; do
      # Les rangées de logos et les tuiles de contact ne portent aucun texte :
      # les deux pages pointent sur les mêmes fichiers, inutile de les refaire.
      if [ "$LG" = en ] && { [ "$s" = stack-tuiles ] || [ "$s" = contact ]; }; then continue; fi
      # Les rangées de logos gardent leurs couleurs de marque en clair.
      if [ "$TH" = clair ] && [ "$s" = stack-tuiles ]; then continue; fi
      echo "$s.sh"
      LANGUE=$LG THEME=$TH bash "$D/$s.sh"
    done
    LANGUE=$LG THEME=$TH bash "$D/installer.sh"
  done
done
