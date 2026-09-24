#!/bin/bash
# Les huit cartes de projet qui suivent le gabarit commun. Serenity a le
# sien, dans serenity.sh.
# Les bots Discord sont dans basicfit.sh et gomuscu.sh, les deux chantiers
# dans cybersas.sh et smartbudget.sh.
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

ban messagerie "#5B8DEF" "#1E40AF" "#03071A" \
'<svg viewBox="0 0 132 132" fill="none"><rect x="6" y="30" width="120" height="84" rx="11" stroke="#E8EFF6" stroke-width="6"/><path d="M8 38 66 80 124 38" stroke="#E8EFF6" stroke-width="6" stroke-linecap="round" stroke-linejoin="round"/><path d="M52 92V78a14 14 0 0 1 28 0v14" stroke="#5B8DEF" stroke-width="7" stroke-linecap="round"/><rect x="44" y="90" width="44" height="32" rx="7" fill="#5B8DEF"/><circle cx="66" cy="103" r="5" fill="#03071A"/><path d="M66 107v8" stroke="#03071A" stroke-width="5" stroke-linecap="round"/></svg>' \
"$(t 'Messagerie <em>chiffrée</em>' 'Encrypted <em>messaging</em>')" \
"$(t 'Construire un protocole RSA / AES, puis le casser,' 'Build an RSA / AES protocol, then break it:')" \
"$(t 'MITM et usurpation, puis le réparer par signature.' 'MITM and spoofing, then fix it with signatures.')" \
"$(P 'RSA 2048' 'AES' 'MITM' 'PYTHON')" \
"$(t 'CRYPTOGRAPHIE' 'CRYPTOGRAPHY')" ""

ban dirasm "#FFAE42" "#FF6B35" "#120C05" \
'<svg viewBox="0 0 132 132" fill="none"><rect x="26" y="26" width="80" height="80" rx="8" stroke="#E8EFF6" stroke-width="6"/><rect x="48" y="48" width="36" height="36" rx="4" fill="#FFAE42"/><g stroke="#E8EFF6" stroke-width="5.5" stroke-linecap="round"><path d="M45 26V8M66 26V8M87 26V8M45 106v18M66 106v18M87 106v18M26 45H8M26 66H8M26 87H8M106 45h18M106 66h18M106 87h18"/></g></svg>' \
'Dir <em>ASM</em>' \
"$(t 'La commande dir /s réécrite en assembleur x86,' 'The dir /s command rewritten in x86 assembly:')" \
"$(t 'sans macro, sans runtime, appels Win32 bruts.' 'no macros, no runtime, raw Win32 calls.')" \
"$(P 'MASM32' 'x86' 'WIN32 API')" \
"$(t 'BAS NIVEAU' 'LOW LEVEL')" ""

ban huffman "#FB7185" "#FDA4AF" "#160A0E" \
'<svg viewBox="0 0 132 132" fill="none"><g stroke="#4A5568" stroke-width="5" stroke-linecap="round"><path d="M66 28 32 66M66 28l34 38M32 66 14 108M32 66l18 42M100 66l18 42"/></g><circle cx="66" cy="24" r="13" fill="#E8EFF6"/><circle cx="32" cy="66" r="11" fill="#FB7185"/><circle cx="100" cy="66" r="11" fill="#E8EFF6"/><circle cx="14" cy="112" r="9" fill="#FDA4AF"/><circle cx="50" cy="112" r="9" fill="#E8EFF6"/><circle cx="118" cy="112" r="9" fill="#E8EFF6"/></svg>' \
"$(t 'Codage de <em>Huffman</em>' '<em>Huffman</em> coding')" \
"$(t "Trois façons de construire l'arbre : figée, calculée," 'Three ways to build the tree: fixed, computed,')" \
"$(t 'ou reconstruite à la volée au fil du flux.' 'or rebuilt on the fly as the stream goes by.')" \
"$(P 'PYTHON' 'COMPRESSION' "$(t 'ADAPTATIF' 'ADAPTIVE')")" \
"$(t 'ALGORITHMIQUE' 'ALGORITHMS')" ""

