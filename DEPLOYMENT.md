# DEPLOYMENT.md — Publishing and hosting the WAIS lab guide

This document describes how the Docsify site under `docs/` can be published from a
future GitHub repository and served locally by the UDF Orchestrator VM. **Nothing
here changes infrastructure.** It is preparation only: no GitHub repo is created, no
UDF startup service is modified, and no deployment is performed in this pass.

> All repository URLs, tags, and deployment URLs below are **placeholders**. Replace
> them when the real values exist.

## Placeholders to fill in later

| Placeholder | Meaning | Example (not real) |
|---|---|---|
| `<REPO_URL>` | GitHub repository for this guide | `https://github.com/<org>/wais-writable-lab` |
| `<RELEASE_TAG>` | Pinned release tag or commit SHA | `v0.1.0` or a 40-char SHA |
| `<DEPLOY_URL>` | Where the VM serves the guide | `http://localhost:<PORT>/` |
| `<PORT>` | Local HTTP port for the guide | choose an available port, **not 8080** |

## 1. Publish from GitHub (future)

1. Create the repository at `<REPO_URL>` (not done in this pass).
2. Commit the `docs/` folder and `.nojekyll` (already present).
3. Cut a **pinned release tag** `<RELEASE_TAG>`. Pin to a tag or commit SHA for
   reproducibility — **do not** have the VM track `main`, so deployments stay
   predictable.
4. Optionally enable GitHub Pages pointing at `/docs` for a hosted copy.

## 2. Download + serve locally on the UDF Orchestrator VM (future)

The same `docs/` folder is self-contained (Docsify core, plugins, and Prism
components are vendored under `docs/vendor/`), so it can be served with any static
file server and needs **no internet access** at serve time.

Suggested workflow (illustrative — do not wire into UDF startup without approval):

```bash
# 1. Download the pinned release artifact
curl -L -o wais-lab.tar.gz "<REPO_URL>/archive/refs/tags/<RELEASE_TAG>.tar.gz"

# 2. Extract
tar -xzf wais-lab.tar.gz

# 3. Serve the docs/ folder read-only over HTTP on a dedicated port
cd <extracted-dir>/docs
python3 -m http.server <PORT>     # choose a free port, NOT 8080
```

Then open `<DEPLOY_URL>` in the VM's browser.

> **Keep services separate.** The tenant-helper Python service uses **port 8080**.
> Serve this documentation on a **different, configurable port** so the two do not
> collide. Confirm the chosen port is free at deploy time.

## 3. Offline / no-CDN requirement

Docsify renders Markdown in the browser, so its JavaScript and CSS must be present
locally. They are vendored under `docs/vendor/` and pinned:

- `docsify.min.js` — Docsify core, v4.13.1
- `vue.css` — Docsify Vue theme, v4.13.1
- `search.min.js`, `zoom-image.min.js` — Docsify v4.13.1 plugins
- `docsify-copy-code.min.js` — copy-code plugin, v3.0.0
- `prism-bash.min.js`, `prism-powershell.min.js`, `prism-json.min.js` — Prism 1.29.0
  language components for code highlighting

`index.html` references only these local paths — no CDN `<script>`/`<link>` tags.

> **Verify before claiming offline support.** Load the site and inspect the browser
> Network tab; every request should resolve to a local file. This is tracked in the
> [validation checklist](docs/appendix/validation.md).

## 4. Update / rollback

- **Update:** cut a new `<RELEASE_TAG>`, re-download, re-extract, restart the static
  server pointing at the new folder.
- **Rollback:** re-download the previous `<RELEASE_TAG>` and restart the server. Each
  release is self-contained, so rollback is a swap of extracted folders.

## 5. UDF Blueprint documentation note (suggested text)

A short note to add to the Blueprint description later (placeholders to fill in):

> The WAIS Writable Lab guide is served locally at `<DEPLOY_URL>`. The source and
> releases live at `<REPO_URL>`.

Do not add this to the Blueprint in this pass.
