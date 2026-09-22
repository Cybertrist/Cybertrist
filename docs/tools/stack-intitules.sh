#!/bin/bash
# Intitulés des groupes de la stack.
#
# Ils étaient en gras Markdown, ce qui les rendait indistincts du reste du
# texte de la page. Ce sont maintenant des bandeaux : le titre au centre,
# encadré de deux pastilles d'accent, et une règle qui s'efface vers
# l'extérieur de chaque côté.
#
# Largeur d'affichage de 560 pixels, celle de la plus large rangée
# d'icônes : les huit groupes partagent ainsi la même colonne.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/stack$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

L=560; H=42

lab () { # <clé> <titre>
cat > "$D/html$SUF/sl-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:${L}px;height:${H}px;overflow:hidden;background:transparent}
.w{width:${L}px;height:${H}px;display:flex;align-items:center;gap:14px}
/* Les deux règles s'effacent vers les bords : la page n'a pas de cadre,
   un trait net s'y arrêterait sèchement. */
.r{flex:1;height:1px}
.r.g{background:linear-gradient(90deg,transparent,#2E3947)}
.r.d{background:linear-gradient(90deg,#2E3947,transparent)}
.t{display:flex;align-items:center;gap:11px;flex-shrink:0}
.t b{font-family:'JetBrains Mono',monospace;font-weight:500;font-size:12.5px;
     letter-spacing:3.2px;text-transform:uppercase;color:#CBD4DE;white-space:nowrap}
.t i{width:5px;height:5px;background:#E23B4E;border-radius:1px;transform:rotate(45deg);flex-shrink:0}
</style></head><body>
<div class="w"><div class="r g"></div><div class="t"><i></i><b>$2</b><i></i></div><div class="r d"></div></div>
</body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=3 --default-background-color=00000000 \
  --screenshot="$B/stack$SUF/lab-$1.png" --window-size=$L,$H "file:///$B/html$SUF/sl-$1.html" >/dev/null 2>&1
echo "  lab-$1.png"
}

lab securite     "$(t 'Sécurité et supervision'    'Security and monitoring')"
lab systemes     "$(t 'Systèmes et virtualisation' 'Systems and virtualisation')"
lab microsoft    "$(t 'Environnement Microsoft'    'Microsoft environment')"
lab exploitation "$(t 'Exploitation'               'Operations')"
lab langages     "$(t 'Langages'                   'Languages')"
lab web          "$(t 'Web et mobile'              'Web and mobile')"
lab donnees      "$(t 'Données'                    'Data')"
lab embarque     "$(t 'Sécurité et embarqué'       'Security and embedded')"
lab assistants   "$(t 'Assistants et prompting'    'Assistants and prompting')"
