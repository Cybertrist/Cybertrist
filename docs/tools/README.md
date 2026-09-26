# Les outils qui dessinent ce README

Aucune image de ce dépôt n'est un export d'un logiciel de dessin. Chacune
est une page HTML que Chrome capture en mode headless, à deux ou trois fois
la taille d'affichage pour rester nette sur un écran dense. Le texte d'une
bannière se corrige donc en modifiant une ligne de script, pas en rouvrant
un fichier image.

## Refaire toutes les images

    bash docs/tools/tout.sh

Cela rend les deux langues et les deux thèmes. Les scripts écrivent dans `docs/tools/png/`,
`stack/`, `liens/` et `langues/`, suffixés `-en` pour l'anglais, qui ne
sont pas versionnés. `installer.sh` recopie ensuite les fichiers
retenus dans `docs/` et `docs/en/`.

Pour une seule carte, un seul script suffit :

    bash docs/tools/smartbudget.sh
    LANGUE=en bash docs/tools/smartbudget.sh
    bash docs/tools/installer.sh
    LANGUE=en bash docs/tools/installer.sh

Chrome est cherché dans `C:\Program Files\Google\Chrome\Application`. La
variable d'environnement `CHROME` prend le dessus s'il est ailleurs.

## Les deux langues

`README.md` porte le français, `README.en.md` l'anglais, et chaque page
ouvre sur deux pastilles qui mènent à l'autre. GitHub retirant JavaScript
et CSS des README, rien ne peut basculer la page sur place : ce sont deux
fichiers et un lien, ce que font tous les dépôts bilingues.

`langue.sh` porte la bascule. Dans les scripts, `t <français> <anglais>`
choisit la chaîne : les deux versions d'un texte vivent sur la même ligne,
ce qui rend impossible d'en corriger une en oubliant l'autre.

Dix images ne portent aucun texte, les rangées de logos, les tuiles de
contact et la pastille d'adresse : les deux pages pointent sur les mêmes
fichiers, dans `docs/`.

## Les deux thèmes

GitHub affiche la page sur fond noir ou sur fond blanc, selon le réglage
du visiteur. Chaque image porteuse d'un fond ou d'un texte a donc une
jumelle claire, et le README les sert par une balise `<picture>` :

    <picture><source media="(prefers-color-scheme: light)" srcset="docs/clair/banniere.png"><img src="docs/banniere.png" ...></picture>

GitHub la résout selon le thème du site, pas celui du système. Le `<img>`
reste la version sombre, celle que voit tout lecteur qui ignore `<picture>`.

`THEME=clair` fait rendre à chaque script sa jumelle dans les dossiers
suffixés `-clair`, et `installer.sh` la pose dans `docs/clair/` ou
`docs/en/clair/`. Dans les scripts, `c <sombre> <clair>` choisit la
couleur, sur le modèle de `t` : les deux valeurs sont côte à côte, et le
rendu sombre reste identique au pixel près.

    THEME=clair bash docs/tools/smartbudget.sh
    THEME=clair bash docs/tools/installer.sh

En clair, chaque carte de projet prend un accent un cran plus soutenu, qui
tient sur fond blanc, et un fond à peine teinté de sa couleur. Les logos
gardent leur plaque sombre. Les rangées de logos et les tuiles de contact
n'ont pas de jumelle : leurs couleurs de marque tiennent sur les deux
fonds. Les badges shields.io passent du fond `0D1117` au gris `F6F8FA`.

## Ce que fait chaque script

- `cartes.sh` : le gabarit commun des cartes 1280x320. Ne se lance pas
  seul, les autres le chargent.
- `banniere.sh` : l'en-tête du profil.
- `sections.sh` : les cinq bandeaux de section, numérotés.
- `projets.sh` : les quatre cartes de projet qui suivent le gabarit.
- `serenity.sh` : la carte Serenity, qui a le sien.
- `cybersas.sh` : la carte de CyberSas.
- `smartbudget.sh` : la carte de Smart Budget.
- `stack-tuiles.sh` : les rangées de logos de la stack.
- `stack-intitules.sh` : les intitulés qui les séparent.
- `liens.sh` : le gabarit des tuiles de contact. Chargé par `contact.sh`.
- `contact.sh` : les quatre tuiles de contact et la pastille d'adresse.
- `pastilles.sh` : les deux pastilles du sélecteur de langue, allumée et
  éteinte dans chaque langue.
- `langue.sh` : les bascules `LANGUE` et `THEME`, les fonctions `t` et `c`.
  Ne se lance pas seul, tous les autres le chargent.
- `installer.sh` : repose les images rendues dans `docs/` ou `docs/en/`,
  et leur sous-dossier `clair/` pour le thème clair.
- `tout.sh` : enchaîne tout ce qui précède, dans les deux langues et les
  deux thèmes.

## Ce dont ils dépendent

`icones/` porte les logos que skillicons.dev ne fournit pas, et `icones/sk/`
ceux qu'il fournit, repris tels quels pour que les deux rangées s'alignent.
`src-icone.png` est l'icône BodyCount.

Une dépendance sort du dépôt, par un chemin local : le logo MicroCoaster,
dans `Microcoaster-bot-org/images/logo.png`. Si ce dépôt n'est pas cloné
à côté de celui-ci, la carte MicroCoaster se rend sans sa plaque.

Les polices, Syne, Space Grotesk, JetBrains Mono, Saira Stencil One et
Playfair Display, sont chargées depuis Google Fonts au moment du rendu :
il faut une connexion.
