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
- [ ] **Pending asset:** `images/status-window-tenant-building.png` is not yet
  supplied. Module 1 shows a commented TODO placeholder; add the image and uncomment
  the block when available.

## Live behavior not yet exercised
- [ ] **Live interception** (Module 3): generating a live event and seeing a new
  User Activity record is not verified end to end here.
- [ ] **Policy enforcement** (Module 4): whether a control reliably triggers on a
  crafted prompt needs a hands-on run.
- [ ] **Categorization** (Module 5): whether category rules can be created/modified,
  and whether a prompt lands in a chosen category, is unconfirmed.
- [ ] **Proxy/PAC specifics:** helper address (`10.1.1.4`), scheduled-task name,
  boot-log path, and PAC value are examples; confirm per deployment.

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
