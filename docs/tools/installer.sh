#!/bin/bash
# Recopie dans docs/ les images que les scripts viennent de rendre.
# LANGUE=fr (défaut) pose dans docs/, LANGUE=en dans docs/en/.
# THEME=clair pose les jumelles claires dans le sous-dossier clair/ de l'un
# ou de l'autre.
# Chaque ligne dit : fichier rendu → fichier publié.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
source "$D/langue.sh"
DEST=".."; [ "$LG" = en ] && DEST="../en"
[ "$THEME" = clair ] && DEST="$DEST/clair"
mkdir -p "$DEST"/projets "$DEST"/liens "$DEST"/langues "$DEST"/sections "$DEST"/stack
n=0
pose () { [ -f "$1" ] || { echo "  manquant : $1"; return; }; cp "$1" "$DEST/$2"; n=$((n+1)); }

for k in serenity bevannes bodycount kyrlcut; do
  pose "png$SUF/f-$k.png" "projets/$k.png"
done
pose "png$SUF/banniere.png"         banniere.png
pose "png$SUF/f-microcoaster.png"    projets/microcoaster-carte.png
pose "png$SUF/f-p-cybersas.png"     projets/cybersas-vpn.png
pose "png$SUF/f-p-smartbudget.png"  projets/smartbudget.png
pose "png$SUF/f-p-aesthetic.png"    projets/aesthetic.png

for k in quotidien objectif projets stack contact; do
  pose "png$SUF/s-$k.png" "sections/$k.png"
done
for k in securite systemes microsoft exploitation langages web donnees embarque assistants; do
  pose "stack$SUF/lab-$k.png" "stack/lab-$k.png"
done

# En clair, les rangées de logos et les tuiles de contact restent celles du
# thème sombre : leurs couleurs de marque tiennent sur les deux fonds. Seuls
# le sélecteur de langue et la pastille d'adresse ont une jumelle.
if [ "$THEME" = clair ]; then
  if [ "$LG" != en ]; then
    pose "liens$SUF/adresse.png" liens/adresse.png
    for k in fr-on fr-off en-on en-off; do pose "langues$SUF/$k.png" "langues/$k.png"; done
  fi
  echo "  $n images posées dans ${DEST#../}"; exit 0
fi

# Les rangées de logos, les tuiles de contact et la pastille d'adresse ne
# portent aucun texte : les deux READMEs pointent sur les mêmes fichiers.
if [ "$LG" != en ]; then
  for k in securite systemes microsoft exploitation assistants; do pose "stack/$k.png" "stack/$k.png"; done
  for k in gmail discord instagram spotify adresse; do pose "liens/$k.png" "liens/$k.png"; done
  for k in fr-on fr-off en-on en-off; do pose "langues/$k.png" "langues/$k.png"; done
fi

echo "  $n images posées dans ${DEST#../}"
