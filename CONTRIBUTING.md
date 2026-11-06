# Contributing

Thanks for helping improve the **F5 Workforce AI Security — Writable UDF Lab** guide.
This repository is documentation (a Docsify site built from Markdown), so most
contributions are edits to pages, screenshots, or navigation.

## What to contribute

- Fixes to steps, expected results, or explanations.
- Clearer wording, better structure, or navigation fixes.
- Updated or added screenshots (with accurate captions and alt text).
- New or corrected validation items.

## Before you start

- Open an issue first for anything beyond a small fix, so we can agree on the change.
  Use the [issue templates](.github/ISSUE_TEMPLATE/) where they fit.
- Keep the scope of a pull request focused and reviewable.

## Markdown and Docsify conventions

- Pages are plain Markdown under `docs/`. The navigation is `docs/_sidebar.md`.
- Each exercise follows: **Goal**, **Prerequisites**, **Steps** (short, numbered),
  **Expected result**, **Why it matters**, **Reset / cleanup**.
- Put every copy/paste command, URL, sample prompt, or config in a fenced code block
  with a language tag (` ```powershell `, ` ```bash `, ` ```text `, ` ```json `).
- Use callouts as blockquotes with a bold label, e.g. `> **Note.** …`,
  `> **Warning.** …`, `> **Tip.** …`, `> **Expected result.** …`.
- Keep internal links **absolute from the docs root** (for example
  `/module2/test-proxy.md`) and image links as `/images/<file>.png`, matching the
  site's `relativePath: false` setting.
- Use fictional names and synthetic data in examples (e.g. `example.com`).

## Screenshots

- Add images to both `images/` and `docs/images/` and reference them from the page.
- **Redact secrets** (tenant passwords, usernames, connector IDs, PAC URLs, tokens,
  internal IPs) **before** adding any screenshot.
- Never rename the existing provided screenshots.

## Preview locally

```bash
cd docs
python3 -m http.server 3000
```

Open <http://localhost:3000> and verify your pages, navigation, and images. Confirm
no new CDN requests appear in the browser Network tab (the site must stay
offline-capable).

## Pull request expectations

- Describe what changed and why; link the related issue.
- Confirm the site previews cleanly and links/images resolve.
- **Do not include any secrets or real personal data** in content, screenshots, or
  commit messages.
- By contributing, you agree your contribution may be licensed under this
  repository's license once it is established (see `LICENSE-PENDING.md`).
