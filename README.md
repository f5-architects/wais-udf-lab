# F5 Workforce AI Security — Writable UDF Lab

A hands-on, self-paced lab guide for standing up and exploring a **writable**
F5 Workforce AI Security (WAIS) tenant in F5 UDF, plus a short, repeatable customer
demo. The guide is a [Docsify](https://docsify.js.org/) site built from Markdown.

> This repository is **lab documentation**. It does not modify the WAIS product, the
> UDF Blueprint, or any provisioning service, and it is **not** an official F5
> product support channel.

## Who this is for

F5 Solutions Engineers (SEs) and approved lab users with access to the writable WAIS
UDF Blueprint. No prior WAIS configuration experience is required — the writable
tenant is a "blank canvas" you build on.

## What you will learn

- Access a freshly provisioned tenant from the UDF Orchestrator.
- Open the Windows 11 lab client and sign in to the WAIS admin console from it.
- Explore **User Activity** and **Observe → Insights**.
- Verify the client's proxy / PAC configuration (read-only).
- Generate and inspect **live** intercepted traffic.
- Create an isolated test policy and observe enforcement.
- Explore categorization.
- Run a concise **5–10 minute customer demo**.

## Prerequisites

- Access to F5 UDF and a **deployed writable WAIS Blueprint**.
- The ability to open an RDP session to the lab's Windows 11 desktop (the supported
  lab client).
- A modern browser; a private/incognito window helps if corporate SSO interferes.

## The lab guide

The full guide lives under [`docs/`](docs/) as a Docsify site.

> **Hosted link:** `<REPO_OR_PAGES_URL>` — *placeholder.* Fill in once the GitHub
> repository (and optional GitHub Pages) URL is known. See
> [`DEPLOYMENT.md`](DEPLOYMENT.md).

### Preview locally

No build step is required — Docsify renders Markdown in the browser, and all assets
are vendored locally (no CDN):

```bash
cd docs
python3 -m http.server 3000
```

Then open <http://localhost:3000>. Use any free port; for UDF hosting choose a port
**other than 8080** (reserved for the tenant-helper service) — see
[`DEPLOYMENT.md`](DEPLOYMENT.md).

## Repository layout

```text
.
├── README.md             # this page (GitHub landing)
├── docs/                 # the Docsify lab site (publishable, offline-capable)
│   ├── index.html        # Docsify bootstrap (local assets only)
│   ├── README.md         # Docsify home page
│   ├── _sidebar.md       # navigation
│   ├── .nojekyll
│   ├── images/           # screenshots used by the pages
│   ├── vendor/           # pinned Docsify v4 + plugins (local, no CDN)
│   ├── module1/ … module5/
│   ├── demo.md           # SE demo playbook
│   └── appendix/         # troubleshooting, advanced proxy info, cleanup, references, validation
├── images/               # original source screenshots (do not rename)
├── ASSETS.md             # asset inventory + image TODO list
├── DEPLOYMENT.md         # future GitHub → UDF hosting (placeholders)
├── VALIDATION.md         # publishing / engineering / hands-on checks
├── CONTRIBUTING.md  CODE_OF_CONDUCT.md  SECURITY.md  SUPPORT.md
└── .github/ISSUE_TEMPLATE/
```

## Contributing & support

- [Contributing guide](CONTRIBUTING.md)
- [Support boundaries](SUPPORT.md)
- [Security policy](SECURITY.md)
- [Code of conduct](CODE_OF_CONDUCT.md)

## License

The license for this repository is **not yet established**. See
[`LICENSE-PENDING.md`](LICENSE-PENDING.md) — this is a publication blocker that must
be resolved by the maintainers before public release.

## Notes

- Screenshots show **synthetic demonstration data**; values, timestamps, and
  displayed records may vary between deployments.
- The guide never contains generated tenant credentials, tokens, PAC URL secrets, or
  personal setup notes. Per-deployment credentials always come from your own
  tenant-ready page.
