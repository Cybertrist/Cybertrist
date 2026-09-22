#!/bin/bash
# La carte du bot de la salle de sport.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/cartes.sh" >/dev/null 2>&1

ban gomuscu "#4ADE80" "#22C55E" "#04120A" \
'<svg viewBox="0 0 146 146" fill="none">
  <g stroke="#FAFAFA" stroke-width="7" stroke-linecap="round">
    <path d="M44 73h58"/></g>
  <g stroke="#4ADE80" stroke-width="7" stroke-linecap="round">
    <path d="M32 53v40M50 45v56M96 45v56M114 53v40"/></g>
  <g stroke="#FAFAFA" stroke-width="7" stroke-linecap="round" opacity=".5">
    <path d="M18 63v20M128 63v20"/></g>
</svg>' \
'Go<em>Muscu</em>' \
"$(t 'Le bot Discord qui suit les séances de la salle,' 'The Discord bot that tracks the gym sessions,')" \
"$(t 'tient les comptes et relance ceux qui sèchent.' 'keeps the tally, and nudges whoever skips.')" \
"$(P 'DISCORD.JS' 'NODE.JS' 'JSON' 'CRON')" \
'BOT' ''
