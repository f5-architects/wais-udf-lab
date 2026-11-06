# Asset inventory and image TODO list

Original screenshots live in `images/` and are also present under `docs/images/`
(where the Docsify pages reference them). **Do not rename provided images.** Every
image has a caption and alt text where it is used.

> Screenshots show **synthetic demonstration data**; displayed values may vary.

## Present images

| File | Used in (Docsify page) | Caption / alt text | Status |
|------|------------------------|--------------------|--------|
| `wais-menu.png` | `docs/module1/README.md` | Orchestrator Access menu showing the WAIS entry | ✅ present |
| `status-window-tenant-available.png` | `docs/module1/README.md` | Ready provisioning page with login, admin-console button, connector downloads | ✅ present |
| `username-and-password.png` | `docs/module1/README.md` | Sign-in with username and password fields | ✅ present — ⚠️ review for credential redaction |
| `username-entry.png` | `docs/module1/README.md` | Sign-in username field with generated username entered | ✅ present — ⚠️ review for credential redaction |
| `choose-password-method.png` | `docs/module1/README.md` | Sign-in method selection: Email and Password | ✅ present |
| `user-activity-screen.png` | `docs/module2/activity-insights.md` | User Activity list of events | ✅ present |
| `user-event-details.png` | `docs/module2/activity-insights.md` | Expanded event details panel (opened via `>` chevron) | ✅ present |
| `insights-public-data.png` | `docs/module2/activity-insights.md` | Insights → Public Services view (filename preserved) | ✅ present |
| `insights-transactions.png` | `docs/module2/activity-insights.md` | Insights → Transactions view | ✅ present |
| `insights-top-users.png` | `docs/module2/activity-insights.md` | Insights → Top Users view | ✅ present |
| `insights-filter.png` | `docs/module2/activity-insights.md` | Insights view with a filter applied | ✅ present |
| `waiting-for-tenant.png` | `docs/module1/README.md` (1.2) | Provisioning page while the tenant is being created (building state) | ✅ present |
| `validate-certificate.png` | `docs/module2/test-proxy.md` (2.2) | Viewing the intercepted-connection certificate in Chrome | ✅ present |
| `simple-chatgpt-test.png` | `docs/module3/README.md` (3.1) | Simple harmless ChatGPT test request | ✅ present |
| `chatgpt-success.png` | `docs/module3/README.md` (3.1) | ChatGPT returns a successful response | ✅ present |
| `user-activity-logged.png` | `docs/module3/README.md` (3.2) | New live ChatGPT event in User Activity | ✅ present |
| `activity-redacted.png` | `docs/module3/README.md` (3.3) | Redaction event: Marketing / Redact / PII, Confidential, Risk, License | ✅ present — ⚠️ confirm field values on screen |
| `default-policy.png` | `docs/module4/default-policy.md` (4.4) | Default Policy page | ✅ present |
| `action-choices.png` | `docs/module4/default-policy.md` (4.4) | Default Service Action choices (Monitor / Protect / Block) | ✅ present |
| `x-ai-trial.png` | `docs/module4/block-redirect.md` (4.5) | Grok "Try for free" at x.ai | ✅ present |
| `try-something-better.png` | `docs/module4/block-redirect.md` (4.5) | Blocked-service experience | ✅ present |
| `copilot-redirection.png` | `docs/module4/block-redirect.md` (4.5) | Policy-directed redirect to Copilot | ✅ present |
| `add-grok.png` | `docs/module4/allow-grok.md` (4.6) | Adding Grok to Allowed Services | ✅ present |
| `click-save.png` | `docs/module4/allow-grok.md` (4.6) | Saving the policy change | ✅ present |
| `saved.png` | `docs/module4/allow-grok.md` (4.6) | Policy change saved confirmation | ✅ present |
| `grok-allowed.png` | `docs/module4/allow-grok.md` (4.6) | Grok reachable after being allowed | ✅ present |

## Pending images (TODO)

| File | Intended use | Status |
|------|--------------|--------|
| `service-block.png` | Blocked services under Service Access Control, `docs/module4/default-policy.md` (4.4) | ⏳ **PENDING — not supplied this pass.** Do not fabricate. A commented image block is in place; uncomment it once the file is added to `images/` and `docs/images/`. |
| `status-window-tenant-building.png` | Superseded by `waiting-for-tenant.png` for the building state. No longer referenced. | ➖ not needed |
| *(optional)* redacted ChatGPT browser response | `docs/module3/README.md` (3.3) | ⏳ optional — add if it materially improves the redaction exercise. |

## Non-image source files

| File | Used in | Status |
|------|---------|--------|
| `docs/examples/simple-redaction.txt` | `docs/module3/README.md` (3.3) — copyable block + download link | ⚠️ **Synthetic replacement.** The named source file (`simple-redaction-example.txt` / `simple-redaction.txt`) was **not present** in the workspace, so a clearly-synthetic sample was authored. Swap in the real approved text when available. |

## Redaction checklist (pre-publication)

- `username-entry.png` and `username-and-password.png` may show example sign-in
  values — **redact any real username/password before publication.** The guide
  already instructs SEs not to reuse screenshot values.
- `user-activity-logged.png` and `activity-redacted.png` show live User Activity —
  confirm no real identities, emails, or tenant details are visible; redact if so.
- Any screenshot showing a tenant password, connector ID, or PAC URL must be
  redacted before publication (see `docs/appendix/cleanup.md`).

## Vendored web assets (not screenshots)

Pinned Docsify assets under `docs/vendor/` (Docsify 4.13.1, docsify-copy-code 3.0.0,
PrismJS 1.29.0 language components) make the site load without a CDN. The Google
Fonts `@import` was removed from `vendor/vue.css`.
