<div align="center">

<img src="docs/banniere.png" alt="Tristan Joncour, cyberdéfense, infrastructure, systèmes embarqués" width="100%">

<p>
  <img src="https://img.shields.io/badge/ENSIBS-Ing%C3%A9nieur%20Cyberd%C3%A9fense-0D1117?style=for-the-badge&logo=akamai&logoColor=E23B4E&labelColor=0D1117" alt="ENSIBS" />
  <img src="https://img.shields.io/badge/Bretagne-France-0D1117?style=for-the-badge&logo=googlemaps&logoColor=E23B4E&labelColor=0D1117" alt="Bretagne" />
  <a href="https://spaceprojects.fr/"><img src="https://img.shields.io/badge/spaceprojects.fr-E23B4E?style=for-the-badge&logo=firefoxbrowser&logoColor=white&labelColor=0D1117" alt="Site" /></a>
</p>

</div>

---

Élève ingénieur en **cyberdéfense** à l'**ENSIBS**, à Vannes, en alternance dans une équipe d'infrastructure technique.

Je me suis orienté vers la sécurité pour une raison simple : j'aime comprendre comment un système fonctionne, repérer où il cède, et trouver ce qu'il faut pour qu'il tienne. Mon parcours m'a fait passer par le développement, l'administration système, le réseau et la sécurité, et c'est cette vision d'ensemble qui m'intéresse aujourd'hui, plutôt qu'un outil isolé.

**Quand une contrainte revient trop souvent, j'écris ce qui la fait disparaître.** La plupart des projets ci-dessous sont nés comme ça : un émargement à cliquer chaque semaine, un ami coiffeur qui gérait ses rendez-vous par messages, des mots de passe éparpillés sans coffre à qui les confier.

### Au quotidien

Exploitation et analyse des journaux de sécurité avec un **SIEM**, détection d'événements, audit de configurations, administration système et problématiques réseau.

En parallèle, mes projets personnels et académiques me font creuser **Python**, **Linux**, la **cryptographie appliquée** et la sécurité. Ce qui me plaît, c'est le passage de la théorie à la pratique : comprendre le problème, expérimenter, analyser, puis sécuriser l'existant.

### Objectif

Un premier poste au **Luxembourg** à partir de **septembre 2027**, à l'issue de mon cursus d'ingénieur.

Je m'intéresse aux opportunités en **cybersécurité**, **infrastructure**, **sécurité opérationnelle** et **ingénierie des systèmes et réseaux**. Continuer à apprendre, gagner en expertise, et contribuer à la sécurité des systèmes d'information.

---

## Projets

<a href="https://github.com/Microcoaster"><img src="docs/projets/microcoaster.png" alt="MicroCoaster, embarqué : une carte conçue de zéro, son firmware et l'application web qui la pilote" width="100%"></a>

<sub>Projet mené au sein de l'organisation <a href="https://github.com/Microcoaster"><b>MicroCoaster</b></a> (<a href="https://microcoaster.com">microcoaster.com</a>) : conception des PCB, firmware ESP32 des modules, gestionnaire Wi-Fi, application web de pilotage. Autour : <a href="https://github.com/Microcoaster/Microcoaster-bot">bot garanties et billetterie</a> · <a href="https://github.com/Cybertrist/MicroCoaster_Docs">documentation</a> · <a href="https://github.com/Cybertrist/MicroCoaster_Forum">forum</a></sub>

<table>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/Serenity"><img src="docs/projets/serenity.png" alt="Serenity, sécurité : coffre de mots de passe auto-hébergé et zéro connaissance" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/Messagerie-securise-RSA-AES"><img src="docs/projets/messagerie.png" alt="Messagerie chiffrée, cryptographie : RSA, AES et attaques MITM" width="100%"></a></td>
</tr>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/DIR-ASM"><img src="docs/projets/dirasm.png" alt="Dir ASM, bas niveau : la commande dir slash s réécrite en assembleur x86" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/Huffman"><img src="docs/projets/huffman.png" alt="Codage de Huffman, algorithmique : trois variantes de compression" width="100%"></a></td>
</tr>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/BeVannes"><img src="docs/projets/bevannes.png" alt="BeVannes, mobile : BeReal rencontre GeoGuessr" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/ubhess-emargement"><img src="docs/projets/emargement.png" alt="Émargement UBS, automatisation : Moodle piloté par Selenium" width="100%"></a></td>
</tr>
<tr>
<td width="50%"><img src="docs/projets/kyrlcut.png" alt="KyrlCut, web : réservation en ligne pour salon de coiffure, dépôt privé" width="100%"></td>
<td width="50%"><a href="https://github.com/Cybertrist/BodyCount"><img src="docs/projets/bodycount.png" alt="BodyCount, mobile : journal chiffré hors ligne sur Android" width="100%"></a></td>
</tr>
</table>

<sub>Chaque bannière porte sa catégorie en haut à droite. KyrlCut est marqué <b>privé</b> : c'est un livrable client, son code reste fermé.</sub>

**Serenity** est le projet sur lequel je mets le plus d'exigence. Le serveur ne voit jamais rien en clair : dérivation Argon2id, chiffrement XChaCha20-Poly1305 côté client via libsodium. Un agent autonome surveille les fuites connues et fait tourner les mots de passe compromis, sous liste blanche et coupe-circuit. 163 tests Python, 43 TypeScript, et 8 jobs de CI par pull request dont un exercice de restauration qui détruit vraiment un coffre jetable.

---

## En chantier

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
Au quotidien : SIEM et corrélation d'événements · analyse d'incidents · assembleur x86 (MASM32) · Argon2id et libsodium · conception de PCB · Playwright et Selenium · restic · Tailscale
</sub>
</div>

---

<div align="center">

<a href="mailto:tristanjoncour29@gmail.com"><img src="https://img.shields.io/badge/Me%20contacter-E23B4E?style=for-the-badge&logo=gmail&logoColor=white&labelColor=0D1117" alt="Email" /></a>
<a href="https://spaceprojects.fr/"><img src="https://img.shields.io/badge/Portfolio-A31D2C?style=for-the-badge&logo=aboutdotme&logoColor=white&labelColor=0D1117" alt="Portfolio" /></a>

<br><br>

<sub><i>Construire, puis chercher où ça casse.</i></sub>

<br><br>

[![Spotify](https://spotify-github-profile.kittinanx.com/api/view?uid=opvbaos7dvnawhftj0c4ge42o&cover_image=true&theme=novatorem&show_offline=false&background_color=0d1117&bar_color=e23b4e&bar_color_cover=false)](https://spotify-github-profile.vercel.app/api/view?uid=opvbaos7dvnawhftj0c4ge42o&redirect=true)

</div>
