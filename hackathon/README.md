# n8n Builders Challenge — Ho Chi Minh City

**Saturday, 19 September 2026 · MindX Technology School, Ho Chi Minh City**
Hosted by Trung Tran, n8n Ambassador HCMC.

10 real SME problems · 3 levels per topic · 60-minute Hack & Build.

## How it works

Each team picks one of the 10 topics below — everyday problems small and medium
businesses in Vietnam deal with. Every topic has three stacked levels (Easy →
Medium → Hard extend each other), so a team can pick the challenge that fits
its skills and still upgrade as time allows.

- **Easy (~20 min):** the core flow — input → store → notify. No AI required.
- **Medium (~40 min):** adds intelligence — AI understanding, classification, or calculations.
- **Hard (stretch):** adds real-world robustness — routing, approvals, de-duplication, reminders.

A level sets the size of the challenge, not the score — a polished Easy solution
can still score high.

**Build rules:** one n8n workflow per team, started from a Form Trigger or
Webhook, using the sample data provided (fictional — see disclaimer below).
AI is optional; keep money/matching/threshold logic in rules (Code, If,
Switch). No custom UI or real third-party accounts needed — the n8n canvas
and an output channel your team controls (email/chat) are the demo.

**Judging:** real-world value (30%), workflow works end-to-end (35%),
edge-case handling (20%), demo & pitch (15%).

## The 10 topics

| # | Topic | Typical business | Where AI helps |
|---|---|---|---|
| 01 | AI Lead Intake Assistant | Furniture, agencies, training centres | Classify need & priority, draft replies |
| 02 | Chat Message to Order | Online shops, retail stores | Turn Vietnamese chat into structured orders |
| 03 | Payment Reminder Autopilot | Distributors, B2B services | Tone-matched reminder messages |
| 04 | After-sales Care Desk | E-commerce, service businesses | Classify issue & urgency, policy-based replies |
| 05 | Low-stock Early Warning | Shops, cafés, distributors | Optional: explain reorder suggestions |
| 06 | Booking & Reminder Assistant | Salons, spas, training centres | Optional: understand free-text requests |
| 07 | Invoice Capture & Expense Approval | Any SME finance team | Read invoice images and PDFs |
| 08 | Store Content Assistant | Retail, F&B, local brands | Write channel-specific posts |
| 09 | Warranty Intake & Dispatch | Electronics, computer & device shops | Classify fault type |
| 10 | Owner's End-of-Day Report | Any SME owner | Explain changes in plain language |

Sample datasets for each topic live in
[`n8n-builders-challenge-datasets/`](n8n-builders-challenge-datasets/README.md),
one subfolder per topic (`01-lead-intake` … `10-daily-report`), each with its
own `README.md` describing the files and edge cases to demo.

## Folder contents

| Path | What it is |
|---|---|
| `n8n-builders-challenge-datasets/` | Sample CSV/JSON data per topic, plus guidance on importing into Google Sheets, n8n Data Tables, or Webhook test calls |
| `n8n-builders-challenge-datasets/# Guest List.md` | RSVP tracker for the event |
| `slides/n8n_Builders_Challenge_Topics_EN.docx` | Full topic brief — problem statement, level breakdown, suggested nodes, and demo script for every topic |
| `slides/n8n_Builders_Challenge_HCMC_Official.pptx` | Event slide deck |

## Disclaimer

All sample data is fictional (see the dataset README for details). Point any
demo output at a test email or chat channel your team controls — never real
customer data or production accounts.
