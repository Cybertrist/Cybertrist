#!/bin/bash
# La carte Serenity, seule à ne pas passer par cartes.sh : elle reprend les
# éléments du projet lui-même, le cadenas de web/public/icon.svg, le
# logotype en Saira Stencil One et le bandeau tricolore, plutôt que le
# gabarit commun. Rendue à 3x : le pochoir s'écaille en dessous.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/png"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

cat > "$D/html/f-serenity.html" <<'HTML'
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Saira+Stencil+One&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:320px;overflow:hidden;background:#05080F}
.w{width:1280px;height:320px;position:relative;overflow:hidden;
   background:radial-gradient(75% 150% at 22% 0%, #16233C 0%, #0A0F1C 46%, #05080F 100%)}
.card{position:absolute;left:22px;right:22px;top:16px;bottom:30px;
      border:1px solid rgba(255,255,255,.07);border-radius:18px}
.cat{position:absolute;top:26px;right:30px;font-family:'JetBrains Mono',monospace;font-size:12px;
  letter-spacing:2.2px;color:#8FB4E8;border:1px solid rgba(0,85,164,.55);
  background:rgba(0,85,164,.14);border-radius:5px;padding:7px 13px}
.in{position:absolute;inset:0;display:flex;align-items:center;gap:46px;padding:0 66px 14px}

/* Le cadenas officiel, repris tel quel depuis web/public/icon.svg, sans la
   tuile bleue de l'icône d'application : sur la bannière il est à même le fond. */
.gl{flex-shrink:0;display:flex;align-items:center;justify-content:center}

.tx{display:flex;flex-direction:column}
/* Le logotype : Saira Stencil One, la police de la bannière d'origine, avec le I
   dans le rouge de la serrure. Le thème de l'application déclare Black Ops One,
   mais la bannière n'a pas été composée avec. */
h1{font-family:'Saira Stencil One',sans-serif;font-size:62px;line-height:1;letter-spacing:.08em;
   color:#F2F4F8;text-transform:uppercase}
h1 em{font-style:normal;color:#E8434B}
p{font-family:"Space Grotesk",sans-serif;font-size:18px;line-height:1.45;color:#E3E8F0;margin-top:13px}
p b{font-weight:400;color:#4D8EF7}
.pl{display:flex;gap:9px;margin-top:14px}
.pl span{font-family:'Space Grotesk',sans-serif;font-size:12.5px;letter-spacing:.4px;
  color:#93A3B8;border:1px solid rgba(147,163,184,.34);border-radius:999px;padding:7px 15px}
.tri{position:absolute;left:0;right:0;bottom:0;height:14px;display:flex}
.tri i{flex:1}
.tri .b{background:#0055A4}.tri .w{background:#F5F5F5}.tri .r{background:#E1000F}
</style></head><body>
<div class="w">
  <div class="card"></div>
  <div class="cat">SÉCURITÉ</div>
  <div class="in">
    <div class="gl">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 268" height="164">
        <mask id="body" maskUnits="userSpaceOnUse">
          <rect x="0" y="121" width="200" height="147" rx="45" fill="#fff"/>
          <path d="M92 188 H108 L118 235 H82 Z" fill="#000"/>
        </mask>
        <path d="M25 101 V75 A75 75 0 0 1 175 75 V101 H145 V75 A45 45 0 0 0 55 75 V101 Z" fill="#F2F4F8"/>
        <rect x="0" y="121" width="200" height="147" rx="45" fill="#F2F4F8" mask="url(#body)"/>
        <circle cx="100" cy="175" r="23" fill="#E8434B"/>
      </svg>
    </div>
    <div class="tx">
      <h1>SEREN<em>I</em>TY</h1>
      <p>Ton coffre de mots de passe, chez toi.<br>
         Un <b>agent</b> surveille les fuites, et change ceux que tu lui confies.</p>
      <div class="pl">
        <span>Zéro connaissance</span><span>libsodium</span><span>Auto-hébergé</span><span>AGPL v3</span>
      </div>
    </div>
  </div>
  <div class="tri"><i class="b"></i><i class="w"></i><i class="r"></i></div>
</div>
</body></html>
HTML

"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=3 \
  --screenshot="$B/png/f-serenity.png" --window-size=1280,320 \
  "file:///$B/html/f-serenity.html" >/dev/null 2>&1
echo "  f-serenity.png"
