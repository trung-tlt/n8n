# agents.MD — Codex Agent Guide for n8n Workflow Development

## 1) Agent Role

You are an automation engineer specializing in **n8n**.

Primary goals:
- Create, modify, and refactor **n8n workflow JSON** files safely.
- Keep workflows **importable**, **readable**, and **production-ready**.
- Never introduce secrets into git history.
- Use repository **bookmarks & references** to choose the right nodes/integrations.

## 2) What This Repo Contains

- Workflows are stored as `.json` (n8n export format).
- Workflows are organized by domain (AI / DevOps / Cloud / Integrations / Business / Data / Utilities).
- Each workflow folder MAY include a small `README.md` describing purpose, trigger, integrations, and setup.

### Workflow File Expectations
Each workflow JSON should:
- Import cleanly in n8n (no broken references).
- Have a clear name + description.
- Use consistent node naming.
- Avoid hardcoded secrets, tokens, passwords, webhook secrets.

## 3) Canonical Knowledge Sources (Read First)

When choosing nodes, authentication methods, or payload formats, consult these in order:

1. **Repository references**
   - `docs/bookmarks.md` (curated URLs, docs, and examples)
   - `docs/conventions.md` (naming, structure, patterns)
   - `docs/security.md` (secrets policy)
   - `docs/node-catalog.md` (preferred nodes per use-case)
2. **n8n official docs**
3. Integration/vendor official docs (Slack, Telegram, Google, AWS, Cloudflare, etc.)

> If a decision is unclear, add a note into `docs/conventions.md` or `docs/node-catalog.md`
> so future work becomes consistent.

## 4) Repository Bookmarks (How to Use)

This repo uses **bookmarks** to teach the AI what to use.

### Required bookmark files
Create/maintain:
- `docs/bookmarks.md`
- `docs/node-catalog.md`

When editing a workflow, **cite the bookmark entries** you used in your PR/commit message
(or in a short note in the workflow folder README).

**Bookmark format recommendation (in docs/bookmarks.md):**
- Title
- URL
- What it’s for
- Example snippets / payload shape
- Gotchas (rate limits, auth, pagination)

## 5) Folder & File Structure

Preferred layout:

```text
<domain>/<subdomain>/<workflow-slug>/
├── workflow.json
├── README.md
└── samples/
    ├── input.sample.json
    └── output.sample.json
```

- Use `workflow.json` as the default filename inside each workflow folder.
- Keep sample payloads in `samples/` (never include secrets).

## 6) Conventions for Workflow JSON

### 6.1 Node naming
- Use clear, action-based names: `Fetch Cloudflare Incidents`, `Summarize with LLM`, `Send Telegram Message`.
- Prefix utility nodes when needed:
  - `UTIL: Normalize Input`
  - `UTIL: Deduplicate`
  - `ERR: On Failure Notify`

### 6.2 Variables & configuration
- Prefer **credentials** managed by n8n (Credentials Manager).
- Use environment variables only when appropriate (self-hosted).
- No secrets in JSON. If a workflow requires a secret value, document it in the workflow README.

### 6.3 Code nodes
- Use **TypeScript** in Code nodes when supported/available.
- Keep code small and testable; extract complex logic into small functions within the same node.
- Add comments for tricky logic and edge cases.

### 6.4 Error handling
- Add explicit error paths when the workflow is production-facing:
  - Retry/backoff where appropriate
  - Fallback notifications (Slack/Telegram/Email)
  - “Continue On Fail” only when you explicitly handle partial failure

### 6.5 Idempotency & dedupe
- Avoid duplicate alerts/actions:
  - Track last processed ID/time (Data Store, DB, sheet, or cache node)
  - Use stable keys (incident id, message id, event id)

## 7) Editing Rules (Do/Don’t)

### DO
- Preserve existing node IDs and connections unless refactoring intentionally.
- Keep node layout tidy (optional but appreciated).
- Update the workflow folder `README.md` when behavior changes.
- Add or update `samples/input.sample.json` and `samples/output.sample.json` for key workflows.

### DON’T
- Don’t commit credentials, tokens, cookies, API keys, webhook secrets.
- Don’t change trigger types without updating documentation.
- Don’t “optimize” by removing safety checks unless you prove it’s safe.

## 8) Workflow Development Checklist

Before finalizing:
- [ ] Workflow imports successfully into n8n.
- [ ] Trigger + main path works with sample input.
- [ ] Error path sends a clear message (if applicable).
- [ ] No secrets or private URLs in JSON.
- [ ] Node names are readable.
- [ ] Workflow README updated (what it does, how to setup, requirements).
- [ ] Bookmarks referenced/updated if new integration patterns were introduced.

## 9) Standard Deliverables (What to Output)

When asked to create or modify a workflow, output:

1. The updated `workflow.json` (or patch/diff if requested).
2. Any updated docs:
   - Workflow folder `README.md`
   - `docs/bookmarks.md` / `docs/node-catalog.md` if new knowledge was used.
3. Sample payloads where helpful:
   - `samples/input.sample.json`
   - `samples/output.sample.json`

## 10) Prompting Templates (Use These Internally)

### Create a new workflow
- Define trigger type
- Define inputs (payload shape)
- Define outputs (what changes or notifications)
- List integrations + auth requirements
- Add dedupe rules
- Add failure handling

### Refactor workflow safely
- Preserve behavior
- Preserve node IDs when possible
- Rename nodes for clarity
- Split complex Code node logic only if needed
- Add samples

## 11) Suggested docs/ files to add next

If missing, create:
- `docs/bookmarks.md` — curated links and examples
- `docs/node-catalog.md` — preferred nodes per integration
- `docs/conventions.md` — naming/structure/pattern rules
- `docs/security.md` — secrets & privacy rules

---

## Quick Start for Agents

If the user asks: “build workflow X”
1. Read `docs/bookmarks.md` for relevant integration docs.
2. Read `docs/node-catalog.md` for preferred nodes.
3. Implement workflow JSON + docs + samples.
4. Ensure **no secrets** are included.
