# Screenshots Needed

This file tracks all screenshots required for the new outcome-based exercises added
in this iteration (Exercises 2.3, 4.7, 5.4). Existing screenshots already in
`docs/images/` are **not** duplicated here.

Screenshots must use **synthetic or fictional data only**. Redact all real
identities, tenant names, PAC tokens, and API keys before saving. Use lowercase
kebab-case filenames ending in `.png`.

---

## Summary table

| # | Exercise / Step | Proposed filename | Screen and what must be visible | Highlight / crop guidance | Priority | Status |
|---|---|---|---|---|---|---|
| 1 | 2.3 Step 1 | `insights-service-filter.png` | Insights Public Services view with a service filter applied | Show the filter control, filter value, and filtered results; redact identity columns | Required | Provided |
| 2 | 2.3 Step 2 | `user-activity-governance-detail.png` | User Activity event detail panel: service, identity, classified intent, violations, and decision columns all visible | Crop to the detail panel; redact identity and any real data | Required | Provided |
| 3 | 2.3 Step 3 | `public-service-intercept-support.png` | Public Services catalog table: 4–6 service rows with Risk Level and all five Intercept Support columns (Request, Response, License, File Upload, MCP) | Crop to show column headers clearly; at least one row with partial support and one access-only row | Required | Provided |
| 4 | 4.7 Step 2 | `group-policy-create.png` | Create Group form with `Lab-Engineering-Test` name entered | Highlight the name field; no real tenant data | Required | Provided |
| 5 | 4.7 Step 3 | `group-policy-assignment.png` | End User record or Group membership screen showing the test identity assigned to `Lab-Engineering-Test` | Redact identity fields (use synthetic label); show group membership confirmation | Required | Provided |
| 6 | 4.7 Step 4 | `end-user-effective-policy.png` | End User record Policies tab: Default Policy + `Lab - Engineering Allow` group policy visible; allowed service listed | Redact identity; highlight the two policy rows and the allowed service entry | Required | Provided |
| 7 | 4.7 Step 5 | `group-policy-activity.png` | User Activity event detail for `WAIS-LAB-GP-47` test prompt: service, allowed decision (`INTERCEPT`), lab identity | Redact identity; show service name and decision value | Required | Missing |
| 8 | 4.7 Step 6 | `policy-change-audit-log.png` | Audit Logs view filtered to the timeframe of group/policy creation: at least one administrative event for group or policy change | Highlight the event type and actor column; distinguish from User Activity rows | Required | Missing |
| 9 | 5.4 Step 1 | `custom-intent-list-add-classifier-button.png` | Classifiers screen with the **Add Classifier** button visible | Highlight the Add Classifier button | Required | Provided |
| 10 | 5.4 Step 1 | `add-custom-intent.png` | The Add Classifier type dialog showing Custom Intent selected | Show the full dialog | Required | Provided |
| 11 | 5.4 Step 2 | `add-lab-project-lighthouse-intent.png` | Custom Intent creation form with `Lab - Project Lighthouse` name and description entered | Show name and description fields before prompts are loaded | Required | Provided |
| 12 | 5.4 Step 2 | `drop-custom-intents-txt-file.png` | Classifier form after drag-and-drop of `custom-intents.txt`, before clicking Start Upload | Show prompts listed in the upload area; highlight Start Upload button | Required | Provided |
| 13 | 5.4 Step 2 | `custom-intents-loaded.png` | Classifier form with all five prompts successfully loaded | Show all five prompts visible | Required | Provided |
| 14 | 5.4 Step 3 | `classifier-policy-action.png` | Default Policy Classifiers tab → Intent Topic Controls section showing `Lab - Project Lighthouse` with Monitor action being selected | Highlight the classifier row and action dropdown | Required | Missing |
| 15 | 5.4 Step 5 | `custom-intent-event-detail.png` | User Activity detail panel for a `WAIS-LAB-CI-54` event: Violations section shows `Lab - Project Lighthouse` finding; decision shows `INTERCEPT` | Redact identity; highlight the classifier name in violations and the decision value | Required | Provided |

---

## Retired / superseded

| Filename | Reason |
|---|---|
| `custom-intent-list.png` | Replaced by `custom-intent-list-add-classifier-button.png` — the Add Classifier button is the actionable element; a plain list screenshot adds no value |
| `custom-intent-examples.png` | Superseded by `drop-custom-intents-txt-file.png` and `custom-intents-loaded.png` — prompts are loaded via file upload, not entered manually |
| `custom-entity-example.png` | Step 6 is now explanatory text only; no screenshot needed |

---

## Notes on capture

- **Synthetic data only.** All screenshots in this lab use the preloaded synthetic
  tenant data or fictional test prompts. Do not capture real user identities, real
  prompt content, real tenant names, or real credentials.
- **Redact before saving.** Use image editing to blur or black-box identity fields,
  email addresses, and tenant-specific URLs before committing screenshots.
- **Crop tightly.** Screenshots should show the specific UI element described.
  Full-browser screenshots add noise and slow page load; aim for 700–900 px wide.
- **Naming.** Save each file to `docs/images/<filename>` exactly as listed above.
  Filenames are already referenced in the exercise Markdown — the placeholder text
  will be replaced automatically when the image is present.
- **After capture.** For each screenshot delivered: update the Status column from
  `Missing` to `Provided`, then to `Reviewed` after the SE confirms accuracy.

---

## Already-existing screenshots (do not re-capture)

The following images are already present in `docs/images/` and are used in
Exercises 2.1, 3.x, 4.1–4.6, and the demo playbook:

- `insights-filter.png` — basic filter applied (Exercise 2.1)
- `insights-public-data.png` — Public Services view, unfiltered
- `insights-top-users.png` — Top Users view
- `insights-transactions.png` — Transactions view
- `user-activity-screen.png` — User Activity list
- `user-event-details.png` — User Activity event detail (generic)
- `default-policy.png` — Default Policy view
- `add-grok.png`, `grok-allowed.png`, `click-save.png`, `saved.png` — Exercises 4.5–4.6
- `wais-menu.png`, `status-window-tenant-available.png` — Module 1
