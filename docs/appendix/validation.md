# Validation checklist

Actionable engineering and publishing checks that remain before this guide is
published or relied on in a customer setting. Reader-facing pages intentionally do
**not** carry authoring disclaimers — those checks live here.

## Docsify site / packaging

- [ ] **Offline assets.** Confirm no CDN requests remain when the site loads. Open
  the site, check the browser Network tab, and verify every request resolves to a
  local `vendor/` or `images/` path. (Assets are pinned to Docsify v4.13.1. The
  Google Fonts `@import` was removed from `vendor/vue.css`; system fonts are used.)
- [ ] **No emoji shortcodes.** Docsify fetches emoji images from a GitHub CDN only
  when `:shortcode:` emoji appear in Markdown. The current content uses none — keep
  it that way, or vendor the emoji assets, to preserve offline rendering.
- [ ] **Links and images.** Click through the sidebar; confirm every page loads and
  every screenshot renders (relative `../images/...` paths).
- [ ] **Serving.** Confirm the site serves correctly over a static HTTP server from
  the `docs/` root (see `DEPLOYMENT.md`), not only via `file://`.

## Screenshots / secrets

- [ ] **REDACTION — credentials in screenshots.** `username-entry.png` and
  `username-and-password.png` may show example sign-in values. Review and redact any
  real username/password before publication. The guide already tells SEs not to
  reuse the screenshot values.
- [ ] **Pending asset.** `images/status-window-tenant-building.png` is not yet
  supplied. Module 1 shows a TODO placeholder instead of the building-state image;
  add the image and uncomment the block when available.

## Live behavior not yet exercised

- [ ] **Live interception.** Generating a live event (Module 3) and seeing a new
  User Activity record has not been verified end to end in this environment.
- [ ] **Policy enforcement.** Whether an isolated policy's control reliably triggers
  on a crafted prompt (Module 4) needs a hands-on run.
- [ ] **Categorization.** Whether category rules can be created/modified, and whether
  a crafted prompt lands in a chosen category (Module 5), is unconfirmed.
- [ ] **Proxy/PAC specifics.** The helper address (`10.1.1.4`), scheduled-task name,
  boot-log path, and PAC value are documented as examples; confirm per deployment
  (see Troubleshooting / Advanced Info appendices).

## Branding

- [ ] **Official F5 theme review.** The site uses a clean Docsify theme with a red
  accent only — not an official F5 brand stylesheet. Apply and review official F5
  styling before public release.

## Future deployment integration (see `DEPLOYMENT.md`)

- [ ] **GitHub repo/tag.** Repository URL, branch, and pinned release tag are
  placeholders until the repo exists.
- [ ] **UDF hosting.** The GitHub release → UDF download → extract → serve workflow
  is documented but not implemented; it must not change UDF startup services until
  separately approved.
- [ ] **Port.** The documentation web service must use a configurable port distinct
  from the tenant-helper service on 8080; confirm an available port at deploy time.
