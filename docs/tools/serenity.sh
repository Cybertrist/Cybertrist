#!/bin/bash
# La carte Serenity, sur le gabarit commun de cartes.sh.
#
# Le cadre néon du logo n'occupe que 87 % du fichier, et son trait réduit
# à la taille de la plaque sortirait crénelé. Le logo est donc cadré
# au-delà de son cadre, à 176 px, et le contour est redessiné en CSS.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ban serenity "#4D8EF7" "#E8434B" "#050A18" \
"<div class='crop' style='border:1.5px solid #4D8EF7C0;box-shadow:0 0 7px #4D8EF730, 0 12px 34px rgba(0,0,0,.5)'><img src='file:///$B/serenity-logo.png' style='width:176px;height:176px'></div>" \
'Seren<em>ity</em>' \
"$(t 'Ton coffre de mots de passe, chez toi. Un agent surveille' 'Your password vault, hosted at home. An agent watches')" \
"$(t 'les fuites, et change ceux que tu lui confies.' 'for breaches, and rotates the ones you trust it with.')" \
"$(P "$(t 'ZÉRO CONNAISSANCE' 'ZERO KNOWLEDGE')" 'LIBSODIUM' "$(t 'AUTO-HÉBERGÉ' 'SELF-HOSTED')" 'AGPL V3')" \
"$(t 'SÉCURITÉ' 'SECURITY')" ""
