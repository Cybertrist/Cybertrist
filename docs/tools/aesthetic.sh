#!/bin/bash
# La carte d'ÆSTHETIC : mon suivi complet, musculation, nutrition, santé
# et coach IA. Son cartouche porte les catégories, puis l'état.
#
# L'application est en noir et blanc : la carte aussi, accent gris clair,
# aucune couleur vive. Seul le logo garde sa lueur.
#
# Le logo porte son propre badge sombre, qui n'occupe que 80 % du fichier.
# Il est donc agrandi à 184 px dans la fenêtre de 142 pour que la plaque
# coupe à l'intérieur du badge, comme sur la bannière du dépôt.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/aesthetic-logo.png"
GL="<div class='crop'><img src='$L' style='width:184px;height:184px'></div>"
T='<em>Æ</em>STHETIC'
L1="$(t 'Musculation, nutrition et santé, avec un coach IA qui connaît mes séances.' 'Training, nutrition and health, with an AI coach that knows my workouts.')"
L2="$(t 'Simple, en noir et blanc, et tout mon historique Lyfta repris.' 'Simple, black and white, with my whole Lyfta history brought over.')"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-aesthetic "$(c '#D4D4D4' '#262626')" "#737373" "$(c '#0A0A0A' '#FFFFFF')" "$GL" "$T" "$L1" "$L2" \
"$(P 'FLUTTER' "$(t 'COACH IA' 'AI COACH')" 'HEALTH CONNECT' "$(t 'HORS LIGNE' 'OFFLINE')")" \
"$(C 'MOBILE' "$(t 'MUSCULATION' 'STRENGTH')" 'NUTRITION')" "<i>$ETAT</i>"
