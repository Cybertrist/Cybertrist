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
"$(t "Importer son export de compte Basic-Fit, et en tirer ce que l'application" 'Import your Basic-Fit account export, and pull out what the app')" \
"$(t 'ne montre pas : heatmap, séries, horaires. Et sept calculs de salle.' 'never shows: heatmaps, streaks, time of day. Plus seven gym calculators.')" \
"$(P 'DISCORD.JS 14' 'CANVAS' 'UNDICI')" "BOT · FITNESS" "$PRIV"

ban bf-securite "#E8E8E8" "#8A8A8A" "#101010" \
"<img class='plate' src='$G/Basicfit-Securite/images/logo.png'>" \
"$(t 'Basic-Fit Sécurité' 'Basic-Fit Security')" \
"$(t 'Bannir, expulser, museler, verrouiller un salon, le vider ou le refaire à neuf.' 'Ban, kick, mute, lock a channel, purge it or rebuild it from scratch.')" \
"$(t 'Douze commandes de modération, et un rôle de mute défini depuis Discord.' 'Twelve moderation commands, and a mute role set from inside Discord.')" \
"$(P 'DISCORD.JS 14' 'PERMISSIONS' "$(t 'SANS BASE' 'NO DATABASE')")" \
"$(t 'BOT · MODÉRATION' 'BOT · MODERATION')" "$PRIV"

ban bf-manager "#3B82F6" "#2F6CE7" "#050B18" \
"<img class='plate' src='$G/Basicfit-Manager/images/logo.png'>" \
'Basic-Fit <em>Manager</em>' \
"$(t "Un salon d'accueil qui ne demande rien à personne : tickets ouverts au menu," 'A welcome channel that asks nothing of anyone: tickets opened from a menu,')" \
"$(t "rôle donné à l'arrivée, guide envoyé en message privé." 'a role granted on arrival, the guide sent by direct message.')" \
"$(P 'DISCORD.JS 14' 'TICKETS' "$(t 'AUTO-RÔLES' 'AUTO-ROLES')")" \
"$(t 'BOT · COMMUNAUTÉ' 'BOT · COMMUNITY')" "$PRIV"
