#!/bin/bash
# Bandeaux de section : index numéroté, titre, règle de séparation.
# Rien ne dépend de la longueur du titre, donc les six sont alignés à
# l'identique : même marge, même hauteur, même position de règle.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/png$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

sec () {
cat > "$D/html$SUF/s-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:118px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:118px;position:relative;background:#0D1117;
   display:flex;flex-direction:column;justify-content:center;gap:18px;padding:0 60px}

.row{display:flex;align-items:center;gap:20px;height:40px}

/* Cartouche d'index : largeur fixe, donc le titre commence toujours au
   même endroit quelle que soit la section. */
.ix{width:52px;height:40px;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    font-family:'JetBrains Mono',monospace;font-size:15px;font-weight:500;letter-spacing:1px;
    color:#E23B4E;border:1.5px solid #4A2029;background:#160A0E;border-radius:6px}

h2{font-family:Syne,sans-serif;font-weight:800;font-size:29px;line-height:40px;letter-spacing:5px;
   color:#F0F4F8;text-transform:uppercase;white-space:nowrap}

/* La règle : un segment rouge sous le cartouche, puis un dégradé qui
   s'efface vers le bord droit. */
.rule{height:2px;display:flex;border-radius:2px;overflow:hidden}
.rule .a{width:52px;flex-shrink:0;background:#E23B4E}
.rule .b{flex:1;background:linear-gradient(90deg,#3A4450 0%,#222A34 42%,transparent 100%)}
</style></head><body>
<div class="w">
  <div class="row"><div class="ix">$3</div><h2>$2</h2></div>
  <div class="rule"><i class="a"></i><i class="b"></i></div>
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 --force-device-scale-factor=2 \
  --virtual-time-budget=10000 \
  --screenshot="$B/png$SUF/s-$1.png" --window-size=1280,118 "file:///$B/html$SUF/s-$1.html" >/dev/null 2>&1
echo "  s-$1.png"
}

sec quotidien "$(t 'Au quotidien' 'Day to day')"      "01"
sec objectif  "$(t 'Objectif' "Where I'm headed")"    "02"
sec projets   "$(t 'Projets' 'Projects')"             "03"
sec chantier  "$(t 'En chantier' 'In progress')"      "04"
sec stack     "$(t 'Stack' 'Stack')"                  "05"
sec contact   "$(t 'Contact' 'Contact')"              "06"
