#!/bin/bash
# La section Parcours : le CV en trois cartes, expérience, formation, puis
# certifications et langues. Même cadre que les cartes de projet, la
# lueur rouge du profil en haut à gauche, pour qu'elles se lisent comme une
# suite de la page et non comme un document collé dedans.
#
# L'employeur de l'alternance n'est pas nommé, comme dans l'introduction :
# on dit le secteur, pas la maison.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ACC="$(c '#E23B4E' '#D02A3F')"
AC2="$(c '#4D8EF7' '#2A67D6')"
FOND="$(c '#070B12' '#FFFFFF')"
FIL="$(c '#2A333D' '#D5DBE1')"
PASTILLE="$(c '#0D1117' '#FFFFFF')"
DATE="$(c '#7C8894' '#5B6672')"

# carte <clé> <hauteur> <intitulé> <corps>
carte () {
cat > "$D/html$SUF/cv-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400;500;600&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:${2}px;overflow:hidden;background:$FOND}
.w{width:1280px;height:${2}px;position:relative;overflow:hidden;padding:44px 66px 0;
   background:radial-gradient(58% 70% at 8% 0%, ${ACC}1E 0%, transparent 62%),
              linear-gradient(135deg,$FOND 0%,$FOND 55%,$COIN 100%)}
.grid{position:absolute;inset:0;opacity:.30;
  background-image:linear-gradient(${ACC}14 1px,transparent 1px),linear-gradient(90deg,${ACC}14 1px,transparent 1px);
  background-size:46px 46px;-webkit-mask-image:radial-gradient(60% 60% at 4% 0%,#000 0%,transparent 72%)}
.ln{position:absolute;left:0;right:0;bottom:0;height:3px;background:linear-gradient(90deg,$ACC 0%,$AC2 44%,transparent 90%)}
.hd{position:relative;display:flex;align-items:center;gap:14px;margin-bottom:34px}
.hd i{width:9px;height:9px;background:$ACC;border-radius:2px;transform:rotate(45deg)}
.hd b{font-family:'JetBrains Mono',monospace;font-weight:500;font-size:15px;letter-spacing:3.4px;
      text-transform:uppercase;color:$TITRE}

/* Frise : la date à gauche, un fil vertical ponctué, le poste à droite. */
.fr{position:relative}
.e{display:grid;grid-template-columns:200px 34px 1fr;min-height:0}
.d{font-family:'JetBrains Mono',monospace;font-size:14.5px;letter-spacing:.6px;color:$DATE;padding-top:5px;line-height:1.5}
.d.on{color:$ACC}
.f{position:relative;display:flex;justify-content:center}
.f:before{content:'';position:absolute;top:0;bottom:0;width:1.5px;background:$FIL}
.e:first-child .f:before{top:12px}
.e:last-child .f:before{bottom:auto;height:12px}
.f span{position:relative;margin-top:7px;width:13px;height:13px;border-radius:50%;
        border:2px solid $DATE;background:$PASTILLE}
.f span.on{border-color:$ACC;background:$ACC;box-shadow:0 0 0 5px ${ACC}26}
.c{padding:0 0 26px 14px}
.c h3{font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:23px;line-height:1.25;color:$TITRE}
.c h4{font-family:'Space Grotesk',sans-serif;font-weight:500;font-size:16.5px;color:$AC2;margin-top:3px}
.c p{font-family:'Space Grotesk',sans-serif;font-size:17px;line-height:1.5;color:$TEXTE;margin-top:7px;max-width:880px}

/* Certificats : des tuiles, le sigle en grand, le niveau dessous. */
.tu{display:grid;grid-template-columns:repeat(3,1fr);gap:16px;position:relative}
.t{border:1px solid $FIL;border-radius:12px;padding:20px 22px;background:$(c '#0B1018' '#F6F8FAB0')}
.t b{display:block;font-family:Syne,sans-serif;font-weight:800;font-size:24px;letter-spacing:.5px;color:$TITRE}
.t em{display:inline-block;font-style:normal;font-family:'JetBrains Mono',monospace;font-size:12.5px;letter-spacing:1.6px;
      color:$ACC;border:1px solid ${ACC}46;background:${ACC}10;border-radius:5px;padding:4px 9px;margin-top:10px}
.t p{font-family:'Space Grotesk',sans-serif;font-size:16px;line-height:1.45;color:$TEXTE;margin-top:9px}

/* Langues : une jauge en cinq crans, pleine pour la langue maternelle. */
.lg{display:grid;grid-template-columns:1fr 1fr;gap:18px 60px;position:relative;margin-top:6px}
.l{display:flex;align-items:center;gap:18px}
.l b{width:120px;font-family:'Space Grotesk',sans-serif;font-weight:600;font-size:19px;color:$TITRE}
.l s{display:flex;gap:6px;text-decoration:none}
.l s i{width:30px;height:8px;border-radius:4px;background:$FIL}
.l s i.p{background:$ACC}
.l span{font-family:'JetBrains Mono',monospace;font-size:13px;letter-spacing:1px;color:$DATE}
.hd.b2{margin:40px 0 26px}
$([ "$THEME" = clair ] && carte_claire "$ACC" "$AC2")
</style></head><body>
<div class="w"><div class="grid"></div>
<div class="hd"><i></i><b>$3</b></div>
$4
<div class="ln"></div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 --force-device-scale-factor=2 $DETOUR \
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

carte experience 880 "$(t 'Expérience' 'Experience')" "<div class='fr'>
$(e "$(t 'sept. 2025' 'Sep 2025') → $A" "$(t 'Fondateur et directeur technique' 'Founder and CTO')" \
  "$(t 'CoasterSystems, micro-entreprise' 'CoasterSystems, sole company')" \
  "$(t "Systèmes embarqués sur ESP32, électronique, modules audio et capteurs, et le logiciel de l'écosystème MicroCoaster." 'Embedded systems on ESP32, electronics, audio modules and sensors, and the software behind the MicroCoaster ecosystem.')" on)
$(e "$(t 'déc. 2024' 'Dec 2024') → $A" "$(t 'Alternant ingénieur cyberdéfense' 'Cyber defence engineering apprentice')" \
  "$(t 'Groupe de santé et d’assurance, Quimper' 'Health and insurance group, Quimper')" \
  "$(t "Analyse des journaux de sécurité dans un SIEM, supervision, sécurité réseau et durcissement de l'infrastructure." 'Security log analysis in a SIEM, monitoring, network security and infrastructure hardening.')" on)
$(e "$(t 'sept. → oct. 2024' 'Sep → Oct 2024')" "$(t 'Alternant ingénieur cyberdéfense' 'Cyber defence engineering apprentice')" \
  "$(t 'Avril, Bruz' 'Avril, Bruz')" "")
$(e "$(t 'janv. → mars 2024' 'Jan → Mar 2024')" "$(t 'Assistant de recherche, stage' 'Research assistant, internship')" \
  "$(t 'Université de la Bundeswehr, Munich' 'Bundeswehr University Munich')" \
  "$(t 'Laboratoire de cybersécurité RI CODE : prototypes matériels, protocoles de communication résilients, interface du centre d’opérations.' 'RI CODE cyber security lab: hardware prototypes, resilient communication protocols, operations centre front end.')")
$(e '2021 → 2024' "$(t 'Jobs saisonniers' 'Seasonal jobs')" \
  "$(t 'Yelloh Village et Marvilla Parks à Bénodet, E.Leclerc Pont-l’Abbé' 'Yelloh Village and Marvilla Parks in Bénodet, E.Leclerc Pont-l’Abbé')" \
  "$(t 'Cuisine en saison sur un camping cinq étoiles, logistique en magasin. Rapidité, endurance, sang-froid face au rush.' 'Kitchen work on a five star campsite, in-store logistics. Speed, stamina, keeping calm under the rush.')")
$(e '2017 → 2021' "$(t 'Conseiller municipal des jeunes' 'Youth town councillor')" \
  "$(t 'Mairie de Combrit' 'Combrit town hall')" \
  "$(t 'Quatre ans à monter des projets pour les jeunes de la commune, puis un été au port de plaisance de Sainte-Marine.' 'Four years building projects for the town’s young people, then a summer at the Sainte-Marine marina.')")
</div>"

carte formation 425 "$(t 'Formation' 'Education')" "<div class='fr'>
$(e "2022 → 2027" "$(t 'Diplôme d’ingénieur en cyberdéfense' 'Engineering degree in cyber defence')" \
  "$(t 'ENSIBS, Vannes, en alternance' 'ENSIBS, Vannes, work-study')" \
  "$(t 'Parcours cyber opérationnel, après deux ans de cycle préparatoire intégré.' 'Operational cyber track, after a two-year integrated preparatory cycle.')" on)
$(e "2022 → 2024" "$(t 'DUT, cycle préparatoire intégré' 'DUT, integrated preparatory cycle')" \
  "$(t 'IUT de Vannes, avec l’ENSIBS' 'IUT de Vannes, with ENSIBS')" "")
$(e "2020 → 2022" "$(t 'Baccalauréat STI2D, mention Bien' 'STI2D baccalaureate, with honours')" \
  "$(t 'Le Likès, Quimper' 'Le Likès, Quimper')" \
  "$(t 'Sciences et technologies de l’industrie et du développement durable.' 'Industrial science and technology, sustainable development.')")
</div>"

carte certifs 680 "$(t 'Certifications et secourisme' 'Certifications and first aid')" "<div class='tu'>
$(t2 'TOEIC' "$(t '785 ET PLUS · B2' '785 AND UP · B2')" "$(t 'Anglais professionnel, compréhension écrite et orale.' 'Professional English, reading and listening.')")
$(t2 'Le Robert' "$(t 'NIVEAU AVANCÉ' 'ADVANCED LEVEL')" "$(t 'Certificat de maîtrise du français écrit.' 'Certificate in written French.')")
$(t2 'BNSSA' "$(t 'SAUVETEUR AQUATIQUE' 'LIFEGUARD')" "$(t 'Brevet national de sécurité et de sauvetage aquatique.' 'French national lifeguard certificate.')")
$(t2 'PSE1 · PSE2' "$(t 'SECOURISTE' 'FIRST RESPONDER')" "$(t 'Premiers secours en équipe, niveaux 1&nbsp;et&nbsp;2.' 'Team first aid, levels 1&nbsp;and&nbsp;2.')")
$(t2 "$(t 'Permis B' 'Driving licence')" "$(t 'VÉHICULÉ' 'OWN CAR')" "$(t 'Mobile partout en Bretagne, et au-delà.' 'Mobile across Brittany, and beyond.')")
$(t2 "$(t 'Sauvetage' 'Lifesaving')" "$(t 'SPORT ET LOISIR' 'SPORT')" "$(t 'Dans la continuité du BNSSA et du secourisme.' 'Hand in hand with lifeguarding and first aid.')")
</div>
<div class='hd b2'><i></i><b>$(t 'Langues' 'Languages')</b></div>
<div class='lg'>
$(lg "$(t 'Français' 'French')" 5 "$(t 'LANGUE MATERNELLE' 'NATIVE')")
$(lg "$(t 'Anglais' 'English')" 4 "$(t 'B2 · TOEIC' 'B2 · TOEIC')")
$(lg "$(t 'Allemand' 'German')" 2 "$(t 'NOTIONS' 'BASIC')")
$(lg "$(t 'Espagnol' 'Spanish')" 2 "$(t 'NOTIONS' 'BASIC')")
</div>"
