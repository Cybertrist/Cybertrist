#!/bin/bash
# Les quatre cartes de projet qui suivent le gabarit commun. Serenity a le
# sien, dans serenity.sh.
# CyberSas et Smart Budget sont dans cybersas.sh et smartbudget.sh.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas une traduction mot à mot : une tournure qui claque en français
# tombe à plat traduite littéralement, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ban microcoaster "#E8E8E8" "#8A8A8A" "#141414" \
"<img class='plate' src='$LOGO'>" \
'Micro<em>Coaster</em>™' \
"$(t 'Une carte conçue de zéro, son firmware,' 'A board designed from scratch, its firmware,')" \
"$(t "et l'application web qui la pilote." 'and the web app that drives it.')" \
"$(P "$(t 'CONCEPTION PCB' 'PCB DESIGN')" 'FIRMWARE' 'IoT' 'HTTPS')" \
"$(t 'EMBARQUÉ' 'EMBEDDED')" ""

# Le cadre néon du logo n'occupe que 77 % du fichier : cadré au-delà, à
# 198 px, et contour redessiné en CSS pour rester net.
ban bevannes "#39D2C0" "#A7F3E6" "#04130F" \
"<div class='crop' style='border:1.5px solid #39D2C0C0;box-shadow:0 0 7px #39D2C030, 0 12px 34px rgba(0,0,0,.5)'><img src='file:///$B/bevannes-logo.png' style='width:198px;height:198px'></div>" \
'Be<em>Vannes</em>' \
"$(t 'BeReal rencontre GeoGuessr : un lieu tiré au sort chaque jour,' 'BeReal meets GeoGuessr: a spot drawn at random every day,')" \
"$(t 'et la photo ne compte que si le GPS confirme que vous y êtes.' 'and the photo only counts if GPS says you were there.')" \
"$(P 'FLUTTER' 'FIREBASE' "$(t 'GÉOLOCALISATION' 'GEOLOCATION')")" \
"$(C 'MOBILE' "$(t 'GÉOGRAPHIE' 'GEOGRAPHY')" 'PHOTO' "$(t 'JEU' 'GAME')")" ""

ban bodycount "#E879F9" "#7C3AED" "#0A0410" \
"<div class='crop'><img src='$ICONE'></div>" \
'Body<em>Count</em>' \
"$(t 'Journal personnel chiffré, hors ligne, sur Android.' 'An encrypted personal journal, offline, on Android.')" \
"$(t 'Aucun serveur, aucun compte, aucune télémétrie.' 'No server, no account, no telemetry.')" \
"$(P 'FLUTTER' 'SQLCIPHER' "$(t 'BIOMÉTRIE' 'BIOMETRICS')")" \
"$(C 'MOBILE' "$(t 'ADULTE' 'ADULT')")" ""

# Le badge néon du logo n'occupe que 80 % du fichier, et son trait réduit
# à la taille de la plaque sortirait crénelé. Le logo est donc cadré
# au-delà de son cadre, à 190 px, et le contour est redessiné en CSS.
ban kyrlcut "#C26BFF" "#FFB3C8" "#100322" \
"<div class='crop' style='border:1.5px solid #B45CFFC0;box-shadow:0 0 7px #B45CFF30, 0 12px 34px rgba(0,0,0,.5)'><img src='file:///$B/kyrlcut-logo.png' style='width:190px;height:190px'></div>" \
'Kyrl<em>Cut</em>' \
"$(t 'Réservation en ligne pour salon de coiffure, sur invitation.' 'Online booking for a hair salon, by invitation only.')" \
"$(t 'Créneaux au quart d’heure, rappel par email la veille.' 'Quarter-hour slots, an email reminder the day before.')" \
"$(P 'EXPRESS' 'MYSQL' 'BCRYPT')" \
"$(C 'WEB' 'MOBILE' "$(t 'COIFFURE' 'HAIR SALON')")" "$PRIV"
