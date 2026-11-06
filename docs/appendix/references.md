# References

External and internal sources used while authoring this guide. Confirm product
behavior against current vendor documentation before relying on it in front of a
customer.

## Documentation format reference

- **F5 SurePath / Workforce AI Security read-only lab guide** —
  <https://github.com/f5devcentral/f5-surepath-lab-guide>

  Used as the **format, organization, and tone** reference for the original Sphinx
  source. (That repository's title retains `SurePath`; it is cited verbatim.) The
  guide has since been migrated to Docsify/Markdown. Scenario text was not copied;
  the writable lab does not assume the read-only lab's preconfigured scenarios.

- **Docsify** — <https://docsify.js.org/> — the documentation engine this site now
  uses (pinned v4; assets vendored locally under `vendor/`).

## Related projects (context only)

> **Note.** The items below come from internal project notes and are listed for
> context. They are **not required** to build or follow this guide, and some are
> unverified. Internal UDF deployment URLs and credentials are intentionally **not**
> reproduced here.

- **Lab services dependency.** The writable Blueprint depends on a lab-services
  container that creates a tenant on startup and removes it on shutdown. See the
  internal project notes for the repository and configuration.
- **AI assistant demo app.** A separate demo application project, referenced in
  project notes.
- **GitHub MCP server on the Windows VM (read-only lab).** The MCP capability in the
  older read-only blueprint used the GitHub MCP Server with a desktop AI client.
  Treat MCP exercises as **inspiration**, not confirmed-available in the writable
  tenant.

## Validation

- See the [Validation checklist](/appendix/validation.md) for every item that still
  needs a hands-on SE test or an engineering/publishing task.
- Add authoritative F5 product documentation links for the WAIS policy model,
  content controls, PII detection, and interception modes once confirmed, and cite
  them here.
