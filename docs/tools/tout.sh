#!/bin/bash
# Refait toutes les images du README, puis les repose dans docs/.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for s in banniere sections projets serenity basicfit gomuscu cybersas smartbudget \
         bodycount stack-tuiles stack-intitules contact note; do
  echo "$s.sh"
  bash "$D/$s.sh"
done
bash "$D/installer.sh"
