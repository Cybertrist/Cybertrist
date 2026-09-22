#!/bin/bash
# La carte « En chantier » de BodyCount : ce qu'il reste à faire sur un
# dépôt déjà publié. Le cartouche porte l'état, pas la catégorie.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ban ch-bodycount "#E879F9" "#7C3AED" "#0A0410" \
"<div class='crop'><img src='$ICONE'></div>" \
'Body<em>Count</em>' \
"Le chiffrement de la base manque encore : SQLCipher et clé dérivée du" \
"Keystore. La biométrie verrouille l'interface, elle ne chiffre rien." \
"$(P 'SQLCIPHER' 'EXPORT CHIFFRÉ' 'ÉCRANS À FINIR')" "À FINIR" ""
