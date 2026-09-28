#!/bin/bash
# La section Parcours : le CV en trois cartes, expérience, formation, puis
# certifications et langues.
#
# Un CV se lit, il ne se regarde pas. La première version reprenait les
# effets des cartes de projet, lueur rouge, grille, liseré rouge et bleu en
# bas, et mettait du rouge sur les dates, les niveaux et les jauges : jugée
# tape-à-l'œil et peu lisible. Ces cartes sont donc des cartes de GitHub,
# cadrées de son gris, sur son propre fond, texte en gris de GitHub. Le
# rouge ne marque plus que deux choses : l'intitulé et ce qui est en cours.
#
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

# Les couleurs sont celles de GitHub, pour que la carte se fonde dans la page.
ACC="$(c '#E23B4E' '#D02A3F')"
FOND="$(c '#0D1117' '#FFFFFF')"
BORD="$(c '#30363D' '#D0D7DE')"
TUILE="$(c '#161B22' '#F6F8FA')"
FORT="$(c '#F0F6FC' '#1F2328')"
MOYEN="$(c '#C9D1D9' '#31383F')"
DOUX="$(c '#9198A1' '#59636E')"
FIL="$(c '#30363D' '#D0D7DE')"

# carte <clé> <hauteur> <intitulé> <corps>
carte () {
cat > "$D/html$SUF/cv-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:${2}px;overflow:hidden;background:transparent}
.w{width:1280px;height:${2}px;overflow:hidden;padding:42px 64px 0;
   background:$FOND;border:1px solid $BORD;border-radius:14px}
.hd{display:flex;align-items:center;gap:13px;padding-bottom:22px;margin-bottom:30px;border-bottom:1px solid $BORD}
.hd i{width:8px;height:8px;background:$ACC;border-radius:1.5px;transform:rotate(45deg)}
.hd b{font-family:'JetBrains Mono',monospace;font-weight:500;font-size:15px;letter-spacing:3px;
      text-transform:uppercase;color:$FORT}

/* Frise : la date à gauche, un fil vertical ponctué, le poste à droite. */
.e{display:grid;grid-template-columns:200px 34px 1fr}
.d{font-family:'JetBrains Mono',monospace;font-size:14.5px;letter-spacing:.4px;color:$DOUX;padding-top:5px;line-height:1.5}
.d.on{color:$FORT}
.f{position:relative;display:flex;justify-content:center}
.f:before{content:'';position:absolute;top:0;bottom:0;width:1px;background:$FIL}
.e:first-child .f:before{top:12px}
.e:last-child .f:before{bottom:auto;height:12px}
.f span{position:relative;margin-top:8px;width:11px;height:11px;border-radius:50%;
        border:1.5px solid $DOUX;background:$FOND}
.f span.on{border-color:$ACC;background:$ACC}
.c{padding:0 0 26px 14px}
.c h3{font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:23px;line-height:1.25;color:$FORT}
.c h4{font-family:'Space Grotesk',sans-serif;font-weight:500;font-size:17px;color:$MOYEN;margin-top:4px}
.c p{font-family:'Space Grotesk',sans-serif;font-size:17px;line-height:1.5;color:$DOUX;margin-top:6px;max-width:880px}

/* Certificats : des tuiles, le nom, le niveau, une ligne d'explication. */
.tu{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
.t{border:1px solid $BORD;border-radius:10px;padding:20px 22px;background:$TUILE}
.t b{display:block;font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:23px;color:$FORT}
.t em{display:block;font-style:normal;font-family:'JetBrains Mono',monospace;font-size:13px;letter-spacing:1.4px;
      color:$MOYEN;margin-top:6px}
.t p{font-family:'Space Grotesk',sans-serif;font-size:16px;line-height:1.45;color:$DOUX;margin-top:10px}

/* Langues : une jauge en cinq crans, pleine pour la langue maternelle. */
.lg{display:grid;grid-template-columns:1fr 1fr;gap:18px 60px;margin-top:4px}
.l{display:flex;align-items:center;gap:18px}
.l b{width:120px;font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:19px;color:$FORT}
.l s{display:flex;gap:5px;text-decoration:none}
.l s i{width:28px;height:6px;border-radius:3px;background:$FIL}
.l s i.p{background:$MOYEN}
.l span{font-family:'JetBrains Mono',monospace;font-size:13px;letter-spacing:1px;color:$DOUX}
.hd.b2{margin:38px 0 26px}

/* Expérience : une carte par poste, le logo de la structure sur une plaque
   blanche, la date à droite du titre, les outils en puces. Le logo est
   contenu, jamais étiré. */
.x{display:flex;gap:26px;padding:22px 0;border-top:1px solid $BORD}
.x:first-child{border-top:0;padding-top:2px}
.lo{width:76px;height:76px;flex-shrink:0;border-radius:16px;background:#FFFFFF;border:1px solid $BORD;
    display:flex;align-items:center;justify-content:center;overflow:hidden}
.lo img{max-width:58px;max-height:58px;width:auto;height:auto}
.lo.plein img{max-width:76px;max-height:76px}
.lo.ic{background:$TUILE}
.xb{flex:1;min-width:0}
.xh{display:flex;align-items:baseline;justify-content:space-between;gap:20px}
.xh h3{font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:23px;line-height:1.25;color:$FORT}
.xh time{font-family:'JetBrains Mono',monospace;font-size:14px;letter-spacing:.4px;color:$DOUX;white-space:nowrap;
         display:flex;align-items:center;gap:9px}
.xh time.on{color:$FORT}
.xh time.on:before{content:'';width:8px;height:8px;border-radius:50%;background:$ACC}
.x h4{font-family:'Space Grotesk',sans-serif;font-weight:500;font-size:17px;color:$MOYEN;margin-top:4px}
.x p{font-family:'Space Grotesk',sans-serif;font-size:16.5px;line-height:1.5;color:$DOUX;margin-top:7px}
.ch{display:flex;flex-wrap:wrap;gap:7px;margin-top:12px}
.ch span{font-family:'JetBrains Mono',monospace;font-size:12px;letter-spacing:.6px;color:$MOYEN;
         border:1px solid $BORD;background:$TUILE;border-radius:6px;padding:5px 10px}
.tu.q{grid-template-columns:repeat(4,1fr)}
</style></head><body>
<div class="w">
<div class="hd"><i></i><b>$3</b></div>
$4
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 --force-device-scale-factor=2 \
  --default-background-color=00000000 \
  --screenshot="$B/png$SUF/cv-$1.png" --window-size=1280,$2 "file:///$B/html$SUF/cv-$1.html" >/dev/null 2>&1
echo "  cv-$1.png"
}

# e <date> <poste> <structure> <détail> [on] : une étape de la frise.
# « on » allume la pastille : ce qui est encore en cours.
e () {
  local on=""; [ "$5" = on ] && on=" on"
  printf '<div class="e"><div class="d%s">%s</div><div class="f"><span class="%s"></span></div><div class="c"><h3>%s</h3><h4>%s</h4>%s</div></div>' \
    "$on" "$1" "${on# }" "$2" "$3" "${4:+<p>$4</p>}"
}
# t2 <sigle> <niveau> <détail> : une tuile de certificat.
t2 () { printf '<div class="t"><b>%s</b>%s<p>%s</p></div>' "$1" "${2:+<em>$2</em>}" "$3"; }
# lg <langue> <crans sur 5> <niveau>
lg () {
  local s="" k
  for k in 1 2 3 4 5; do if [ $k -le $2 ]; then s="$s<i class=p></i>"; else s="$s<i></i>"; fi; done
  printf '<div class="l"><b>%s</b><s>%s</s><span>%s</span></div>' "$1" "$s" "$3"
}

A="$(t "aujourd'hui" 'present')"
LG_="file:///$B/icones/parcours"

# x <logo> <poste> <date> <structure> <détail> <puces> [on]
# Le logo est un bloc déjà prêt : lo, plein ou ic ci-dessous.
x () {
  local on=""; [ "$7" = on ] && on=' class="on"'
  printf '<div class="x">%s<div class="xb"><div class="xh"><h3>%s</h3><time%s>%s</time></div><h4>%s</h4>%s%s</div></div>' \
    "$1" "$2" "$on" "$3" "$4" "${5:+<p>$5</p>}" "${6:+<div class=\"ch\">$6</div>}"
}
lo ()    { printf '<div class="lo"><img src="%s/%s"></div>' "$LG_" "$1"; }
plein () { printf '<div class="lo plein"><img src="%s/%s"></div>' "$LG_" "$1"; }
# fond <couleur> <logo> : un logo qui porte déjà son fond de couleur, posé
# sur ce fond pour que la plaque entière soit à ses couleurs.
fond () { printf '<div class="lo" style="background:%s;border-color:%s"><img src="%s/%s" style="max-width:76px;max-height:76px"></div>' "$1" "$1" "$LG_" "$2"; }
Q () { for s in "$@"; do printf '<span>%s</span>' "$s"; done; }

carte experience 1170 "$(t 'Expérience' 'Experience')" "<div>
$(x "$(plein microcoaster.png)" "$(t 'Fondateur et directeur technique' 'Founder and CTO')" "$(t 'sept. 2025' 'Sep 2025') → $A" \
  "$(t 'CoasterSystems, micro-entreprise · Vannes' 'CoasterSystems, sole company · Vannes')" \
  "$(t "Je conçois l'électronique et le logiciel de MicroCoaster : la carte, le firmware ESP32, la liaison IoT et l'application web de pilotage." 'I design the electronics and software behind MicroCoaster: the board, the ESP32 firmware, the IoT link and the web control app.')" \
  "$(Q ESP32 'PCB' 'IoT' "$(t 'Web HTTPS' 'HTTPS web app')")" on)
$(x "$(fond '#0FECA0' assia.svg)" "$(t 'Alternant ingénieur cyberdéfense' 'Cyber defence engineering apprentice')" "$(t 'déc. 2024' 'Dec 2024') → $A" \
  "$(t 'ASSIA, plateforme santé et assurance · Quimper' 'ASSIA, health and insurance platform · Quimper')" \
  "$(t "Analyse des journaux de sécurité dans un SIEM, supervision, sécurité réseau et durcissement de l'infrastructure." 'Security log analysis in a SIEM, monitoring, network security and infrastructure hardening.')" \
  "$(Q SIEM LogPoint Centreon Fortinet "$(t 'Durcissement' 'Hardening')")" on)
$(x "$(lo avril.svg)" "$(t 'Alternant ingénieur cyberdéfense' 'Cyber defence engineering apprentice')" "$(t 'sept. → oct. 2024' 'Sep → Oct 2024')" \
  "$(t 'Groupe Avril · Bruz' 'Avril group · Bruz')" "" "")
$(x "$(lo unibw.svg)" "$(t 'Assistant de recherche, stage' 'Research assistant, internship')" "$(t 'janv. → mars 2024' 'Jan → Mar 2024')" \
  "$(t 'Université de la Bundeswehr · Munich' 'Bundeswehr University · Munich')" \
  "$(t 'Au laboratoire de cybersécurité RI CODE : prototypes matériels et protocoles de communication résilients.' 'At the RI CODE cyber security lab: hardware prototypes and resilient communication protocols.')" \
  "$(Q "$(t 'Prototypage' 'Prototyping')" "$(t 'Protocoles résilients' 'Resilient protocols')")")
$(x "$(lo leclerc.svg)" "$(t 'Employé polyvalent' 'General store assistant')" "$(t 'déc. 2023 → janv. 2024' 'Dec 2023 → Jan 2024')" \
  "E.Leclerc · Pont-l’Abbé" \
  "$(t 'Déchargement des camions, mise en rayon, rangement des réserves.' 'Unloading trucks, restocking shelves, organising the stockroom.')" "")
$(x "$(lo yelloh.png)" "$(t 'Jobs saisonniers' 'Seasonal jobs')" '2021 → 2024' \
  "$(t 'Yelloh Village et Marvilla Parks · Bénodet' 'Yelloh Village and Marvilla Parks · Bénodet')" \
  "$(t 'Trois étés en cuisine sur un camping cinq étoiles. Rapidité, endurance, sang-froid face au rush.' 'Three summers in the kitchen of a five star campsite. Speed, stamina, keeping calm under the rush.')" "")
$(x "$(lo combrit.svg)" "$(t 'Conseiller municipal des jeunes' 'Youth town councillor')" '2017 → 2021' \
  "$(t 'Mairie de Combrit' 'Combrit town hall')" \
  "$(t 'Quatre ans à monter des projets pour les jeunes de la commune, puis un été au port de plaisance de Sainte-Marine.' 'Four years building projects for the town’s young people, then a summer at the Sainte-Marine marina.')" "")
</div>"

carte formation 450 "$(t 'Formation' 'Education')" "<div class='fr'>
$(e "2022 → 2027" "$(t 'Diplôme d’ingénieur en cyberdéfense' 'Engineering degree in cyber defence')" \
  "$(t 'ENSIBS, Vannes, en alternance' 'ENSIBS, Vannes, work-study')" \
  "$(t 'Parcours cyber opérationnel, après deux ans de cycle préparatoire intégré.' 'Operational cyber track, after a two-year integrated preparatory cycle.')" on)
$(e "2022 → 2024" "$(t 'DUT, cycle préparatoire intégré' 'DUT, integrated preparatory cycle')" \
  "$(t 'IUT de Vannes, avec l’ENSIBS' 'IUT de Vannes, with ENSIBS')" "")
$(e "2020 → 2022" "$(t 'Baccalauréat STI2D, mention Bien' 'STI2D baccalaureate, with honours')" \
  "$(t 'Le Likès, Quimper' 'Le Likès, Quimper')" \
  "$(t 'Sciences et technologies de l’industrie et du développement durable.' 'Industrial science and technology, sustainable development.')")
</div>"

# Le secourisme tient en une tuile : le BNSSA et les PSE vont ensemble,
# les séparer les faisait compter trois fois.
carte certifs 810 "$(t 'Certifications' 'Certifications')" "<div class='tu q'>
$(t2 'TOEIC' "$(t '785 ET PLUS · B2' '785 AND UP · B2')" "$(t 'Anglais professionnel.' 'Professional English.')")
$(t2 'Le Robert' "$(t 'NIVEAU AVANCÉ' 'ADVANCED LEVEL')" "$(t 'Maîtrise du français écrit.' 'Written French.')")
$(t2 "$(t 'Sauveteur secouriste' 'Lifeguard, first aider')" 'BNSSA · PSE1 · PSE2' "$(t 'Surveillance de baignade et premiers secours en équipe.' 'Pool and beach lifeguarding, team first aid.')")
$(t2 "$(t 'Permis B' 'Driving licence')" "$(t 'VÉHICULÉ · MOBILE' 'OWN CAR · MOBILE')" "$(t 'Prêt à partir n’importe où, à l’autre bout du monde s’il le faut.' 'Ready to go anywhere, to the other side of the world if need be.')")
</div>
<div class='hd b2'><i></i><b>$(t 'Centres d’intérêt' 'Interests')</b></div>
<div class='tu q'>
$(t2 "$(t 'Musculation' 'Weight training')" 'SPORT' "$(t 'Assez sérieusement pour coder ma propre appli de suivi, ÆSTHETIC.' 'Serious enough to build my own tracking app, ÆSTHETIC.')")
$(t2 "$(t 'Coasters' 'Coasters')" 'PASSION' "$(t 'J’écume les parcs d’Europe. Avec MicroCoaster, je réalise le rêve en miniature.' 'I ride my way through Europe’s parks. With MicroCoaster, I build the dream in miniature.')")
$(t2 "$(t 'Vidéo et 3D' 'Video and 3D')" "$(t 'CRÉATION' 'MAKING')" "$(t 'Premiere Pro, After Effects, Fusion 360 et impression 3D.' 'Premiere Pro, After Effects, Fusion 360 and 3D printing.')")
$(t2 "$(t 'Écriture' 'Writing')" 'ROMAN · 18+' "$(t 'Mon premier roman, Le Redoublant, se lit en ligne.' 'My first novel, Le Redoublant, is online to read.')")
</div>
<div class='hd b2'><i></i><b>$(t 'Langues' 'Languages')</b></div>
<div class='lg'>
$(lg "$(t 'Français' 'French')" 5 "$(t 'LANGUE MATERNELLE' 'NATIVE')")
$(lg "$(t 'Anglais' 'English')" 4 "$(t 'B2 · TOEIC' 'B2 · TOEIC')")
$(lg "$(t 'Allemand' 'German')" 2 "$(t 'NOTIONS' 'BASIC')")
$(lg "$(t 'Espagnol' 'Spanish')" 2 "$(t 'NOTIONS' 'BASIC')")
</div>"
