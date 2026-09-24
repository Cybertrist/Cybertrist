#!/bin/bash
# Recopie dans docs/ les images que les scripts viennent de rendre.
# LANGUE=fr (défaut) pose dans docs/, LANGUE=en dans docs/en/.
# Chaque ligne dit : fichier rendu → fichier publié.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
source "$D/langue.sh"
DEST=".."; [ "$LG" = en ] && DEST="../en"
mkdir -p "$DEST"/projets "$DEST"/liens "$DEST"/langues "$DEST"/sections "$DEST"/stack
n=0
pose () { [ -f "$1" ] || { echo "  manquant : $1"; return; }; cp "$1" "$DEST/$2"; n=$((n+1)); }

for k in microcoaster serenity bevannes bodycount kyrlcut; do
  pose "png$SUF/f-$k.png" "projets/$k.png"
done
pose "png$SUF/banniere.png"         banniere.png
pose "png$SUF/f-p-cybersas.png"     projets/cybersas.png
pose "png$SUF/f-p-smartbudget.png"  projets/smartbudget.png

for k in quotidien objectif projets stack contact; do
  pose "png$SUF/s-$k.png" "sections/$k.png"
done
for k in securite systemes microsoft exploitation langages web donnees embarque assistants; do
  pose "stack$SUF/lab-$k.png" "stack/lab-$k.png"
done

# Les rangées de logos, les tuiles de contact et la pastille d'adresse ne
# portent aucun texte : les deux READMEs pointent sur les mêmes fichiers.
if [ "$LG" != en ]; then
  for k in securite systemes microsoft exploitation assistants; do pose "stack/$k.png" "stack/$k.png"; done
  for k in gmail discord instagram spotify adresse; do pose "liens/$k.png" "liens/$k.png"; done
  for k in fr-on fr-off en-on en-off; do pose "langues/$k.png" "langues/$k.png"; done
fi

echo "  $n images posées dans ${DEST#../}"
