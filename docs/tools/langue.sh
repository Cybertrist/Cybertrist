#!/bin/bash
# La bascule de langue, partagée par tous les scripts de rendu.
#
# LANGUE=fr (par défaut) rend le README français dans png/, stack/, liens/
# et notes/. LANGUE=en rend l'anglais dans les mêmes dossiers suffixés -en.
# installer.sh repose ensuite les uns dans docs/, les autres dans docs/en/.
#
# t <français> <anglais> choisit la chaîne. Chaque texte du README vit donc
# à un seul endroit, ses deux versions côte à côte : en corriger une sans
# voir l'autre est impossible.
LG="${LANGUE:-fr}"
SUF=""; [ "$LG" = en ] && SUF="-en"
t () { if [ "$LG" = en ]; then printf '%s' "$2"; else printf '%s' "$1"; fi; }

# La bascule de thème, sur le même modèle. GitHub affiche la page sur
# fond noir ou sur fond blanc selon le réglage du visiteur, et le README
# sert l'une ou l'autre série d'images par une balise <picture>.
#
# THEME=sombre (par défaut) rend les images actuelles. THEME=clair rend
# leurs jumelles dans les mêmes dossiers suffixés -clair, que installer.sh
# pose dans docs/clair/ et docs/en/clair/.
#
# c <sombre> <clair> choisit la couleur, comme t choisit la langue.
THEME="${THEME:-sombre}"
[ "$THEME" = clair ] && SUF="$SUF-clair"
c () { if [ "$THEME" = clair ]; then printf '%s' "$2"; else printf '%s' "$1"; fi; }
