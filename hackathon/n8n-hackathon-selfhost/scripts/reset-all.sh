#!/usr/bin/env bash
# Wipe EVERY team's instance back to factory state (all workflows, credentials and
# owner accounts gone). Certificates and the host itself are kept, so this takes
# ~1 minute instead of a full rebuild. Every team URL shows the owner setup screen again.
#
# Usage: reset-all.sh --yes
set -euo pipefail

DIR="${N8N_DIR:-/opt/n8n}"
[[ "${1:-}" == "--yes" ]] || { echo "This deletes all 10 teams' data. Re-run with --yes to confirm." >&2; exit 1; }
cd "$DIR"

mapfile -t TEAMS < <(sed -e 's/#.*//' -e 's/[[:space:]]//g' teams.txt | tr '[:upper:]' '[:lower:]' | grep -v '^$')
project=$(basename "$DIR")

for team in "${TEAMS[@]}"; do
  echo "--- ${team}"
  docker compose rm -sf "n8n-${team}" >/dev/null
  docker volume rm -f "${project}_n8n_${team}" >/dev/null
done
docker compose up -d
echo "All ${#TEAMS[@]} instances are back to the owner setup screen."
