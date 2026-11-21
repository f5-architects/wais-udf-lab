# MCP Governance Lab

> **Status: built but temporarily hidden from navigation.**
>
> Module 6 (MCP Governance with GitHub) has been authored and is in the repository,
> but is currently removed from the sidebar because it requires a Claude API key
> configured on the Windows 11 VM — which is not yet provisioned in the lab blueprint.
> The files remain in `docs/module6/` and will be re-linked once the API key
> prerequisite is resolved.

---

## Open items before this lab is fully validated

The following items still need a hands-on SE test. See
[CONFIRMATION_NEEDED.md](/CONFIRMATION_NEEDED.md) for the full tracking table.

- **Node.js on the Windows 11 VM.** Confirm whether Node.js v18+ is pre-installed
  in the Blueprint image or needs to be installed manually.
- **GitHub MCP server in the WAIS catalog.** Confirm the server appears in
  Catalog → MCP Servers automatically after first use, and that tool names match
  what the lab text describes.
- **MCP Tools tab in the Default Policy.** Confirm navigation path and exact UI
  labels for Allow list, Block list, and catch-all action.
- **User Activity evidence for blocked tool calls.** Confirm the event detail shows
  the tool name and a `BLOCK` decision in the current tenant version.

---

[Back to Appendices →](/appendix/)
