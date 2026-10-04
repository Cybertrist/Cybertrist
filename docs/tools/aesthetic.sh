#!/bin/bash
# La carte d'AESTHETICS : mon application de musculation. Son cartouche
# porte les catégories, puis l'état.
#
# Le nom est tout en blanc, comme dans l'application : plus de « Æ » rouge.
# La carte reste sobre, accent gris clair, et le rouge des muscles ne
# sert qu'au trait du bas.
#
# Le logo est une silhouette blanche sur un carré noir qui remplit tout le
# fichier : il est posé tel quel, en plaque arrondie.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/aesthetic-logo.png"
GL="<img class='plate' src='$L'>"
T='AESTHETICS'
L1="$(t 'Mon application de musculation : la séance, le minuteur, les records.' 'My strength training app: the workout, the rest timer, the records.')"
L2="$(t 'Chaque série comptée, pour devenir la meilleure version de moi-même.' 'Every set counted, to become the best version of myself.')"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-aesthetic "$(c '#D4D4D4' '#262626')" "#E0393E" "$(c '#0A0A0A' '#FFFFFF')" "$GL" "$T" "$L1" "$L2" \
"$(P 'FLUTTER' "$(t '608 EXERCICES' '608 EXERCISES')" "$(t 'HORS LIGNE' 'OFFLINE')")" \
"$(C 'MOBILE' "$(t 'MUSCULATION' 'STRENGTH')")" "<i>$ETAT</i>"
