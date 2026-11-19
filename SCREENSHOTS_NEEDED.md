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
| 1 | 2.3 Step 1 | `insights-service-filter.png` | Insights Public Services view with a service filter applied | Show the filter control, filter value, and filtered results; redact identity columns | Required | Missing |
| 2 | 2.3 Step 2 | `user-activity-governance-detail.png` | User Activity event detail panel: service, identity, classified intent, violations, and decision columns all visible | Crop to the detail panel; redact identity and any real data | Required | Missing |
| 3 | 2.3 Step 3 | `public-service-intercept-support.png` | Public Services catalog table: 4–6 service rows with Risk Level and all five Intercept Support columns (Request, Response, License, File Upload, MCP) | Crop to show column headers clearly; at least one row with partial support and one access-only row | Required | Missing |
| 4 | 4.7 Step 2 | `group-policy-create.png` | Create Group or New Group Policy form with `Lab-Engineering-Test` name entered | Highlight the name field; no real tenant data | Required | Missing |
| 5 | 4.7 Step 3 | `group-policy-assignment.png` | End User record or Group membership screen showing the test identity assigned to `Lab-Engineering-Test` | Redact identity fields (use synthetic label); show group membership confirmation | Required | Missing |
| 6 | 4.7 Step 4 | `end-user-effective-policy.png` | End User record Policies section or tab: Default Policy + `Lab - Engineering Allow` group policy visible; allowed service listed | Redact identity; highlight the two policy rows and the allowed service entry | Required | Missing |
| 7 | 4.7 Step 5 | `group-policy-activity.png` | User Activity event detail for `WAIS-LAB-GP-47` test prompt: service, allowed decision (`INTERCEPT`), lab identity | Redact identity; show service name and decision value | Required | Missing |
| 8 | 4.7 Step 6 | `policy-change-audit-log.png` | Audit Logs view filtered to the timeframe of group/policy creation: at least one administrative event for group or policy change | Highlight the event type and actor column; distinguish from User Activity rows | Required | Missing |
| 9 | 5.4 Step 1 | `custom-intent-list.png` | Classifiers list view showing existing custom intents and/or custom entities | Note count at bottom for validation; redact any customer-specific classifier names | Required | Missing |
| 10 | 5.4 Step 2 | `custom-intent-create.png` | Create Custom Intent dialog/form with name `Lab - Project Lighthouse` and description field visible | Show before example prompts are entered; no real data | Required | Missing |
| 11 | 5.4 Step 2 | `custom-intent-examples.png` | Example prompts field with all five fictional Project Lighthouse prompts entered | Show full prompts list; no real customer data | Required | Missing |
| 12 | 5.4 Step 3 | `classifier-policy-action.png` | Default Policy Classifiers tab → Intent Topic Controls section showing `Lab - Project Lighthouse` with Monitor action being selected | Highlight the classifier row and action dropdown | Required | Missing |
| 13 | 5.4 Step 5 | `custom-intent-event-detail.png` | User Activity detail panel for a `WAIS-LAB-CI-54` event: Violations section shows `Lab - Project Lighthouse` finding; decision shows `INTERCEPT` | Redact identity; highlight the classifier name in violations and the decision value | Required | Missing |
| 14 | 5.4 Step 6 | `custom-entity-example.png` | Custom Entity creation form showing the pattern field with example fictional regex (e.g. `LH-\d{4}`) | Show pattern field and name field; no real customer data or anchored-pattern pitfalls | Optional | Missing |

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

Do not request duplicates of these images. The new screenshots above are for the
new exercises only and cover different UI states or higher-specificity crops.
