#!/usr/bin/env bash
# Copy the local scripts/*.sh to /opt/n8n/scripts on the running host (via SSM),
# so a script fix can be applied without rebuilding the instance.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(gen-compose.sh reset-team.sh reset-all.sh)

# COPYFILE_DISABLE stops macOS tar from adding ._* metadata files
payload=$(cd "$HERE" && COPYFILE_DISABLE=1 tar -czf - "${FILES[@]}" | base64 | tr -d '\n')

"$HERE/ssm.sh" "echo '${payload}' | base64 -d | tar -xzf - -C scripts && chmod +x scripts/*.sh && ls -l scripts/"
