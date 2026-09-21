# n8n Builders Challenge — 10 team instances on AWS

One EC2 host (Singapore) running 10 isolated n8n containers behind Caddy, each on its own
HTTPS subdomain. Instances start empty: the first person to open a team's URL gets n8n's
"Set up owner account" screen and picks the team's login. You hand out the URL and an OpenAI
key on a strip of paper; nothing else is pre-provisioned.

```
https://lion.hackathon.n8nambassador.com      https://koala.hackathon.n8nambassador.com
https://tiger.hackathon.n8nambassador.com     https://otter.hackathon.n8nambassador.com
https://teddy.hackathon.n8nambassador.com     https://fox.hackathon.n8nambassador.com
https://hippo.hackathon.n8nambassador.com     https://eagle.hackathon.n8nambassador.com
https://panda.hackathon.n8nambassador.com     https://dolphin.hackathon.n8nambassador.com
https://hackathon.n8nambassador.com           landing page listing all team links
```

```
                       Route 53: *.hackathon.n8nambassador.com  →  Elastic IP
                                              │
                 ┌────────────────────────────┴───────────────────────────┐
                 │  EC2 m7i.xlarge (Ubuntu 24.04, Docker Compose)         │
                 │                                                        │
                 │  caddy:2  ── :443 TLS (Let's Encrypt, auto)            │
                 │     ├── lion.hackathon…    → n8n-lion:5678             │
                 │     ├── tiger.hackathon…   → n8n-tiger:5678            │
                 │     └── …                  → n8n-<team>:5678           │
                 │                                                        │
                 │  each n8n: own SQLite DB, own volume, own encryption   │
                 │  key — fully isolated per team                         │
                 └────────────────────────────────────────────────────────┘
```

## Prerequisites (on your Mac)

```bash
brew install terraform awscli jq
aws configure --profile n8n      # the account that owns the n8nambassador.com hosted zone
export AWS_PROFILE=n8n
aws route53 list-hosted-zones --query 'HostedZones[].Name'   # must include n8nambassador.com.
```

## Deploy (≈ 5 minutes end to end)

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars   # acme_email is required; the rest is optional
terraform init
terraform apply
cd ..
make logs       # tail the bootstrap log — ends with "bootstrap finished"
make status     # all 11 containers "running" / "healthy"
```

Then open one team URL: you should get the owner setup screen over a valid certificate.
Don't fill it in unless you want to claim that instance — `make reset TEAM=<name>` undoes it.

## Event day

Give each team their URL and the OpenAI key. Tell them in the briefing:

1. First person opens the team URL and creates the owner account — choose a password the
   whole team shares (extra members can also be invited from Settings → Users, but sharing
   the owner login is simpler for 60 minutes).
2. Add the OpenAI key once under **Credentials → Add credential → OpenAI**; every AI node
   can then pick it.
3. Google Sheets/Gmail need their own OAuth client per team; the redirect URL n8n shows is
   already `https://<team>.hackathon.n8nambassador.com/rest/oauth2-credential/callback`.
   Suggest they do this in the first 5 minutes.

Keep the URLs private until teams sit down: anyone who opens an unclaimed instance first
becomes its owner. If that happens, or a team locks themselves out, reset it.

| Need | Command |
|------|---------|
| Team locked out / wrong person claimed it / clean slate | `make reset TEAM=lion` → back to the owner setup screen |
| Wipe everything before the event (e.g. after your own testing) | `make reset-all` → all 10 back to setup, host and certs kept (~1 min) |
| See one team's logs | `scripts/ssm.sh 'docker compose logs --tail 100 n8n-lion'` |
| Restart everything | `scripts/ssm.sh 'docker compose restart'` |
| Add a team | append to `teams` in `terraform.tfvars`, `terraform apply` (adds DNS), then `scripts/ssm.sh 'echo newteam >> teams.txt && ./scripts/gen-compose.sh && docker compose up -d'` |
| Edited a script locally | `make push-scripts` — no rebuild needed |
| Rebuild the host from scratch | `make rebuild`. A plain `terraform apply` never replaces the host, even if user-data or the AMI changed |
| Interactive shell (no SSH key needed) | `aws ssm start-session --region ap-southeast-1 --target $(terraform -chdir=terraform output -raw instance_id)` |
| Tear down after the event | `make down` — removes EC2, EIP, DNS records, IAM role |

`scripts/ssm.sh '<cmd>'` runs any command in `/opt/n8n` on the host through SSM Run Command,
so port 22 stays closed. If you set `ssh_public_key`, `ssh ubuntu@<public_ip>` works too.

## What lives on the host

```
/opt/n8n/
├── .config              BASE_DOMAIN, ACME_EMAIL, N8N_IMAGE, TZ_NAME   (from Terraform)
├── teams.txt            one team per line — the source of truth
├── .env                 per-team N8N_ENCRYPTION_KEY (generated once, never rotated)
├── docker-compose.yml   generated — do not hand-edit, re-run gen-compose.sh
├── Caddyfile            generated
├── www/index.html       generated landing page
└── scripts/
    ├── gen-compose.sh   teams.txt → compose + Caddyfile + landing page
    ├── reset-team.sh    wipe one team's volume → owner setup screen again
    └── reset-all.sh     same for every team (needs --yes)
```

On your laptop, `scripts/ssm.sh` runs a command there and `scripts/push-scripts.sh` uploads
the scripts above.

## Design notes

- **Why one box, not ten.** 10 idle n8n containers use ~6–8 GB RAM; an m7i.xlarge (4 vCPU/16 GB)
  costs about US$0.25/h in Singapore — roughly US$6 for a full day. Bump `instance_type` to
  `m7i.2xlarge` if you expect heavy AI-agent workloads.
- **Public HTTPS matters for the challenge.** Form Trigger, Webhook, "Send and Wait for Response"
  and Google OAuth callbacks all need a real public URL — `WEBHOOK_URL`/`N8N_EDITOR_BASE_URL`
  are set per team, and `N8N_PROXY_HOPS=1` is what makes login work behind the proxy.
- **Let's Encrypt limits.** 11 hostnames → 11 certs per fresh host, well under the 50/week
  per-domain limit; `make reset`/`reset-all` keep the certs, only `make rebuild` re-issues.
  Caddy falls back to ZeroSSL automatically if the limit is ever hit.
- **Data survives reboots, not `make down`.** Everything is on Docker volumes on the root
  disk. Have teams export winning workflows as JSON (the brief asks for it) before tearing down.
- **Telemetry is off** and the personalization survey is skipped, so after the owner setup
  screen teams land straight on the canvas.
- **n8n version** is pinned (`n8n_image`, default `2.38.7` = the `stable` tag as of Sept 11 2026).
