#!/bin/bash
# Rangées d'icônes pour les quatre premiers groupes de la stack.
#
# skillicons.dev ne couvre que l'outillage de développement : ni LogPoint,
# ni Fortinet, ni VMware, ni Proxmox, ni les produits Microsoft, vérifié
# slug par slug. D'où ces rangées rendues en local.
#
# Sa convention, relevée sur ses propres SVG : le fond de la tuile porte
# la couleur de la marque et le logo est en blanc, sauf pour les marques
# multicolores qui gardent le fond gris #242938. C'est ce qui manquait à
# ma première version, toutes tuiles grises, d'où l'effet délavé à côté
# des rangées du bas.
#
# Là où skillicons a l'icône, on prend directement sa tuile : identité
# garantie avec les quatre groupes du bas. Ailleurs, on la reproduit.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/stack"
I="$(cd "$D/icones" && pwd)"
IW="$(cd "$D/icones" && pwd -W 2>/dev/null || pwd)"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

TUILE=192; ECART=33; LOGO=150

# sk <slug> : la tuile skillicons telle quelle, fond compris
sk () {
  local corps
  # Le fichier du pack contient deux balises svg imbriquées, sur deux
  # lignes différentes. Seule la première doit être redimensionnée :
  # toucher la seconde replie la tuile entière à 75 pour cent de sa
  # taille, calée en haut à gauche, ce qui ne se voit qu'une fois la
  # rangée montée à côté des autres.
  corps=$(sed -e '0,/<svg[^>]*>/s//<svg viewBox="0 0 256 256" width="'"$TUILE"'" height="'"$TUILE"'">/' "$I/sk/$1.svg")
  printf '<div class="w">%s</div>' "$corps"
}

# marque <slug> <fond> : la convention skillicons reproduite, logo blanc
marque () {
  local corps
  corps=$(sed -e 's|<svg[^>]*>||' -e 's|</svg>||' -e 's|<title>[^<]*</title>||' "$I/$1.svg")
  printf '<div class="t" style="background:%s"><svg viewBox="0 0 24 24" width="%d" height="%d" fill="#FFFFFF">%s</svg></div>' \
    "$2" "$LOGO" "$LOGO" "$corps"
}

# couleurs <fichier svg> : marque multicolore, donc fond gris, comme
# skillicons le fait pour Linux ou Python
couleurs () {
  local corps
  corps=$(sed -e 's|<svg[^>]*>|<svg viewBox="0 0 512 512" width="'"$LOGO"'" height="'"$LOGO"'">|' "$1")
  printf '<div class="t">%s</div>' "$corps"
}

# image <fichier> <taille> : un logo fourni en bitmap.
#
# La taille est celle de l'image dans la tuile. Pour un logo qui porte
# déjà son fond, comme LogPoint, on la règle pour que ce fond remplisse
# la tuile. Pour un logo transparent, comme Centreon, on la règle à
# l'emprise commune des autres, et le gris de la tuile transparaît.
image () {
  printf '<div class="t im" style="background-image:url(file:///%s);background-size:%s"></div>' "$1" "$2"
}

# mot <texte> <fond> : pour ce qui n'a de logo dans aucun jeu ouvert.
# Même gabarit que les autres, le nom à la place du sigle.
mot () {
  printf '<div class="t" style="background:%s"><span class="m">%s</span></div>' "$2" "$1"
}

rangee () { # <clé> <contenu>
  local n
  n=$(printf '%s' "$2" | grep -o 'class="[tw]' | wc -l)
  local w=$(( n*TUILE + (n-1)*ECART ))
  cat > "$D/html/si-$1.html" <<HTML
<!doctype html><html><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:${w}px;height:${TUILE}px;overflow:hidden;background:transparent}
.r{display:flex;gap:${ECART}px;align-items:center}
.t,.w{width:${TUILE}px;height:${TUILE}px;flex-shrink:0}
.t{border-radius:45px;background:#242938;display:flex;align-items:center;justify-content:center}
.w{display:block;line-height:0}
.im{background-position:center;background-repeat:no-repeat}
.m{font-family:Syne,sans-serif;font-weight:800;font-size:30px;letter-spacing:-.5px;
   line-height:1.1;text-align:center;color:#FFFFFF;padding:0 8px}
</style></head><body><div class="r">$2</div></body></html>
HTML
  "$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
    --default-background-color=00000000 \
    --screenshot="$B/stack/$1.png" --window-size=$w,$TUILE "file:///$B/html/si-$1.html" >/dev/null 2>&1
  echo "  $1.png  $n tuiles, à afficher sur $(( n*48 + (n-1)*8 )) px"
}

rangee securite "$(image "$IW/logpoint-src.png" '458px auto')$(image "$IW/centreon-src.png" '150px auto')$(marque fortinet '#EE3124')$(marque wireshark '#1679A7')"

rangee systemes "$(marque vmware '#4A5560')$(marque virtualbox '#2F61B4')$(marque proxmox '#E57000')$(sk linux)$(sk debian)$(sk windows)"

rangee microsoft "$(marque microsoftoffice '#D83B01')$(marque microsoftexchange '#0078D4')$(couleurs "$I/entra.svg")$(sk powershell)"

rangee exploitation "$(marque jira '#0052CC')$(sk docker)$(sk nginx)$(sk git)$(sk githubactions)"

# Les assistants font partie de l'outillage quotidien : autant le dire.
rangee assistants "$(marque claude '#D97757')$(marque openai '#10A37F')$(marque githubcopilot '#24292F')"
