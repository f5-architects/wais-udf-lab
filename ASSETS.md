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

## Pending images (TODO)

| File | Intended use | Status |
|------|--------------|--------|
| `status-window-tenant-building.png` | Provisioning **in progress** (building state), `docs/module1/README.md` | ⏳ **PENDING — to be supplied.** Do not fabricate. A commented image block is in place; uncomment it once the file is added to `images/` and `docs/images/`. |

## Redaction checklist (pre-publication)

- `username-entry.png` and `username-and-password.png` may show example sign-in
  values — **redact any real username/password before publication.** The guide
  already instructs SEs not to reuse screenshot values.
- Any screenshot showing a tenant password, connector ID, or PAC URL must be
  redacted before publication (see `docs/appendix/cleanup.md`).

## Vendored web assets (not screenshots)

Pinned Docsify assets under `docs/vendor/` (Docsify 4.13.1, docsify-copy-code 3.0.0,
PrismJS 1.29.0 language components) make the site load without a CDN. The Google
Fonts `@import` was removed from `vendor/vue.css`.
