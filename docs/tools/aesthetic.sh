#!/bin/bash
# La carte d'ÆSTHETIC : mon suivi de musculation, calqué sur Lyfta. Son
# cartouche porte les catégories, puis l'état.
#
# Le logo porte son propre badge sombre, qui n'occupe que 80 % du fichier.
# Il est donc agrandi à 184 px dans la fenêtre de 142 pour que la plaque
# coupe à l'intérieur du badge, comme sur la bannière du dépôt.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/aesthetic-logo.png"
GL="<div class='crop'><img src='$L' style='width:184px;height:184px'></div>"
T='<em>Æ</em>STHETIC'
L1="$(t 'Le suivi de musculation de Lyfta, refait pour moi, sans abonnement.' 'Lyfta-style workout tracking, rebuilt for myself, with no subscription.')"
L2="$(t 'Séances, records, streak et analyses, avec tout mon historique importé.' 'Workouts, records, streaks and insights, with my whole history imported.')"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-aesthetic "$(c '#FF2B2B' '#D61C1C')" "#8A0A12" "$(c '#0A0506' '#FDF6F6')" "$GL" "$T" "$L1" "$L2" \
"$(P 'FLUTTER' "$(t 'HORS LIGNE' 'OFFLINE')" "$(t 'IMPORT CSV' 'CSV IMPORT')")" \
"$(C 'MOBILE' "$(t 'MUSCULATION' 'STRENGTH TRAINING')")" "<i>$ETAT</i>"
