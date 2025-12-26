# Cloudflare Incident Monitoring & Alerting Workflow

This workflow polls the Cloudflare Status API, enriches the payload with component and maintenance data, deduplicates alerts, and notifies multiple channels with AI-generated summaries.

## Highlights
- **Multi-source ingest** – pulls unresolved incidents, component summary, and active maintenance windows.
- **Enrichment & scoring** – converts timestamps to SGT, extracts impacted components, scores severity, and tracks degraded Cloudflare components.
- **Deduplication** – caches incident/status/update triples for 30 minutes to avoid noisy repeats while still logging every incident to Google Sheets.
- **Smart notification fan-out**
  - AI-driven summary for Slack + Telegram via the `CloudFlare Alert Bot`.
  - Dedicated on-call escalation (Slack, Telegram, PagerDuty HTTP Event) for major/critical incidents.
  - Hourly all-clear heartbeat when no incidents exist.
- **Ops digest** – attaches stats (counts, impacted components, maintenances) to every alert for quick situational awareness.

## Setup Checklist
1. **Schedule trigger** – adjust the interval (default every 30 minutes).
2. **HTTP/Decodo nodes** – no auth required; ensure outbound HTTP is allowed.
3. **Google Sheets (Log Incidents)** – point to your incidents sheet and map columns as needed.
4. **Slack nodes** – provide OAuth credentials for both general and `#cloudflare-critical` channels.
5. **Telegram nodes** – set the public broadcast `chatId` and `TELEGRAM_ONCALL_CHAT_ID` env var for escalation.
6. **PagerDuty event** (optional) – supply `PAGERDUTY_ROUTING_KEY` via environment variable.
7. **OpenAI-compatible credentials** – already configured via the `OpenAI Chat Model` node; update if you need a different provider/model.
8. **LLM prompt context** – verify the instructions align with your notification policies before enabling in production.

## Deduplication Notes
- Dedupe key = `incident_id + status + latest_update_status/body`.
- Cached for **30 minutes** using workflow static data.
- Even when deduped, incidents are still appended to Google Sheets for auditing.

## Error & Fallback Paths
- **Top-of-hour all clear** when no incidents.
- **Skip Notification Broadcast** node ensures the workflow exits cleanly when everything was deduped.
- Critical/major escalations are isolated so they can be retried without re-running AI summarization.

## Customization Ideas
- Tune the dedupe TTL inside `UTIL: Filter Already Alerted`.
- Add more channels (email, Teams, incident manager) off the `High Impact Escalation?` branch.
- Extend the ops digest or logging with additional analytics destinations (BigQuery, Data Store, etc.).

Activate the workflow after configuring the credentials above and validating with Cloudflare's sample payloads.
