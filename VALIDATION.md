# VALIDATION.md — WAIS Writable Lab Guide

Actionable engineering, publishing, and hands-on checks remaining before this guide
is published or used with a customer. This mirrors `docs/appendix/validation.md`.
Reader-facing pages intentionally avoid authoring disclaimers.

## Docsify site / packaging
- [ ] **Offline assets.** Load the site and confirm the browser Network tab shows
  **no** CDN requests — every request resolves to a local `docs/vendor/` or
  `docs/images/` path. (Pinned Docsify v4.13.1; Google Fonts `@import` removed from
  `vendor/vue.css`.)
- [ ] **No emoji shortcodes.** Docsify fetches emoji from a GitHub CDN only for
  `:shortcode:` emoji. Content currently uses none — keep it that way (or vendor the
  emoji) to stay offline.
- [ ] **Links and images.** Click through the sidebar; confirm every page loads and
  every screenshot renders.
- [ ] **Serving.** Confirm it serves over static HTTP from `docs/`, not only `file://`.

## Screenshots / secrets
- [ ] **REDACTION:** `username-entry.png` and `username-and-password.png` may show
  example credentials. Redact real username/password before publication. The guide
  already instructs SEs not to reuse the screenshot values.
- [ ] **REDACTION:** `user-activity-logged.png` and `activity-redacted.png` show live
  User Activity — confirm no real identities/emails/tenant details are visible.
- [ ] **Captions not visually verified.** The live-events/policy screenshots
  (Modules 2–4, this pass) were added **without a sighted review** — captions and
  figure text were written from the prompt's descriptions, not from reading the
  images. Confirm each caption matches what the screen actually shows, and correct
  any UI label/value mismatch.
- [ ] **Pending asset:** `service-block.png` was not supplied. Exercise 4.4 has a
  commented TODO; add the image and uncomment the block when available.
- [ ] **Redaction source text:** the named source file
  (`simple-redaction-example.txt` / `simple-redaction.txt`) was **not present**;
  `docs/examples/simple-redaction.txt` is a clearly-synthetic replacement. Swap in the
  real approved text if one exists.
- [ ] *(optional)* add a screenshot of the redacted ChatGPT browser response in 3.3.

## Live behavior not yet exercised
- [ ] **Live interception + redaction** (Module 3): the ChatGPT success, matching User
  Activity event, and the Marketing/Redact/PII/Confidential/Risk/License redaction
  event are documented from supplied screenshots but **not run end to end here**.
- [ ] **Certificate check** (Exercise 2.2): the Chrome certificate-view steps are based
  on the screenshot + current Chrome UI; confirm the exact issuer/path on a real VM.
- [ ] **Policy block/allow** (Module 4.5–4.6): Grok blocked → Copilot redirect → allow
  → restore is documented from screenshots; confirm on a live tenant, including that
  the restore step returns the original blocked state.
- [ ] **Default Policy specifics** (4.4): confirm the starting mode is Allow - Protect
  and the exact Service Block Action options per deployment.
- [ ] **Categorization** (Module 5): whether category rules can be created/modified,
  and whether a prompt lands in a chosen category, is unconfirmed.
- [ ] **Proxy/PAC specifics:** helper address (`10.1.1.4`), scheduled-task name,
  boot-log path, and PAC value are examples; confirm per deployment.
- [ ] **Policy API source:** the internal WAIS org/policy API docs returned HTTP 302
  (corporate auth) and could not be read; `docs/sources/policy-behavior-notes.md` is
  grounded only in screenshots. Confirm product-level details against the API docs or
  current public F5 documentation.

## Branding
- [ ] **Official F5 theme review.** The site uses a clean Docsify theme with a red
  accent only — not an official F5 brand stylesheet. Apply/verify official F5 styling
  before public release (recorded as pre-publication, not a blocker for this
  migration).

## Future deployment integration (see `DEPLOYMENT.md`)
- [ ] GitHub repo URL, branch, and pinned release tag are placeholders until the repo
  exists.
- [ ] GitHub release → UDF download → extract → serve workflow is documented but not
  implemented; do not change UDF startup services until separately approved.
- [ ] Documentation web service must use a configurable port **distinct from 8080**;
  confirm a free port at deploy time.

## Migration parity
- [ ] Confirm the Docsify pages preserve the content/screenshots of the archived
  Sphinx/RST source (kept privately under `.local/legacy-rst/`, not published); then
  that archive may be removed.

## Repository publication
- [ ] **License** is not established — see `LICENSE-PENDING.md` (publication blocker).
- [ ] **Security contact** placeholder in `SECURITY.md` must be replaced with an
  approved private reporting channel before release.
- [ ] **Conduct contact** placeholder in `CODE_OF_CONDUCT.md` must be filled in.
- [ ] **Hosted URL** placeholder `<REPO_OR_PAGES_URL>` in `README.md` set once the
  GitHub repo exists.
