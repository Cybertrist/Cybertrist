#!/bin/bash
# Avertissement sous la grille de projets. Il couvre maintenant quatre
# dépôts fermés, et dit pourquoi chacun l'est : un visiteur qui tombe sur
# une 404 doit comprendre que le lien n'est pas cassé.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/notes$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
H=196

cat > "$D/html$SUF/n-prive.html" <<'HTML'
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:196px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:196px;background:#0D1117;padding:14px 56px;display:flex;align-items:center}
.b{flex:1;height:168px;position:relative;overflow:hidden;border-radius:13px;
   border:1px solid #4E1E27;
   background:linear-gradient(100deg,#200E14 0%,#190B10 55%,#120809 100%);
   display:flex;align-items:center;gap:22px;padding:0 30px}
.b::after{content:"";position:absolute;right:0;top:0;bottom:0;width:190px;opacity:.13;
  background:repeating-linear-gradient(-45deg,#E23B4E 0 11px,transparent 11px 25px);
  -webkit-mask-image:linear-gradient(90deg,transparent,#000)}
.ic{width:58px;height:58px;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    border-radius:14px;background:#E23B4E1A;border:1.5px solid #E23B4E4D}
.tx{display:flex;flex-direction:column;gap:7px;position:relative;max-width:1000px}
h3{font-family:Syne,sans-serif;font-weight:800;font-size:21px;letter-spacing:2.4px;
   color:#FF5B6E;text-transform:uppercase;line-height:1}
p{font-family:'Space Grotesk',sans-serif;font-size:15px;line-height:1.45;color:#C8B2B7}
p b{color:#FFFFFF;font-weight:500}
.sec{font-family:'JetBrains Mono',monospace;font-size:11.5px;letter-spacing:1.6px;
     color:#8A6E75;margin-top:2px}
</style></head><body><div class="w"><div class="b">
<span class="ic"><svg width="28" height="28" viewBox="0 0 24 24" fill="none">
  <rect x="4" y="10.4" width="16" height="10.6" rx="2.6" stroke="#FF5B6E" stroke-width="1.9"/>
  <path d="M7.8 10.4V7.2a4.2 4.2 0 018.4 0v3.2" stroke="#FF5B6E" stroke-width="1.9" stroke-linecap="round"/>
  <circle cx="12" cy="15.4" r="1.7" fill="#FF5B6E"/></svg></span>
<div class="tx">
  <h3>Dépôts privés</h3>
  <p><b>KyrlCut</b> est un livrable client, son code appartient à celui qui l'a commandé. Les trois bots <b>Basic-Fit</b> servent un vrai serveur Discord et lisent des exports de compte : identifiants de salons et données personnelles n'ont rien à faire en public. Leurs cartes mènent bien au dépôt, mais GitHub répondra 404 à qui n'y a pas accès.</p>
  <div class="sec">CHAQUE BANNIÈRE PORTE SA CATÉGORIE, ET SON ÉTAT QUAND LE DÉPÔT N'EXISTE PAS ENCORE</div>
</div>
</div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=11000 \
  --force-device-scale-factor=2 \
  --screenshot="$B/notes$SUF/prive.png" --window-size=1280,$H "file:///$B/html$SUF/n-prive.html" >/dev/null 2>&1
echo "  prive.png"
