# Les outils qui dessinent ce README

Aucune image de ce dépôt n'est un export d'un logiciel de dessin. Chacune
est une page HTML que Chrome capture en mode headless, à deux ou trois fois
la taille d'affichage pour rester nette sur un écran dense. Le texte d'une
bannière se corrige donc en modifiant une ligne de script, pas en rouvrant
un fichier image.

## Refaire toutes les images

    bash docs/tools/tout.sh

Les scripts rendent dans `docs/tools/png/`, `stack/`, `liens/` et `notes/`,
qui ne sont pas versionnés. `installer.sh` recopie ensuite les fichiers
retenus à leur place dans `docs/`. Chaque script se lance aussi seul, si
une seule carte a bougé.

Chrome est cherché dans `C:\Program Files\Google\Chrome\Application`. La
variable d'environnement `CHROME` prend le dessus s'il est ailleurs.

## Ce que fait chaque script

- `cartes.sh` : le gabarit commun des cartes 1280x320. Ne se lance pas
  seul, les autres le chargent.
- `banniere.sh` : l'en-tête du profil.
- `sections.sh` : les six bandeaux de section, numérotés.
- `projets.sh` : les huit cartes de projet qui suivent le gabarit.
- `serenity.sh` : la carte Serenity, qui a le sien.
- `basicfit.sh` : les trois cartes des bots Basic-Fit.
- `gomuscu.sh` : la carte de GoMuscu.
- `cybersas.sh` : les deux cartes de CyberSas, celle de la grille de
  projets et celle d'« En chantier ».
- `smartbudget.sh` : les deux cartes de Smart Budget.
- `bodycount.sh` : la carte « En chantier » de BodyCount.
- `stack-tuiles.sh` : les rangées de logos de la stack.
- `stack-intitules.sh` : les intitulés qui les séparent.
- `liens.sh` : le gabarit des tuiles de contact. Chargé par `contact.sh`.
- `contact.sh` : les quatre tuiles de contact et la pastille d'adresse.
- `note.sh` : l'avertissement sur les dépôts privés.

## Ce dont ils dépendent

`icones/` porte les logos que skillicons.dev ne fournit pas, et `icones/sk/`
ceux qu'il fournit, repris tels quels pour que les deux rangées s'alignent.
`src-icone.png` est l'icône BodyCount.

Quatre dépendances sortent du dépôt, et sont des chemins locaux : le logo
MicroCoaster, dans `Microcoaster/images/logo.png`, et ceux des trois bots,
dans `Basicfit-Coach`, `Basicfit-Manager` et `Basicfit-Securite`, sous
`images/logo.png`. Si ces dépôts ne sont pas clonés à côté de celui-ci, les
cartes concernées se rendent sans leur plaque. Les autres ne bougent pas.

Les polices, Syne, Space Grotesk, JetBrains Mono, Saira Stencil One et
Playfair Display, sont chargées depuis Google Fonts au moment du rendu :
il faut une connexion.
