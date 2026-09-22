#!/bin/bash
# Les deux cartes de Smart Budget.
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
L="file:///$B/../chantier/smartbudget-logo.png"
A="#50F48D"
NEON="border:1.5px solid ${A}C0;box-shadow:0 0 7px ${A}30, 0 12px 34px rgba(0,0,0,.5)"
T='Smart <em>Budget</em>'
L1="Le compte relié, un label sur chaque dépense : courses, sortie, voyage."
L2="Suggéré par le libellé, posé à la main. Entrées, sorties, le mois en graphique."
GL="<div class='crop' style='$NEON'><img src='$L' style='width:182px;height:182px'></div>"

# Carte de la grille de projets : catégorie, puis état.
ban p-smartbudget "$A" "#1BCC6D" "#02120A" "$GL" "$T" "$L1" "$L2" \
"$(P 'À DÉFINIR')" "FINANCES" '<i>PLANIFIÉ</i>'

# Carte de la section « En chantier » : l'état seul tient lieu de cartouche.
ban ch-smartbudget "$A" "#1BCC6D" "#02120A" "$GL" "$T" "$L1" "$L2" \
"$(P 'À DÉFINIR')" "PLANIFIÉ" ""