# Le cadre néon du logo n'occupe que 77 % du fichier : cadré au-delà, à
# 198 px, et contour redessiné en CSS pour rester net.
ban bevannes "#39D2C0" "#A7F3E6" "#04130F" \
"<div class='crop' style='border:1.5px solid #39D2C0C0;box-shadow:0 0 7px #39D2C030, 0 12px 34px rgba(0,0,0,.5)'><img src='file:///$B/bevannes-logo.png' style='width:198px;height:198px'></div>" \
'Be<em>Vannes</em>' \
"$(t 'BeReal rencontre GeoGuessr : un lieu tiré au sort chaque jour,' 'BeReal meets GeoGuessr: a spot drawn at random every day,')" \
"$(t 'et la photo ne compte que si le GPS confirme que vous y êtes.' 'and the photo only counts if GPS says you were there.')" \
"$(P 'FLUTTER' 'FIREBASE' "$(t 'GÉOLOCALISATION' 'GEOLOCATION')")" \
"$(C 'MOBILE' "$(t 'GÉOGRAPHIE' 'GEOGRAPHY')" 'PHOTO' "$(t 'JEU' 'GAME')")" ""

ban emargement "#22D3EE" "#3B82F6" "#06111A" \
'<svg viewBox="0 0 132 132" fill="none"><rect x="10" y="26" width="112" height="98" rx="11" stroke="#E8EFF6" stroke-width="6"/><path d="M10 56h112" stroke="#E8EFF6" stroke-width="6"/><path d="M38 26V8M94 26V8" stroke="#E8EFF6" stroke-width="6" stroke-linecap="round"/><path d="M38 90l20 18 38-38" stroke="#22D3EE" stroke-width="11" stroke-linecap="round" stroke-linejoin="round"/></svg>' \
"$(t 'Émargement <em>UBS</em>' 'UBS <em>sign-in</em>')" \
"$(t 'Émarger sur Moodle en une ligne de commande.' 'Signing the Moodle attendance sheet, in one command.')" \
"$(t 'Pas de crontab, pas de service.' 'No crontab, no service.')" \
"$(P 'PYTHON' 'SELENIUM' 'HEADLESS')" \
"$(t 'AUTOMATISATION' 'AUTOMATION')" ""

# Le badge néon du logo n'occupe que 80 % du fichier, et son trait réduit
# à la taille de la plaque sortirait crénelé. Le logo est donc cadré
# au-delà de son cadre, à 190 px, et le contour est redessiné en CSS.
ban kyrlcut "#C26BFF" "#FFB3C8" "#100322" \
"<div class='crop' style='border:1.5px solid #B45CFFC0;box-shadow:0 0 7px #B45CFF30, 0 12px 34px rgba(0,0,0,.5)'><img src='file:///$B/kyrlcut-logo.png' style='width:190px;height:190px'></div>" \
'Kyrl<em>Cut</em>' \
"$(t 'Réservation en ligne pour salon de coiffure, sur code' 'Online booking for a hair salon, by invitation code')" \
"$(t "d'invitation. En production sur kyrlcut.fr." 'only. Live at kyrlcut.fr.')" \
"$(P 'EXPRESS' 'MYSQL' 'BCRYPT')" \
"$(C 'WEB' 'MOBILE' "$(t 'COIFFURE' 'HAIR SALON')")" "$PRIV"

ban bodycount "#E879F9" "#7C3AED" "#0A0410" \
"<div class='crop'><img src='$ICONE'></div>" \
'Body<em>Count</em>' \
"$(t 'Journal personnel chiffré, hors ligne, sur Android.' 'An encrypted personal journal, offline, on Android.')" \
"$(t 'Aucun serveur, aucun compte, aucune télémétrie.' 'No server, no account, no telemetry.')" \
"$(P 'FLUTTER' 'SQLCIPHER' "$(t 'BIOMÉTRIE' 'BIOMETRICS')")" \
"$(C 'MOBILE' "$(t 'ADULTE' 'ADULT')")" ""
