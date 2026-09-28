#!/bin/bash
# La carte du Redoublant, mon premier roman. Elle mène à la liseuse en
# ligne, un site à part, pas au dépôt. Elle n'est pas affichée dans le
# README (retirée à la demande le 29/09/2026), mais reste générée ici.
#
# La plaque est la couverture elle-même, en hauteur comme un livre posé :
# largeur automatique, jamais étirée. L'accent reprend l'or du titre.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1
GL="<img src='file:///$B/redoublant-couv.jpg' style='height:146px;width:auto;border-radius:2px 5px 5px 2px;box-shadow:0 12px 30px $OMBRE,0 0 0 1px rgba(255,255,255,.08)'>"

ban p-redoublant "$(c '#C9A36A' '#9C7A45')" "#7E5E2E" "$(c '#0E0B09' '#FFFBF4')" "$GL" \
'Le <em>Redoublant</em>' \
"$(t 'Mon premier roman, premier tome des Récits brûlants.' 'My first novel, book one of Les Récits brûlants.')" \
"$(t 'À lire en ligne, en entier, dans un livre qui se feuillette.' 'Read it online, cover to cover, in a book you can flip through.')" \
"$(P "$(t 'ROMAN' 'NOVEL')" "$(t 'AUTO-ÉDITION' 'SELF-PUBLISHED')" '2026' '18+')" \
"$(C "$(t 'ÉCRITURE' 'WRITING')" "$(t 'LIVRE' 'BOOK')")" ""
