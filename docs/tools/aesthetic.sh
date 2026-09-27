#!/bin/bash
# La carte d'ÆSTHETIC : ma propre application de santé, musculation,
# nutrition, sommeil et coach IA. Son cartouche porte les catégories, puis
# l'état.
#
# La carte reste sobre, accent gris clair. Seul le Æ reprend le rouge du
# logo, un cran plus doux (#EE1C25), comme sur la bannière du dépôt.
#
# Le logo porte son propre badge sombre, qui n'occupe que 80 % du fichier.
# Il est donc agrandi à 184 px dans la fenêtre de 142 pour que la plaque
# coupe à l'intérieur du badge, comme sur la bannière du dépôt.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/aesthetic-logo.png"
GL="<div class='crop'><img src='$L' style='width:184px;height:184px'></div>"
T='<em>Æ</em>STHETIC'
EM="#EE1C25"
EMS="$(c 'text-shadow:0 0 22px #EE1C2540' '')"
export EM EMS
L1="$(t 'Ma propre application de santé : musculation, nutrition, sommeil et un coach IA.' 'My own health app: training, nutrition, sleep and an AI coach.')"
L2="$(t 'Tout au même endroit, pour devenir la meilleure version de moi-même.' 'All in one place, to become the best version of myself.')"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-aesthetic "$(c '#D4D4D4' '#262626')" "#737373" "$(c '#0A0A0A' '#FFFFFF')" "$GL" "$T" "$L1" "$L2" \
"$(P 'NUTRITION' "$(t 'SOMMEIL' 'SLEEP')" "$(t 'COACH IA' 'AI COACH')" 'FLUTTER')" \
"$(C 'MOBILE' "$(t 'SANTÉ' 'HEALTH')" "$(t 'MUSCULATION' 'STRENGTH')")" "<i>$ETAT</i>"
