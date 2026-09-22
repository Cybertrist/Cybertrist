#!/bin/bash
# Recopie dans docs/ les images que les scripts viennent de rendre.
# Chaque ligne dit : fichier rendu → fichier publié.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
n=0
pose () { [ -f "$1" ] || { echo "  manquant : $1"; return; }; cp "$1" "../$2"; n=$((n+1)); }

for k in microcoaster serenity messagerie dirasm huffman bevannes emargement \
         kyrlcut bodycount gomuscu bf-coach bf-securite bf-manager; do
  pose "png/f-$k.png" "projets/$k.png"
done
pose png/banniere.png         banniere.png
pose png/f-p-cybersas.png     projets/cybersas.png
pose png/f-p-smartbudget.png  projets/smartbudget.png
pose png/f-ch-cybersas.png    chantier/cybersas.png
pose png/f-ch-smartbudget.png chantier/smartbudget.png
pose png/f-ch-bodycount.png   chantier/bodycount.png

for k in quotidien objectif projets chantier stack contact; do
  pose "png/s-$k.png" "sections/$k.png"
done

for k in securite systemes microsoft exploitation assistants; do
  pose "stack/$k.png" "stack/$k.png"
done
for k in securite systemes microsoft exploitation langages web donnees embarque assistants; do
  pose "stack/lab-$k.png" "stack/lab-$k.png"
done

for k in gmail discord instagram spotify adresse; do
  pose "liens/$k.png" "liens/$k.png"
done
pose notes/prive.png notes/prive.png

echo "  $n images posées dans docs/"
