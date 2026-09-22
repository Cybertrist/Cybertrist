#!/bin/bash
# Les cartes des trois bots Basic-Fit.
#
# Le glyphe n'est pas dessiné : c'est le logo que le bot porte déjà dans
# Discord, celui de images/logo.png, posé en plaque comme sur MicroCoaster.
# L'accent de chaque carte est donc la couleur du logo. Celui de Sécurité
# est noir : sa carte reste en noir et blanc, et son titre sans rehaut,
# puisqu'il n'y a pas de couleur à reprendre.
#
# Le cartouche dit trois choses : que c'est un bot, à quoi il sert, et que
# le dépôt est privé.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
G="file:///C:/Users/trist/Documents/Github"

ban bf-coach "#8B5CF6" "#6131AD" "#0C0718" \
"<img class='plate' src='$G/Basicfit-Coach/images/logo.png'>" \
'Basic-Fit <em>Coach</em>' \
"Importer son export de compte Basic-Fit, et en tirer ce que l'application" \
"ne montre pas : heatmap, séries, horaires. Et sept calculs de salle." \
"$(P 'DISCORD.JS 14' 'CANVAS' 'UNDICI')" "BOT · FITNESS" "$PRIV"

ban bf-securite "#E8E8E8" "#8A8A8A" "#101010" \
"<img class='plate' src='$G/Basicfit-Securite/images/logo.png'>" \
'Basic-Fit Sécurité' \
"Bannir, expulser, museler, verrouiller un salon, le vider ou le refaire à neuf." \
"Douze commandes de modération, et un rôle de mute défini depuis Discord." \
"$(P 'DISCORD.JS 14' 'PERMISSIONS' 'SANS BASE')" "BOT · MODÉRATION" "$PRIV"

ban bf-manager "#3B82F6" "#2F6CE7" "#050B18" \
"<img class='plate' src='$G/Basicfit-Manager/images/logo.png'>" \
'Basic-Fit <em>Manager</em>' \
"Un salon d'accueil qui ne demande rien à personne : tickets ouverts au menu," \
"rôle donné à l'arrivée, guide envoyé en message privé." \
"$(P 'DISCORD.JS 14' 'TICKETS' 'AUTO-RÔLES')" "BOT · COMMUNAUTÉ" "$PRIV"
