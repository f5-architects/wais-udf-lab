# Confirmation Needed

Items that require a hands-on SE test against the current WAIS tenant before the
relevant exercise step can be considered verified. Each item identifies the exact
file and step, what needs to be tested, and what a confirmed answer should supply.

This is an internal authoring document — it is not part of the published lab guide.

---

## How to use this file

For each row: test it in the lab, fill in the **Confirmed behavior** column, and
update the exercise text to match. Remove the row once the exercise text is accurate
and reviewed.

---

## Open items

| # | File | Step | What needs confirmation | Confirmed behavior | Priority | Status |
|---|---|---|---|---|---|---|
| 1 | [docs/module4/group-policy.md](docs/module4/group-policy.md) | Step 3 — Assign identity | Whether assigning a synthetic identity to a group is possible in the writable tenant's end-user roster, and the exact UI path to do it | | Required | Open |
| 2 | [docs/module4/group-policy.md](docs/module4/group-policy.md) | Step 4 — Effective policy | Exact name and location of the Policies section in the End User record (tab label, section heading, or separate view) | | Required | Open |
| 3 | [docs/module4/group-policy.md](docs/module4/group-policy.md) | Step 6 — Audit Logs | Exact event type name and field labels in Audit Logs for group creation and group policy creation | | Required | Open |
| 4 | [docs/module4/group-policy.md](docs/module4/group-policy.md) | Step 5 — Copilot redirect | After ChatGPT is blocked by the group policy, the browser is redirected to Copilot (set by the Default Policy Service Block Action). Copilot currently also fails to load after the redirect. Root cause and fix needed — either update the redirect target to a working service or confirm when Copilot will be usable in the lab. | | Required | Open |
| 5 | [docs/module5/review-categories.md](docs/module5/review-categories.md) | Step 1 | Exact location and label of category / classification signals in the event detail panel; whether a dedicated categories view exists in the writable tenant | | Required | Open |
| 6 | [docs/module5/configure-categorization.md](docs/module5/configure-categorization.md) | Step 1–2 | Whether category rules can be created or edited in the writable tenant, and what the exact click path is | | Required | Open |
| 7 | [docs/module5/verify-categorization.md](docs/module5/verify-categorization.md) | Step 3 | Whether a crafted prompt reliably lands in a chosen built-in category and shows the configured action | | Required | Open |
| 8 | [docs/module2/governance-decisions.md](docs/module2/governance-decisions.md) | Step 3 | Confirm the exact column labels in the Public Services catalog Intercept Support grid match: Request, Response, License, File Upload, MCP | | Required | Open |
| 9 | [docs/appendix/mcp-future.md](docs/appendix/mcp-future.md) | Full exercise | All items in the Matthieu handoff checklist — see that file for the full list | | Owner: Matthieu | Open |

---

## Resolved items

*(Move rows here once confirmed and exercise text updated.)*

| # | File | Step | Confirmed behavior | Resolved by | Date |
|---|---|---|---|---|---|
| — | docs/module5/custom-classifiers.md | Step 1 — Nav path | Navigation is **Workforce Security → Classifiers** | Peter | 2026-11-21 |
| — | docs/module5/custom-classifiers.md | Step 2 — Add Classifier | Button is **Add Classifier**; dialog offers Custom Intent type | Peter | 2026-11-21 |
| — | docs/module5/custom-classifiers.md | Step 2 — Load intents | Prompts must be loaded via drag-and-drop of a `.txt` file; copy/paste of multiple prompts is not supported | Peter | 2026-11-21 |
| — | docs/module5/custom-classifiers.md | Step 1 — Default classifier count | Default writable tenant has no pre-existing custom classifiers | Peter | 2026-11-21 |
