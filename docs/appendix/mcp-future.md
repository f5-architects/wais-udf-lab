# Future Lab — MCP Governance

> **Owner: Matthieu**
>
> This lab is **not yet implemented**. The placeholder below outlines the scenario,
> prerequisites, and handoff checklist for Matthieu to build out. Do not present
> this page as a working exercise.

---

## Planned scenario

**Customer question:** "Can WAIS control which tools an AI agent can call, and can it
block a specific MCP tool while allowing the rest of the server?"

The planned lab builds on the read-only WAIS lab guide and uses a GitHub MCP server
as the concrete example:

1. Register a GitHub MCP server and confirm WAIS sees its tool list.
2. Inspect the **MCP Servers** catalog entry and note per-server tool count.
3. Set a Default Policy **MCP Tools** action with a block list for one specific tool
   and an allow list for others.
4. Run an MCP agent session and generate tool-call events.
5. Confirm a blocked tool call in User Activity.
6. Show the administrative change in Audit Logs.
7. Reset.

---

## Handoff checklist for Matthieu

Before authoring this lab, verify or resolve each item:

- [ ] **Client prerequisites.** Which Claude Code and helper versions support MCP
      interception in the writable tenant? Confirm the exact install path on the
      Windows 11 VM.
- [ ] **GitHub MCP server setup.** What credentials are required (GitHub token scope)?
      Provide a safe, read-only example that uses a public repository — no write
      permissions, no secrets.
- [ ] **Tool naming in the console.** Confirm the exact tool names WAIS surfaces for
      the GitHub MCP server (e.g., `get_file_contents`, `search_code`). Names may
      differ between MCP server versions.
- [ ] **Policy location.** Confirm the exact navigation path to MCP Tools controls
      in the current Default Policy editor (the sources note it is on the **MCP Tools**
      tab of the v1 policy).
- [ ] **Block-list vs. allow-list behavior for tools.** Confirm whether the same
      block-overrides-allow precedence from service lists applies to MCP tool lists.
- [ ] **User Activity evidence.** Confirm that a blocked tool call appears as a
      distinct decision (e.g., `BLOCK`) in User Activity and what fields are visible.
      Do not describe fields that are not confirmed.
- [ ] **Screenshots.** At minimum: MCP server catalog entry with tool count; Default
      Policy MCP Tools tab with a block-listed tool; User Activity event for a blocked
      MCP tool call; Audit Log entry for the policy change.
- [ ] **Reset steps.** Document exact steps to remove the MCP server registration,
      reset MCP policy, and clean the Windows client configuration.
- [ ] **Demo fit.** Confirm whether this lab fits the 5–10 minute demo track or
      requires its own extended scenario.

---

## Related reading (internal sources — do not publish)

- `sources/08-intent-classifiers.md` — MCP tool calls are intercepted before the
  client sees them; a blocked tool call is replaced before the response reaches the
  client.
- `sources/03-the-surfaces.md` — MCP Servers catalog: each server listed with per-server
  tool count; policy is applied against it.
- `sources/07-policy-enforcement.md` — MCP Tools tab: block list, allow list, and
  catch-all for tools on neither.
- Read-only WAIS lab guide (Matthieu's existing guide) for prior MCP examples and
  demo patterns.

---

[Back to Appendices →](/appendix/)
