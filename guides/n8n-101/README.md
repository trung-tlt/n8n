# n8n 101 — Workflow Automation Guide for Complete Beginners (Free PDF, EN + VI)

**A free, 20-page beginner's guide to n8n** — the open, fair-code workflow automation
platform. Learn **what n8n is**, its **core concepts**, **key features**, the **400+ integration
ecosystem**, **AI agents & RAG**, and **real-world use cases** — all in one concise guide.

Available in **English** and **Vietnamese (Tiếng Việt)**.

> Version 1.0 · September 2026 · Based on public information from [n8n.io](https://n8n.io)
> A community guide by **Trung Tran** — n8n Ambassador & verified creator.
> This is *not* an official publication of n8n GmbH.

---

## 📥 Download

| Language | File | Size |
|---|---|---|
| 🇬🇧 English | [**n8n-101-beginners-guide-en.pdf**](./n8n-101-beginners-guide-en.pdf) | ~1.0 MB |
| 🇻🇳 Tiếng Việt | [**n8n-101-beginners-guide-vi.pdf**](./n8n-101-beginners-guide-vi.pdf) | ~1.2 MB |

No signup, no email wall — click and read.

---

## 👥 Who is this guide for?

- **Complete beginners** who have never built an automation before
- **Non-technical / no-code** users in marketing, sales, support, ops and HR
- **Developers and IT teams** evaluating n8n against Zapier, Make (Integromat) or Power Automate
- Anyone deciding between **n8n Cloud and self-hosted n8n**

No coding experience required.

---

## 📖 What's inside — full table of contents

### Chapter 1 · What is n8n?
An introduction to the platform, the key numbers, and why you should automate.
n8n (pronounced *"n-eight-n"*, short for **nodemation**) is an open workflow automation
platform: **400+ built-in integrations**, **200K+ teams worldwide**, **fair-code** and
**self-hostable**.

### Chapter 2 · Core concepts — 7 concepts to remember
**Workflow** · **Node** · **Trigger** · **Execution** · **Credential** · **Action** ·
**Logic & Control** (IF, Filter, Switch, Merge). Plus how data flows through a workflow as
**items** (JSON records).

### How to read a workflow
A visual, node-by-node walkthrough: automatically handling customer support emails —
Gmail trigger → AI classification → IF (urgent?) → Slack or Google Sheets.

### Chapter 3 · Key features
Visual **drag-and-drop editor**, **code when you need it** (JavaScript & Python),
thousands of ready-made **templates**, **self-host or Cloud**, **error handling & retries**,
and **human-in-the-loop** approval steps.

### AI in n8n
**AI Agent** (tool-calling), **RAG** with vector stores for answers grounded in your own
documents, **Chat Trigger** for embeddable chat UIs, and flexible model choice
(OpenAI, Anthropic, Google Gemini, Ollama and self-hosted models). Built on LangChain.

### Chapter 4 · Integration ecosystem
400+ built-in integrations across communication (Slack, Gmail, Telegram, Discord,
Microsoft Teams, WhatsApp), data & documents (Google Sheets, Notion, Airtable,
PostgreSQL, MySQL, Google Drive), AI (OpenAI, Anthropic, Gemini, Ollama, Pinecone,
Hugging Face), sales & marketing (HubSpot, Salesforce, Shopify, Stripe, Mailchimp) and
development (GitHub, GitLab, Jira, AWS, Docker) — plus **HTTP Request** and **Webhook**
for any other API.

### Chapter 5 · Real-world use cases
Automation ideas by department (Marketing, Sales & Support, Operations & HR, IT & Data),
plus three company case studies:

| Company | Result |
|---|---|
| **Delivery Hero** | ~200 hours saved every month from a single account-recovery workflow |
| **StepStone** | 25× faster data-source integration — from 2 weeks down to ~2 hours |
| **Vodafone** | ~£2.2M in operating costs saved automating threat-intelligence flows |

### Chapter 6 · Getting started
Build your **first workflow in 5 steps**, choose your deployment (**n8n Cloud vs.
self-hosted**), and follow the **best practices & common mistakes** checklist
(clear names, error workflows, realistic test data, sub-workflows — and what to avoid).

### Chapter 7 · Hands-on practice
- **Understanding data in n8n** — items, fields and JSON
- **Expressions** — using data from earlier steps, e.g. `{{ $json.email }}`
- **Practice #1** — build your first workflow in 10 minutes (Schedule Trigger → Send Email),
  no AI and no API key needed
- **IF & branching** — conditions, True/False branches
- **Debugging** — a 5-step checklist, left to right through the canvas

### Chapter 8 · Keep learning
Official resources ([docs.n8n.io](https://docs.n8n.io),
[n8n.io/workflows](https://n8n.io/workflows),
[community.n8n.io](https://community.n8n.io),
[youtube.com/@n8n-io](https://www.youtube.com/@n8n-io)) and a quick glossary
(canvas, webhook, expression, item, fair-code, sub-workflow).

---

## ⚡ The 30-second version

- **n8n** is a visual workflow automation tool: connect apps by dragging nodes onto a canvas.
- A **trigger** starts a workflow; **action** nodes do the work; each run is an **execution**.
- Data moves between nodes as **items** (JSON), referenced with **expressions** like `{{ $json.name }}`.
- Unlike most no-code tools, you can drop into **JavaScript or Python** at any step — and
  **self-host** so your data never leaves your infrastructure.
- Start small: automate one repetitive, rule-based task that eats your week.

---

## 🧭 Where to go next in this repository

- [`../../workflows/`](../../workflows) — ready-to-import n8n workflow JSON files
- [`../../hackathon/`](../../hackathon) — n8n Builders Challenge datasets and self-host setup
- [`../`](../) — all guides in this repository

---

## ❓ FAQ

**Is n8n free?**
The Community edition is free and source-available under the fair-code license, and you can
self-host it with a single Docker command. n8n Cloud is a paid managed service (with a free
trial) priced per workflow execution.

**Cloud or self-hosted?**
Cloud is fastest to start and needs no server knowledge. Self-hosting gives you full control
over your data and unlimited workflows/executions, but you own installation, updates, backups
and security. The guide has a side-by-side comparison — and workflows move between the two as
JSON, so starting on Cloud is not a lock-in.

**Do I need to know how to code?**
No. The guide is written for complete beginners; code is an option, not a requirement.

**How is n8n different from Zapier or Make?**
Source-available and self-hostable, no per-task pricing when self-hosted, and you can write
real JavaScript/Python inside any step.

**Can I share this guide?**
Yes — it's a free community guide for learning purposes. Please keep the attribution intact.

---

## 🏷️ Topics

`n8n` · `n8n tutorial` · `n8n for beginners` · `n8n 101` · `workflow automation` ·
`no-code automation` · `low-code` · `ai agent` · `rag` · `langchain` · `self-hosted n8n` ·
`n8n cloud` · `zapier alternative` · `make alternative` · `automation guide` ·
`n8n tiếng việt` · `hướng dẫn n8n` · `tự động hoá quy trình` · `ebook` · `pdf`

---

## 📄 Attribution & license

A community guide by **Trung Tran** (n8n Ambassador & verified creator), created for
learning purposes and based on public information from n8n.io.
**Not an official publication of n8n GmbH.** "n8n" and all other product names belong to
their respective owners.

Free to read, download and share for non-commercial, educational purposes — with attribution.
