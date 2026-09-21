<div align="center">

<img src="docs/banniere.png" alt="Tristan Joncour, cyberdéfense, infrastructure, systèmes embarqués" width="100%">

<p>
  <img src="https://img.shields.io/badge/ENSIBS-Ing%C3%A9nieur%20Cyberd%C3%A9fense-0D1117?style=for-the-badge&logo=akamai&logoColor=E23B4E&labelColor=0D1117" alt="ENSIBS" />
  <img src="https://img.shields.io/badge/Bretagne-France-0D1117?style=for-the-badge&logo=googlemaps&logoColor=E23B4E&labelColor=0D1117" alt="Bretagne" />
  <a href="https://spaceprojects.fr/"><img src="https://img.shields.io/badge/spaceprojects.fr-E23B4E?style=for-the-badge&logo=firefoxbrowser&logoColor=white&labelColor=0D1117" alt="Site" /></a>
</p>

</div>

---

Élève ingénieur à l'**ENSIBS**, filière **cyberdéfense**, l'une des rares écoles françaises entièrement dédiées à la cybersécurité.

Ce qui m'intéresse, c'est la chaîne complète et ses points de rupture. J'ai conçu une **carte électronique** de zéro, écrit le firmware qui tourne dessus, fait remonter sa télémétrie jusqu'à une application web, et sécurisé le trajet entre les deux. Le même réflexe m'a fait monter des attaques MITM sur mes propres échanges RSA, pour voir lesquelles passaient avant d'ajouter la signature qui les bloque.

Je travaille aussi sur la **détection** au quotidien : SIEM, corrélation d'événements, analyse d'incidents, et l'**infrastructure réseau** qui va avec.

> Ouvert à une **alternance** ou un **stage** en cybersécurité, infrastructure ou systèmes embarqués.

---

## Projet phare

<a href="https://github.com/Cybertrist/Microcoaster"><img src="docs/projets/microcoaster.png" alt="MicroCoaster, une carte conçue de zéro, son firmware et l'application web qui la pilote" width="100%"></a>

<table>
<tr>
<td width="33%" valign="top" align="center">

**🔌 Matériel**

PCB dessinée intégralement, choix et routage de tous les composants, microcontrôleur embarqué.

</td>
<td width="33%" valign="top" align="center">

**📡 IoT**

Remontée de la télémétrie du matériel vers le serveur, liaison chiffrée de bout en bout.

</td>
<td width="33%" valign="top" align="center">

**🌐 Logiciel**

Application web de pilotage, plus l'écosystème de support : garanties, billetterie, documentation.

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

## Sécurité et cryptographie

<table>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/Serenity"><img src="docs/projets/serenity.png" alt="Serenity, coffre de mots de passe auto-hébergé zéro connaissance" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/Messagerie-securise-RSA-AES"><img src="docs/projets/messagerie.png" alt="Messagerie chiffrée RSA et AES" width="100%"></a></td>
</tr>
</table>

**Serenity** est le projet sur lequel je mets le plus d'exigence. Le serveur ne voit jamais rien en clair : dérivation Argon2id, chiffrement XChaCha20-Poly1305 côté client via libsodium. Un agent autonome surveille les fuites connues et fait tourner les mots de passe compromis tout seul, sous liste blanche et coupe-circuit. 163 tests Python, 43 TypeScript, et 8 jobs de CI par pull request dont un exercice de restauration qui détruit vraiment un coffre jetable.

---

## Bas niveau et algorithmique

<table>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/DIR-ASM"><img src="docs/projets/dirasm.png" alt="Dir ASM, la commande dir slash s réécrite en assembleur x86" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/Huffman"><img src="docs/projets/huffman.png" alt="Codage de Huffman, trois variantes de compression" width="100%"></a></td>
</tr>
</table>

---

## Applications

<table>
<tr>
<td width="50%"><a href="https://github.com/Cybertrist/BeVannes"><img src="docs/projets/bevannes.png" alt="BeVannes, BeReal rencontre GeoGuessr" width="100%"></a></td>
<td width="50%"><a href="https://github.com/Cybertrist/ubhess-emargement"><img src="docs/projets/emargement.png" alt="Émargement UBS, automatisation Moodle" width="100%"></a></td>
</tr>
</table>

**KyrlCut**, plateforme de réservation livrée à un client, en production sur `kyrlcut.fr`. Développée pour un ami coiffeur qui gérait ses rendez-vous par messages. Accès sur invitation uniquement : il distribue un code à ses clients, eux seuls peuvent créer un compte. Créneaux découpés automatiquement selon la durée de la prestation, confirmations et annulations par email, back-office complet.

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
