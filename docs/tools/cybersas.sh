#!/bin/bash
# La carte de CyberSas : mon propre VPN, écrit de bout en bout. Son
# cartouche porte les catégories, puis l'état.
#
# Le logo porte déjà son propre badge arrondi, qui n'occupe que 85,6 % de
# l'image : posé tel quel dans la plaque, il laissait voir une marge morte
# et un double contour. Il est donc agrandi à 174 px dans une fenêtre de
# 142 pour que son bord tombe sur celui de la plaque.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
L="file:///$B/cybersas-logo.png"
GL="<div class='crop'><img src='$L' style='width:174px;height:174px'></div>"
T='Cyber<em>Sas</em>'
L1="$(t 'Mon propre VPN, écrit de bout en bout. Un serveur qui relaie' 'My own VPN, written end to end. A server that relays without')"
L2="$(t "sans lire, et c'est le doigt de l'admin qui décide qui entre." "reading, and the admin's fingerprint decides who gets in.")"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-cybersas "#31E7FD" "#01B9FD" "#060F16" "$GL" "$T" "$L1" "$L2" \
"$(P 'GO' 'NOISE IK' 'ED25519' 'FLUTTER')" "VPN</b><b>ANDROID" "<i>$ETAT</i>"
