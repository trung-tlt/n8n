# n8n Workflows, Guides & Community Resources 🚀

A curated collection of **production-ready n8n workflows**, **free beginner guides**, and
**community event material** — covering AI agents, DevOps, cloud monitoring, IT support and
business automation.

Maintained by **Trung Tran** — n8n Ambassador (Ho Chi Minh City) & verified creator.

---

## ✨ What's in this repository

| Section | What it is |
|---|---|
| 📦 [**`workflows/`**](./workflows) | Ready-to-import n8n workflow JSON files, organised by domain |
| 📚 [**`guides/`**](./guides) | Free beginner ebooks and guides (PDF, English + Tiếng Việt) |
| 🏆 [**`hackathon/`**](./hackathon) | n8n Builders Challenge HCMC — 10 SME topics, sample datasets, and the AWS self-host setup used to run the event |

---

## 📦 Workflow catalog

Five published workflows, all AI-assisted and built on real use cases.

| Workflow | Category | What it does | Key integrations |
|---|---|---|---|
| [**SmartSupport Flow**](./workflows/it-support) — Auto-handle IT requests from email to JIRA | `it-support` | A Gmail trigger picks up inbound IT requests; an AI chain classifies and extracts structured fields, filters out noise, opens a JIRA ticket, notifies Slack and sends the requester a reply. | Gmail · OpenAI · JIRA · Slack · SendGrid |
| [**Cloudflare Incident Monitoring & Alerting**](./workflows/cloud) | `cloud` | Polls Cloudflare status on a schedule, uses an AI agent to judge severity and impact, then routes alerts to the right channel and logs every incident. | Cloudflare API · OpenAI · Slack · Telegram · JIRA · Google Sheets |
| [**AI-Powered YouTube Video Manager Agent**](./workflows/content) — with audit logging | `content` | A chat-driven AI agent that manages YouTube videos through natural language, with conversation memory and a full Google Sheets audit trail of every action. | YouTube · OpenAI · Google Sheets · Slack |
| [**Decodo SaaS Pricing Intelligence**](./workflows/data) — B2B Pricing Radar | `data` | Scrapes competitor SaaS pricing pages, has an AI agent extract structured plan/price data, archives the results to Drive and reports changes to Slack. | Decodo · OpenAI · Google Drive · Slack |
| [**Decodo Scraper API Workflow Template**](./workflows/data) — Amazon book purchase report | `data` | A reusable scraping template: Decodo Scraper API → AI structured extraction → Drive archive → Slack report. | Decodo · OpenAI · Google Drive · Slack |

Every workflow uses **credentials** rather than inline keys, and ships with sticky notes on
the canvas explaining each section.

---

## 📚 Free guides & ebooks

New to n8n? Start here — no signup, no email wall.

**[n8n 101 — Workflow Automation for Complete Beginners](./guides/n8n-101)** · PDF, 20 pages

What n8n is, the 7 core concepts, key features, the 400+ integration ecosystem, AI agents &
RAG, real-world case studies, and a hands-on first workflow you can build in 10 minutes.

📥 [English](./guides/n8n-101/n8n-101-beginners-guide-en.pdf) ·
📥 [Tiếng Việt](./guides/n8n-101/n8n-101-beginners-guide-vi.pdf)

---

## 🏆 n8n Builders Challenge — Ho Chi Minh City

Material from the community hackathon held **19 September 2026** at MindX Technology School,
HCMC — reusable if you want to run something similar.

- **[10 SME automation topics](./hackathon)** — lead intake, chat-to-order, payment reminders,
  after-sales care, low-stock alerts, bookings, invoice approval, store content, warranty
  dispatch and end-of-day reporting. Each has three stacked difficulty levels.
- **[Sample datasets](./hackathon/n8n-builders-challenge-datasets)** — fictional CSV/JSON data
  per topic, with per-topic READMEs describing the edge cases worth demoing.
- **[Self-host setup](./hackathon/n8n-hackathon-selfhost)** — Terraform for 10 isolated n8n
  instances on a single EC2 host behind Caddy, each on its own HTTPS subdomain. Deploys in
  about five minutes.

---

## 📁 Repository structure

```text
n8n/
├── workflows/                      # Importable workflow JSON
│   ├── cloud/                      #   Cloudflare incident monitoring
│   ├── content/                    #   YouTube manager agent
│   ├── data/                       #   Decodo scraping & pricing intelligence
│   └── it-support/                 #   SmartSupport email → JIRA
├── guides/                         # Free ebooks & beginner guides
│   └── n8n-101/                    #   n8n 101 (PDF, EN + VI)
├── hackathon/                      # n8n Builders Challenge HCMC
│   ├── n8n-builders-challenge-datasets/   # Sample data for the 10 topics
│   ├── n8n-hackathon-selfhost/            # Terraform + Docker Compose for 10 instances
│   └── slides/                            # Topic brief and event deck
└── README.md
```

---

## 🔄 How to use a workflow

1. **Download** the `.json` file you want from [`workflows/`](./workflows).
2. In n8n, open **Workflows → Import from File** (or paste the JSON onto the canvas).
3. **Configure credentials** for each node that needs one — the workflows reference
   credentials by name and ship no keys.
4. **Test step by step** with *Execute step* before switching anything on.
5. **Activate** the workflow.

**Requirements:** an n8n instance (Cloud or self-hosted, v1.x or later). Most workflows use
the LangChain AI nodes and an OpenAI credential; a few need extra community nodes, such as
`@decodo/n8n-nodes-decodo` for the Decodo templates.

---

## 🙋 About

Built and maintained by **Trung Tran**, n8n Ambassador for Ho Chi Minh City, as a single
source of truth for the workflows, guides and event material shared with the community.

Contributions and questions are welcome — open an issue or a pull request.

---

## ⚠️ Disclaimer

These workflows and guides are shared for learning purposes and are **not official n8n GmbH
publications**. All sample data in the hackathon datasets is fictional. Review any workflow
and point it at test accounts before running it against real systems or customer data.
"n8n" and all other product names belong to their respective owners.

---

### Built with ❤️ using n8n
