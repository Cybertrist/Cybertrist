#!/bin/bash
# Refait toutes les images des deux READMEs, puis les repose dans docs/
# pour le français et docs/en/ pour l'anglais.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS="banniere sections projets serenity basicfit gomuscu cybersas smartbudget
         stack-tuiles stack-intitules contact note"

echo "pastilles.sh"; bash "$D/pastilles.sh"

for LG in fr en; do
  echo; echo "=== $LG ==="
  for s in $SCRIPTS; do
    # Les rangées de logos et les tuiles de contact ne portent aucun texte :
    # les deux pages pointent sur les mêmes fichiers, inutile de les refaire.
    if [ "$LG" = en ] && { [ "$s" = stack-tuiles ] || [ "$s" = contact ]; }; then continue; fi
    echo "$s.sh"
    LANGUE=$LG bash "$D/$s.sh"
  done
  LANGUE=$LG bash "$D/installer.sh"
done
