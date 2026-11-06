# Policy behavior notes (sources)

Concise, original paraphrases of the policy behavior this lab demonstrates, with an
explicit line between **what the lab screenshots show** and **product details that
still need confirmation**. These notes support Module 4.

## Observed in this lab's screenshots (primary evidence)

From the supplied UI captures (`default-policy.png`, `action-choices.png`,
`x-ai-trial.png`, `try-something-better.png`, `copilot-redirection.png`,
`add-grok.png`, `click-save.png`, `saved.png`, `grok-allowed.png`):

- The tenant's **Default Policy** has a **Default Service Action** that can be set to
  one of three modes: **Allow - Monitor**, **Allow - Protect**, or **Block**.
- In this lab's starting configuration the Default Service Action is
  **Allow - Protect**.
- A **Service Access Control / Allowed Services** list governs which known services
  are explicitly allowed.
- When a service is blocked, a **Service Block Action** determines the user
  experience: redirect to a configured URL (e.g. a sanctioned service such as
  Copilot), redirect to `portal.surepath.ai`, or show a no-access page.
- The lab demonstrates blocking **Grok** (reached via `https://x.ai`), redirecting to
  Copilot, then moving Grok into Allowed Services, saving, and retesting to show the
  allowed outcome.

## Mode descriptions (as used in this guide)

- **Allow - Monitor:** Requests to known services are allowed; the Allowed Services
  list is ignored; sensitive-data controls are set to Monitor.
- **Allow - Protect:** Requests to known services are allowed; the Allowed Services
  list is ignored; sensitive-data controls are applied (enforced).
- **Block:** Known services are blocked by default unless explicitly allowed through
  Service Access Control; the response to blocked traffic is set by Service Block
  Action.

## Needs confirmation (not asserted in the guide as fact)

- Exact menu paths, button labels, and field names beyond what the screenshots show.
- Precise rule precedence between Default Policy and any group policies.
- Whether every tenant starts in Allow - Protect (this lab's starting state may be
  demo-specific).

## References

- **Lab UI screenshots** in `docs/images/` — primary evidence for this guide.
- **WAIS product API documentation** — an internal documentation portal exists for
  org/policy APIs but requires corporate authentication and was **not reachable**
  during authoring; its contents are therefore **not** quoted or paraphrased here.
  Confirm product-level details against it (or current public F5 documentation)
  before relying on them with a customer. Internal-only URLs are intentionally kept
  out of this public file (see `.local/notes/` for any internal references).
