#!/bin/bash
# La carte « En chantier » de BodyCount. L'application tourne et sa
# version 1.0.0 est publiée ; elle reste au chantier le temps de s'user à
# l'usage. La carte dit donc ce qu'elle est, comme celle des projets, et
# son cartouche porte la catégorie : une application mobile, pour adultes.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ban ch-bodycount "#E879F9" "#7C3AED" "#0A0410" \
"<div class='crop'><img src='$ICONE'></div>" \
'Body<em>Count</em>' \
"$(t 'Journal personnel chiffré, hors ligne, sur Android.' 'An encrypted personal journal, offline, on Android.')" \
"$(t 'Aucun serveur, aucun compte, aucune télémétrie.' 'No server, no account, no telemetry.')" \
"$(P 'FLUTTER' 'SQLCIPHER' "$(t 'BIOMÉTRIE' 'BIOMETRICS')")" \
"$(t 'MOBILE · ADULTE' 'MOBILE · ADULT')" ""
