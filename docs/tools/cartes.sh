#!/bin/bash
# Générateur unique des bannières de projet.
# Chaque bannière porte sa catégorie en haut à droite, et la mention
# « privé » quand le dépôt n'est pas public, pour qu'un visiteur comprenne
# pourquoi il ne peut pas cliquer.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/png$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
LOGO="file:///C:/Users/trist/Documents/Github/Microcoaster-bot-org/images/logo.png"
ICONE="file:///$B/src-icone.png"

# En clair, chaque carte passe son accent, un cran plus soutenu, et le reste
# du gabarit bascule ici. OMBRE sert aussi aux plaques néon des scripts de
# carte.
#
# Sur le noir de GitHub, la carte se fond dans la page. Sur le blanc, un
# fond teinté jusqu'au bord dessinait un bloc à bords francs. La carte
# claire est donc cadrée comme une carte de GitHub, coins arrondis et
# détourés, et la couleur vit à l'intérieur : une lueur d'accent derrière
# le logo, une autre de l'accent second dans le coin opposé, la grille, et
# un halo resserré autour de la plaque. Toute blanche, elle paraissait vide.
#
# carte_claire <accent> <accent2> : les règles qui surchargent le gabarit.
carte_claire () {
  printf "%s" "html,body{background:transparent}
.w{border-radius:14px;border:1px solid #D0D7DE;
   background:radial-gradient(58% 130% at 12% 0%, ${1}24 0%, transparent 62%),
              radial-gradient(46% 110% at 100% 100%, ${2}1C 0%, transparent 70%),
              linear-gradient(135deg,#FFFFFF 0%,#FFFFFF 55%,#F6F8FA 100%)}
.grid{opacity:.55}
.gl{filter:drop-shadow(0 0 22px ${1}3A)}"
}
DETOUR="$(c '' '--default-background-color=00000000')"
OMBRE="$(c 'rgba(0,0,0,.5)' 'rgba(30,20,50,.18)')"
PLAQUE="$(c 'rgba(0,0,0,.55)' 'rgba(30,20,50,.2)')"
COIN="$(c '#04060A' '#F4F6F9')"
TITRE="$(c '#F1F5F9' '#0F172A')"
TEXTE="$(c '#94A3B0' '#4B5866')"
GRIS="$(c 'color:#7C8894;border:1px solid #2A333D;background:#0C1117' 'color:#5B6672;border:1px solid #D5DBE1;background:#F3F5F7')"

# ban <nom> <accent> <accent2> <fond> <glyphe> <titre> <l1> <l2> <pastilles> <categorie> <prive|"">
ban () {
cat > "$D/html$SUF/f-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Space+Grotesk:wght@400;500;600&family=JetBrains+Mono:wght@500&family=Playfair+Display:wght@900&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:320px;overflow:hidden;background:$4}
.w{width:1280px;height:320px;position:relative;overflow:hidden;
   background:radial-gradient(58% 130% at 12% 0%, ${2}22 0%, transparent 62%),
              linear-gradient(135deg,$4 0%,$4 55%,$COIN 100%)}
.grid{position:absolute;inset:0;opacity:.30;
  background-image:linear-gradient(${2}14 1px,transparent 1px),linear-gradient(90deg,${2}14 1px,transparent 1px);
  background-size:46px 46px;-webkit-mask-image:radial-gradient(70% 100% at 8% 50%,#000 0%,transparent 72%)}
.cat{position:absolute;top:26px;right:30px;display:flex;gap:8px;align-items:center}
.cat b{font-family:'JetBrains Mono',monospace;font-weight:500;font-size:12px;letter-spacing:2.2px;
  color:${2}E0;border:1px solid ${2}46;background:${2}12;border-radius:5px;padding:7px 13px}
.cat i{font-style:normal;font-family:'JetBrains Mono',monospace;font-size:12px;letter-spacing:2.2px;
  $GRIS;border-radius:5px;padding:7px 13px}
.in{position:absolute;inset:0;display:flex;align-items:center;gap:50px;padding:0 66px}
.gl{width:146px;height:146px;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    filter:drop-shadow(0 0 28px ${2}60)}
.gl img.plate{width:140px;height:140px;object-fit:cover;border-radius:28px;
    border:1px solid rgba(255,255,255,.14);box-shadow:0 10px 30px $PLAQUE}
.gl .crop{width:142px;height:142px;border-radius:30px;overflow:hidden;position:relative;
    box-shadow:0 12px 34px $OMBRE,0 0 0 1px rgba(255,255,255,.10)}
.gl .crop img{position:absolute;width:170px;height:170px;left:50%;top:50%;transform:translate(-50%,-50%)}
.tx{display:flex;flex-direction:column;gap:12px}
h1{font-family:Syne,sans-serif;font-weight:800;font-size:52px;line-height:1;letter-spacing:-1px;color:$TITRE}
h1 em{font-style:normal;color:${EM:-$2};${EMS:-}}
p{font-family:'Space Grotesk',sans-serif;font-size:18.5px;line-height:1.46;color:$TEXTE;max-width:780px}
.pl{display:flex;gap:8px;margin-top:4px}
.pl span{font-family:'Space Grotesk',sans-serif;font-size:12px;font-weight:500;letter-spacing:.7px;
  color:${2}D0;border:1px solid ${2}3A;background:${2}0E;border-radius:6px;padding:6px 11px}
.ln{position:absolute;left:0;right:0;bottom:0;height:3px;background:linear-gradient(90deg,$2 0%,$3 44%,transparent 90%)}
$([ "$THEME" = clair ] && carte_claire "$2" "$3")
</style></head><body>
<div class="w"><div class="grid"></div>
<div class="cat"><b>${10}</b>${11}</div>
<div class="in"><div class="gl">$5</div>
<div class="tx"><h1>$6</h1><p>$7<br>$8</p><div class="pl">$9</div></div></div>
<div class="ln"></div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 --force-device-scale-factor=2 $DETOUR \
  --screenshot="$B/png$SUF/f-$1.png" --window-size=1280,320 "file:///$B/html$SUF/f-$1.html" >/dev/null 2>&1
echo "  f-$1.png"
}
# C <cat> <cat>... : plusieurs vignettes de catégorie en haut à droite.
C () { local s="$1"; shift; for x in "$@"; do s="$s</b><b>$x"; done; printf "%s" "$s"; }
P () { for x in "$@"; do printf '<span>%s</span>' "$x"; done; }
PRIV="<i>$(t 'PRIVÉ' 'PRIVATE')</i>"

