#!/usr/bin/env bash
# Wipe one team's instance back to factory state: the next visitor to its URL
# gets the "Set up owner account" screen again. Use when a team locks themselves
# out, someone else claimed their instance, or they want a clean slate.
#
# Usage: reset-team.sh <team>
set -euo pipefail

DIR="${N8N_DIR:-/opt/n8n}"
team="${1:?usage: reset-team.sh <team>}"
team="${team,,}"
cd "$DIR"

grep -qx "$team" <(sed -e 's/#.*//' -e 's/[[:space:]]//g' teams.txt | tr '[:upper:]' '[:lower:]') \
  || { echo "unknown team '$team' (see teams.txt)" >&2; exit 1; }

project=$(basename "$DIR")           # compose project name = folder name (n8n)
volume="${project}_n8n_${team}"

echo "Stopping n8n-${team} and deleting volume ${volume} ..."
docker compose rm -sf "n8n-${team}"
docker volume rm -f "$volume" >/dev/null
docker compose up -d "n8n-${team}"
echo "n8n-${team} is back up empty — https://${team}.$(sed -n 's/^BASE_DOMAIN=//p' .config) will show the owner setup screen."
