<div align="center">

<img src="docs/banniere.png" alt="Tristan Joncour, cyberdéfense, infrastructure, systèmes embarqués" width="100%">

<p>
  <img src="https://img.shields.io/badge/ENSIBS-Ing%C3%A9nieur%20Cyberd%C3%A9fense-0D1117?style=for-the-badge&logo=akamai&logoColor=58A6FF&labelColor=0D1117" alt="ENSIBS" />
  <img src="https://img.shields.io/badge/Bretagne-France-0D1117?style=for-the-badge&logo=googlemaps&logoColor=58A6FF&labelColor=0D1117" alt="Bretagne" />
  <a href="https://spaceprojects.fr/"><img src="https://img.shields.io/badge/spaceprojects.fr-1F6FEB?style=for-the-badge&logo=firefoxbrowser&logoColor=white&labelColor=0D1117" alt="Site" /></a>
  <img src="https://komarev.com/ghpvc/?username=Cybertrist&style=for-the-badge&color=1F6FEB&label=VUES" alt="Vues du profil" />
</p>

</div>

---

Élève ingénieur à l'**ENSIBS**, filière **cyberdéfense**, l'une des rares écoles françaises entièrement dédiées à la cybersécurité.

Ce qui m'intéresse, c'est la chaîne complète. Pas seulement le code : le capteur, la carte qui le porte, le protocole qui remonte la mesure, le serveur qui la reçoit, et la façon dont tout ça casse quand on le pousse. J'ai dessiné une PCB de zéro et écrit le firmware qui tourne dessus. J'ai aussi monté des attaques MITM sur mes propres échanges RSA pour voir lesquelles passaient.

En parallèle, je travaille sur la **détection** (SIEM, corrélation d'événements, analyse d'incidents) et sur l'**infrastructure réseau** au quotidien.

```console
$ whoami --now
  focus       : cyberdéfense, détection, durcissement système
  en cours    : Serenity, coffre de mots de passe zéro connaissance
  je creuse   : reverse proxy et VPN maison, réseau bas niveau, embarqué
  ouvert à    : alternance ou stage en cybersécurité, infrastructure, embarqué
```

---

## 🏭 Projet phare : MicroCoaster™

> **Une carte électronique conçue de zéro, son firmware, et l'application web qui la pilote.**
> Projet mené avec **MicroCoaster™**, une entreprise réelle, de la conception matérielle jusqu'à la mise en production.

<table>
<tr>
<td width="33%" valign="top" align="center">

### 🔌 Matériel

PCB **dessinée intégralement**, choix et routage de tous les composants, microcontrôleur embarqué.

<img src="https://img.shields.io/badge/PCB-design-4CAF50?style=flat-square&logo=kicad&logoColor=white" /><br>
<img src="https://img.shields.io/badge/Microcontr%C3%B4leur-embarqu%C3%A9-525252?style=flat-square&logo=arduino&logoColor=white" />

</td>
<td width="33%" valign="top" align="center">

### 📡 IoT

Remontée des mesures du matériel vers le serveur, liaison chiffrée de bout en bout.

<img src="https://img.shields.io/badge/IoT-t%C3%A9l%C3%A9m%C3%A9trie-FF6F00?style=flat-square&logo=mqtt&logoColor=white" /><br>
<img src="https://img.shields.io/badge/HTTPS-TLS-2EA043?style=flat-square&logo=letsencrypt&logoColor=white" />

</td>
<td width="33%" valign="top" align="center">

### 🌐 Logiciel

Application web de pilotage, plus l'écosystème de support : garanties, billetterie, documentation.

<img src="https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white" /><br>
<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white" />

</td>
</tr>
</table>

<div align="center">
<sub>Dépôts liés :
<a href="https://github.com/Cybertrist/Microcoaster">bot support et garanties</a> ·
<a href="https://github.com/Cybertrist/MicroCoaster_Docs">documentation</a> ·
<a href="https://github.com/Cybertrist/MicroCoaster_Forum">forum</a></sub>
</div>

---

## 🔐 Sécurité et cryptographie

<div align="center">

<a href="https://github.com/Cybertrist/Serenity">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=Serenity&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>
<a href="https://github.com/Cybertrist/Messagerie-securise-RSA-AES">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=Messagerie-securise-RSA-AES&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>

</div>

**Serenity** est le projet sur lequel je mets le plus d'exigence. Le serveur ne voit jamais rien en clair : dérivation Argon2id, chiffrement XChaCha20-Poly1305 côté client via libsodium. Un agent autonome surveille les fuites connues et fait tourner les mots de passe compromis tout seul, sous liste blanche et coupe-circuit. 163 tests Python, 43 TypeScript, 8 jobs de CI par pull request dont un exercice de restauration qui détruit vraiment un coffre jetable.

