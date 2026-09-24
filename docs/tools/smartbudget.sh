#!/bin/bash
# La carte de Smart Budget. L'application tourne sur le compte réel
# et sa version 1.0.2 est publiée : comme BodyCount, la carte ne porte plus
# d'état, seulement ses catégories, et ses pastilles disent de quoi elle
# est faite.
#
# Le contour néon n'est pas celui du fichier source. Réduit de 1254 px à
# la taille d'affichage, son trait ne pesait plus que deux pixels et demi
# et sortait crénelé, doublé qui plus est par l'arc du masque de la
# plaque, à un rayon différent. Le logo est donc cadré au-delà de son
# cadre, à 182 px, et le contour est redessiné en CSS : net à toute
# échelle, un seul arc, et un halo réglé pour rester aussi sobre que
# l'original.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/smartbudget-logo.png"
A="#50F48D"
NEON="border:1.5px solid ${A}C0;box-shadow:0 0 7px ${A}30, 0 12px 34px rgba(0,0,0,.5)"
T='Smart <em>Budget</em>'
L1="$(t "Arrêter de dépenser sans regarder, et de piocher dans l'épargne." 'Stop spending blind, and stop dipping into the savings.')"
L2="$(t 'Le compte lu par la DSP2, classé et chiffré sur le téléphone.' 'The account read over PSD2, sorted and encrypted on the phone.')"
GL="<div class='crop' style='$NEON'><img src='$L' style='width:182px;height:182px'></div>"
PASTILLE="$(P 'FLUTTER' "$(t 'DSP2' 'PSD2')" 'SQLCIPHER')"

ban p-smartbudget "$A" "#1BCC6D" "#02120A" "$GL" "$T" "$L1" "$L2" \
"$PASTILLE" "$(C 'MOBILE' 'FINANCE')" ""
