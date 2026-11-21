# Module 6 — MCP Governance with GitHub

In this module you configure Claude Code to use the GitHub MCP server through the
WAIS proxy, enable MCP tool governance in the Default Policy, and verify that WAIS
intercepts and can block individual tool calls.

> **Prerequisites for this module:**
> - Completed [Module 2 — Proxy verified](/module2/test-proxy.md).
> - Claude Code is reachable through the WAIS proxy on the Windows 11 VM (the
>   SurePath helper configures this — confirm it is running before starting).
> - You have a GitHub account and can create a Personal Access Token.

> **Why this matters for customers:** MCP agents make tool calls on the user's
> behalf — reading files, querying databases, running searches. WAIS can intercept
> those tool calls **before** the client receives the response and enforce a policy
> allow/block list. This is distinct from prompt governance: a tool call is a
> structured action, not a natural-language prompt. The customer question this
> answers is *"can we allow agents to use approved tools and block everything else?"*

---

- [6.1 — Connect Claude Code to the GitHub MCP server](/module6/mcp-setup.md)
- [6.2 — Configure MCP tool governance in WAIS and verify enforcement](/module6/mcp-policy.md)