---

## 🛠️ Ingénierie et bas niveau

<div align="center">

<a href="https://github.com/Cybertrist/DIR-ASM">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=DIR-ASM&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>
<a href="https://github.com/Cybertrist/Huffman">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=Huffman&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>

</div>

---

## 📱 Applications

<div align="center">

<a href="https://github.com/Cybertrist/Microcoaster">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=Microcoaster&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>
<a href="https://github.com/Cybertrist/BeVannes">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=Cybertrist&repo=BeVannes&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&border_color=30363D&description_lines_count=3" />
</a>

</div>

**KyrlCut**, plateforme de réservation livrée à un client. Développée pour un ami coiffeur qui gérait ses rendez-vous par messages. Accès sur invitation uniquement : il distribue un code à ses clients, eux seuls peuvent créer un compte. Créneaux découpés automatiquement selon la durée de la prestation, confirmations et annulations par email, back-office complet. En production sur `kyrlcut.fr`.

---

## 🚧 En chantier

| Projet | Où j'en suis |
|:--|:--|
| **Reverse proxy et VPN auto-hébergés** | Atteindre mes services à distance sans dépendre de Tailscale : TLS, authentification en amont, exposition minimale |
| **Gestionnaire de budget** | Application de suivi de dépenses, prochaine sur la liste |
| **BodyCount** | Journal chiffré hors ligne sur Android. Fonctionnel, reste le chiffrement de la base au repos |

---

## Stack

<div align="center">

**Langages**

<img src="https://skillicons.dev/icons?i=python,js,ts,java,dart,c,bash&theme=dark" alt="Langages" />

**Web et mobile**

<img src="https://skillicons.dev/icons?i=nodejs,express,react,fastapi,flutter,tailwind,vite,html&theme=dark" alt="Web et mobile" />

**Infrastructure et données**

<img src="https://skillicons.dev/icons?i=linux,debian,docker,nginx,mysql,sqlite,firebase,git,githubactions&theme=dark" alt="Infrastructure" />

**Sécurité et embarqué**

<img src="https://skillicons.dev/icons?i=kali,arduino,raspberrypi,cloudflare&theme=dark" alt="Sécurité et embarqué" />

</div>

<div align="center">
<sub>
Au quotidien : SIEM et corrélation d'événements · analyse d'incidents · assembleur x86 (MASM32) · Argon2id et libsodium · Playwright et Selenium · restic · Tailscale
</sub>
</div>

---

## Statistiques

<div align="center">

<img height="170" src="https://github-readme-stats.vercel.app/api?username=Cybertrist&show_icons=true&hide_border=true&count_private=true&include_all_commits=true&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9&icon_color=1F6FEB&ring_color=58A6FF" alt="Statistiques GitHub" />
<img height="170" src="https://github-readme-stats.vercel.app/api/top-langs/?username=Cybertrist&layout=compact&hide_border=true&langs_count=8&hide=html,css&bg_color=0D1117&title_color=58A6FF&text_color=C9D1D9" alt="Langages" />

<br>

<img height="170" src="https://github-readme-streak-stats.herokuapp.com/?user=Cybertrist&hide_border=true&background=0D1117&stroke=30363D&ring=58A6FF&fire=1F6FEB&currStreakLabel=58A6FF&sideLabels=C9D1D9&dates=8B949E&currStreakNum=C9D1D9" alt="Série de contributions" />

</div>

---

<div align="center">

<a href="mailto:tristanjoncour29@gmail.com"><img src="https://img.shields.io/badge/Me%20contacter-1F6FEB?style=for-the-badge&logo=gmail&logoColor=white&labelColor=0D1117" alt="Email" /></a>
<a href="https://spaceprojects.fr/"><img src="https://img.shields.io/badge/Portfolio-58A6FF?style=for-the-badge&logo=aboutdotme&logoColor=white&labelColor=0D1117" alt="Portfolio" /></a>

<br><br>

<sub><i>Construire, puis chercher où ça casse.</i></sub>

<br><br>

[![Spotify](https://spotify-github-profile.kittinanx.com/api/view?uid=opvbaos7dvnawhftj0c4ge42o&cover_image=true&theme=novatorem&show_offline=false&background_color=0d1117&bar_color=58a6ff&bar_color_cover=false)](https://spotify-github-profile.vercel.app/api/view?uid=opvbaos7dvnawhftj0c4ge42o&redirect=true)

</div>
