#!/bin/bash
# Les tuiles de la rangée de contact, et la pastille d'adresse qui la suit.
# Les quatre marques sont reprises telles quelles au pack skillicons, pour
# que la rangée s'aligne sur celles de la stack.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/liens.sh" >/dev/null 2>&1

pack gmail
pack discord
pack instagram
pack spotify

adresse adresse "tristanjoncour29@gmail.com"
