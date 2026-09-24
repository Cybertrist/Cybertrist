#!/bin/bash
# La carte de CyberSas, le seul projet dont le dépôt n'existe pas encore :
# son cartouche porte la catégorie, puis l'état.
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
L1="$(t "Exposer ce qui doit l'être, et rien d'autre : un point d'entrée unique," 'Expose what has to be exposed, and nothing else: a single way in,')"
L2="$(t 'terminaison TLS, et un tunnel privé pour le reste.' 'TLS terminated there, and a private tunnel for the rest.')"
ETAT="$(t 'EN COURS' 'IN PROGRESS')"

ban p-cybersas "#31E7FD" "#01B9FD" "#060F16" "$GL" "$T" "$L1" "$L2" \
"$(P 'NGINX' 'WIREGUARD' 'DEBIAN')" "$(t 'RÉSEAU' 'NETWORK')" "<i>$ETAT</i>"
