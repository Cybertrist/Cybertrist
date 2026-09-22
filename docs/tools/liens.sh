#!/bin/bash
# Tuiles de liens. Ce qui était une carte « étiquette + valeur » large
# d'un tiers de page pour dire une adresse tient dans un carré : la
# marque se reconnaît avant d'être lue, et le lien porte le reste.
#
# Le gabarit est celui de skillicons.dev, relevé sur ses propres SVG :
# 256 de côté, coin arrondi à 60, fond de marque et logo blanc. C'est ce
# qui aligne ce bloc sur les rangées de stack du profil GitHub.
#
# Trois façons de remplir une tuile :
#   pack   <slug>            la tuile skillicons telle quelle
#   marque <slug> <fond>     un logo Simple Icons, en blanc sur la marque
#   logo   <clé>             le logo MicroCoaster
#
# Les sources vivent dans tools/icones/, sk/ pour celles du pack.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/liens"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
I="$D/icones"

T=288   # rendu à 288, affiché à 72 : quatre fois, pour rester net

rendu () { # <clé> <corps html>
cat > "$D/html/l-$1.html" <<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
*{margin:0;padding:0}
html,body{width:${T}px;height:${T}px;overflow:hidden;background:transparent;line-height:0}
.t{width:${T}px;height:${T}px;border-radius:67px;position:relative;overflow:hidden;display:flex;align-items:center;justify-content:center}
</style></head><body>$2</body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 \
  --default-background-color=00000000 \
  --screenshot="$B/liens/$1.png" --window-size=$T,$T "file:///$B/html/l-$1.html" >/dev/null 2>&1
echo "  $1.png"
}

# Un fichier du pack contient deux balises svg imbriquées, sur deux lignes
# différentes. Seule la première doit être redimensionnée : toucher la
# seconde replie la tuile à 75 pour cent, calée en haut à gauche, ce qui
# ne se voit qu'une fois la rangée montée.
pack () {
  rendu "$1" "$(sed -e '0,/<svg[^>]*>/s//<svg viewBox="0 0 256 256" width="'"$T"'" height="'"$T"'">/' "$I/sk/$1.svg")"
}

marque () {
  local corps
  corps=$(sed -e 's|<svg[^>]*>||' -e 's|</svg>||' -e 's|<title>[^<]*</title>||' "$I/$1.svg")
  rendu "$1" "<div class=\"t\" style=\"background:$2\"><svg viewBox=\"0 0 24 24\" width=\"196\" height=\"196\" fill=\"#FFFFFF\">$corps</svg></div>"
}


# adresse <clé> <texte> : la pastille en clair qui suit la rangée, pour
# que l'adresse reste copiable à l'œil et pas seulement cliquable.
adresse () {
cat > "$D/html/l-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:760px;height:96px;overflow:hidden;background:transparent}
.w{width:760px;height:96px;display:flex;align-items:center;justify-content:center}
.p{height:72px;display:flex;align-items:center;gap:16px;padding:0 30px;
   border-radius:36px;background:#131A24;border:1px solid #23303D}
.p svg{flex-shrink:0}
.p span{font-family:'JetBrains Mono',monospace;font-size:26px;letter-spacing:.2px;color:#D7E0EA}
</style></head><body><div class="w"><div class="p">
<svg width="28" height="28" viewBox="0 0 24 24" fill="none">
  <rect x="2.4" y="4.9" width="19.2" height="14.2" rx="2.6" stroke="#E23B4E" stroke-width="1.8"/>
  <path d="M3.5 6.9l8.5 6 8.5-6" stroke="#E23B4E" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
<span>$2</span>
</div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=2 --default-background-color=00000000 \
  --screenshot="$B/liens/$1.png" --window-size=760,96 "file:///$B/html/l-$1.html" >/dev/null 2>&1
echo "  $1.png  à afficher sur 380 px"
}
