#!/usr/bin/env bash
# Run a shell command on the hackathon host via SSM Run Command (no SSH needed).
# Reads instance id + region from terraform outputs.
#
# Usage: scripts/ssm.sh 'docker compose -f /opt/n8n/docker-compose.yml ps'
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TF_DIR="${TF_DIR:-$HERE/../terraform}"
cmd="${1:?usage: ssm.sh '<command>'}"

instance_id=$(terraform -chdir="$TF_DIR" output -raw instance_id)
region=$(terraform -chdir="$TF_DIR" output -raw region)

command_id=$(aws ssm send-command \
  --region "$region" \
  --instance-ids "$instance_id" \
  --document-name "AWS-RunShellScript" \
  --parameters "$(jq -cn --arg c "cd /opt/n8n && $cmd" '{commands: [$c]}')" \
  --query 'Command.CommandId' --output text)

# poll until finished (up to ~20 min — reset-team.sh waits for the instance to come back)
for _ in $(seq 1 600); do
  status=$(aws ssm get-command-invocation --region "$region" \
           --command-id "$command_id" --instance-id "$instance_id" \
           --query 'Status' --output text 2>/dev/null || echo Pending)
  case "$status" in
    Pending|InProgress|Delayed) sleep 2 ;;
    *) break ;;
  esac
done

aws ssm get-command-invocation --region "$region" \
  --command-id "$command_id" --instance-id "$instance_id" \
  --query '[StandardOutputContent,StandardErrorContent]' --output text
[[ "$status" == "Success" ]]
