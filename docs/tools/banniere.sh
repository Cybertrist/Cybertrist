#!/bin/bash
# La bannière d'en-tête du profil : le nom, le cursus, et les trois lignes
# qui disent ce que je fais. Elle ne passe pas par cartes.sh, qui est fait
# pour des cartes de projet.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/png"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

cat > "$D/html/banniere.html" <<'HTML'
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Space+Grotesk:wght@400;500;600&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:320px;overflow:hidden;background:#070204}
.w{width:1280px;height:320px;position:relative;overflow:hidden;
   background:radial-gradient(62% 150% at 14% 0%, #E23B4E22 0%, transparent 60%),
              radial-gradient(52% 120% at 92% 100%, #7A122022 0%, transparent 58%),
              linear-gradient(135deg,#0C0508 0%,#070204 58%,#040103 100%)}
svg.pcb{position:absolute;inset:0;width:1280px;height:320px}
.in{position:absolute;inset:0;display:flex;align-items:center;gap:54px;padding:0 66px}
.gl{width:150px;height:150px;flex-shrink:0;filter:drop-shadow(0 0 30px #E23B4E70)}
.tx{display:flex;flex-direction:column;gap:12px}
h1{font-family:Syne,sans-serif;font-weight:800;font-size:56px;line-height:1;letter-spacing:-1.5px;color:#EAF2F8}
h1 em{font-style:normal;color:#E23B4E}
.sub{font-family:'JetBrains Mono',monospace;font-size:13.5px;letter-spacing:2.6px;color:#8A6670;margin-top:2px}
p{font-family:'Space Grotesk',sans-serif;font-size:19px;line-height:1.46;color:#93A6B6;max-width:840px}
.pl{display:flex;gap:9px;margin-top:6px}
.pl span{font-family:'Space Grotesk',sans-serif;font-size:12.5px;font-weight:500;letter-spacing:.8px;
  color:#F06A78D8;border:1px solid #E23B4E45;background:#E23B4E14;border-radius:6px;padding:6px 12px}
.ln{position:absolute;left:0;right:0;bottom:0;height:3px;
    background:linear-gradient(90deg,#E23B4E 0%,#7A1220 46%,transparent 90%)}
</style></head><body>
<div class="w">

<svg class="pcb" viewBox="0 0 1280 320" fill="none">
  <defs>
    <mask id="fade">
      <rect width="1280" height="320" fill="url(#fg)"/>
    </mask>
    <linearGradient id="fg" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0%" stop-color="#fff" stop-opacity=".95"/>
      <stop offset="26%" stop-color="#fff" stop-opacity=".22"/>
      <stop offset="62%" stop-color="#fff" stop-opacity=".30"/>
      <stop offset="100%" stop-color="#fff" stop-opacity=".85"/>
    </linearGradient>
  </defs>

  <g mask="url(#fade)" stroke="#4A1C26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <path d="M0 44h118l26 26h150"/>
    <path d="M0 74h96l30 30h122"/>
    <path d="M0 250h140l28-28h126"/>
    <path d="M0 282h108l24-24h158"/>
    <path d="M980 26h142l32 32v58"/>
    <path d="M1010 60h88l26 26v70"/>
    <path d="M1280 190h-96l-30 30H994"/>
    <path d="M1280 236h-128l-26 26h-120"/>
    <path d="M430 0v44l28 28v52"/>
    <path d="M860 320v-46l-30-30v-58"/>
    <path d="M636 0v28l26 26h96"/>
    <path d="M700 320v-34l-28-28h-84"/>
  </g>

  <g mask="url(#fade)" fill="#4A1C26">
    <circle cx="294" cy="70" r="5"/><circle cx="248" cy="104" r="5"/>
    <circle cx="294" cy="222" r="5"/><circle cx="290" cy="258" r="5"/>
    <circle cx="1154" cy="116" r="5"/><circle cx="1124" cy="156" r="5"/>
    <circle cx="994" cy="220" r="5"/><circle cx="1006" cy="262" r="5"/>
    <circle cx="458" cy="124" r="5"/><circle cx="830" cy="186" r="5"/>
    <circle cx="758" cy="54" r="5"/><circle cx="588" cy="258" r="5"/>
  </g>

  <g mask="url(#fade)" stroke="#E23B4E" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" opacity=".55">
    <path d="M0 160h72l34-34h96"/>
    <path d="M1280 118h-110l-34 34h-92"/>
  </g>
  <g mask="url(#fade)" fill="#E23B4E" opacity=".8">
    <circle cx="202" cy="126" r="4.5"/><circle cx="1044" cy="152" r="4.5"/>
  </g>
</svg>

<div class="in">
  <div class="gl">
    <svg viewBox="0 0 150 150" fill="none">
      <g stroke="#6B3B44" stroke-width="5" stroke-linecap="round">
        <path d="M46 28V10M75 28V10M104 28V10M46 122v18M75 122v18M104 122v18"/>
        <path d="M28 46H10M28 75H10M28 104H10M122 46h18M122 75h18M122 104h18"/>
      </g>
      <rect x="28" y="28" width="94" height="94" rx="12" fill="#140609" stroke="#E23B4E" stroke-width="5"/>
      <rect x="44" y="44" width="62" height="62" rx="7" fill="none" stroke="#4A1C26" stroke-width="3"/>
      <path d="M60 74V64a15 15 0 0 1 30 0v10" stroke="#EAF2F8" stroke-width="7" stroke-linecap="round"/>
      <rect x="54" y="72" width="42" height="32" rx="7" fill="#EAF2F8"/>
      <circle cx="75" cy="86" r="5.5" fill="#140609"/>
      <path d="M75 90v7" stroke="#140609" stroke-width="4.5" stroke-linecap="round"/>
    </svg>
  </div>
  <div class="tx">
    <h1>Tristan <em>JONCOUR</em></h1>
    <div class="sub">CYBERDÉFENSE · INFRASTRUCTURE · SÉCURITÉ OPÉRATIONNELLE</div>
    <p>Une problématique, je la résous. Et j'en fais un outil.<br>Chacun de mes projets est né comme ça.</p>
    <div class="pl"><span>ENSIBS</span><span>SIEM</span><span>INFRASTRUCTURE</span><span>RÉSEAU</span></div>
  </div>
</div>
<div class="ln"></div>
</div>
</body></html>
HTML

"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=2 \
  --screenshot="$B/png/banniere.png" --window-size=1280,320 \
  "file:///$B/html/banniere.html" >/dev/null 2>&1
echo "  banniere.png"
