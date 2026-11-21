# Exercise 6.2 — Configure MCP Tool Governance in WAIS

**Goal:** Enable MCP tool interception in the Default Policy, verify that WAIS
records GitHub MCP tool calls in User Activity, then block a specific tool and
confirm the block fires.

**Customer problem:** "We want to allow agents to use approved GitHub tools and block
everything else — and have an audit trail of what tools were actually called."

**Prerequisites:**

- Completed [Exercise 6.1](/module6/mcp-setup.md) — Claude Code is connected to the
  GitHub MCP server and you have confirmed at least one tool call succeeds.
- Signed in to the WAIS admin console.

> **Important — scope.** This exercise changes the **Default Policy MCP Tools tab**.
> The changes affect all users in the tenant. Reset before ending the lab.

---

## Background: how WAIS governs MCP tool calls

Before configuring anything, understand how the enforcement model works:

- **Tool calls are intercepted before the client sees the response.** When Claude
  Code's model decides to call a tool, the call goes through the WAIS gateway. If
  the tool is on the block list, the call is **replaced** — the client receives a
  blocked-tool response rather than the tool's output. This happens before the
  model's reply reaches the user.
- **The MCP Tools tab has three sections:** an **Allow list**, a **Block list**, and
  a **catch-all action** for tools on neither list. The catch-all governs every tool
  not explicitly named.
- **Allow/block precedence for MCP tools:** a tool on the block list is blocked even
  if it also appears on the allow list — the same precedence as the Service block list.

---

## Step 1 — Check the MCP Servers catalog

Before writing policy, confirm that WAIS has discovered the GitHub MCP server and
knows its tool list.

1. In the admin console, navigate to **Catalog → MCP Servers**.

> **Screenshot needed:** `docs/images/mcp-catalog-entry.png` — the MCP Servers
> catalog showing the GitHub MCP server entry with its tool count visible.

2. Find the GitHub MCP server entry. Note the number of tools listed.

   > The catalog is populated when WAIS first sees an MCP server connecting through
   > the proxy. If the entry is not present yet, return to Claude Code and run a
   > tool call (Step 4 of Exercise 6.1), then refresh the catalog.

3. Note the exact tool names listed for the GitHub server — you will reference these
   when configuring the block list.

   Common GitHub MCP tools include (names may vary by server version — use the names
   the catalog shows, not these examples):

   | Tool name | What it does |
   |---|---|
   | `get_file_contents` | Reads a file from a repository |
   | `list_directory` | Lists files and directories in a repo path |
   | `search_code` | Searches code across GitHub |
   | `search_repositories` | Searches GitHub repositories |
   | `create_issue` | Creates a GitHub issue (write — do not use in this lab) |
   | `push_files` | Pushes files to a repository (write — do not use in this lab) |

   > **Use only read-only tools in this lab.** Your token has read-only scope, so
   > write tools will fail with a permission error from GitHub regardless of WAIS
   > policy. The interesting result is a WAIS block before the token is even tested.

> **Expected result.** The GitHub MCP server appears in the catalog with a tool count
> matching what Claude Code reported via `/mcp`.

---

## Step 2 — Inspect the current MCP Tools policy state

1. Navigate to **Workforce Security → Default Policy** and select the **MCP Tools**
   tab.

> **Screenshot needed:** `docs/images/mcp-policy-default-state.png` — the Default
> Policy MCP Tools tab in its out-of-the-box state, before any changes.

2. Note the current state of:
   - The **catch-all action** (what happens to tools on neither list).
   - Any tools already on the **Allow list** or **Block list**.

   Record these values — you will restore them in the reset step.

> **Expected result.** You have a baseline record of the MCP Tools policy state.

---

## Step 3 — Allow specific tools and set the catch-all to block

This configuration demonstrates the "approved tools only" posture: allow a small
explicit list, block everything else.

1. On the **MCP Tools** tab, add the following tools to the **Allow list** (use the
   exact names the catalog showed in Step 1):

   ```text
   get_file_contents
   list_directory
   search_repositories
   ```

2. Set the **catch-all action** to **Block**.

3. Leave the **Block list** empty for now — the catch-all handles unapproved tools.

> **Screenshot needed:** `docs/images/mcp-policy-allow-list.png` — the Default
> Policy MCP Tools tab showing the three tools on the allow list and the catch-all
> set to Block.

4. Click **Save**.

> **Expected result.** The MCP Tools policy allows three GitHub read tools and blocks
> all others via the catch-all.

---

## Step 4 — Test an allowed tool call

1. Return to Claude Code on the Windows VM and run a tool call that uses one of the
   allowed tools:

   ```text
   WAIS-LAB-MCP-62a List the files at the root of https://github.com/f5devcentral/f5-surepath-lab-guide
   ```

2. Confirm Claude Code returns the file listing — the tool call was allowed through.

3. In the WAIS admin console, open **Observe → User Activity** and find the event
   for this call (filter by your identity or timestamp).

> **Screenshot needed:** `docs/images/mcp-allowed-tool-event.png` — User Activity
> event for the `WAIS-LAB-MCP-62a` prompt showing an MCP tool call with an
> `INTERCEPT` decision.

4. Open the event detail. Confirm:
   - The tool call is recorded.
   - The decision is `INTERCEPT` (allowed through).

> **Expected result.** The tool call succeeds and appears in User Activity as allowed.

---

## Step 5 — Test a blocked tool call

1. Return to Claude Code and attempt to call a tool that is not on the allow list.
   `search_code` is a natural one to try (if it was not in your allow list above):

   ```text
   WAIS-LAB-MCP-62b Search GitHub for code examples of Python Flask authentication
   ```

2. Observe the response in Claude Code — instead of search results, the agent
   receives a blocked-tool response from WAIS.

> **Screenshot needed:** `docs/images/mcp-blocked-tool-event.png` — User Activity
> event for the `WAIS-LAB-MCP-62b` prompt showing an MCP tool call with a `BLOCK`
> decision.

3. In User Activity, find the event and open the detail. Confirm:
   - The tool name that was blocked.
   - The decision is `BLOCK`.

> **Key point for customers:** The block happened **before** the tool ran. The GitHub
> API was never called. WAIS replaced the tool call response before it reached Claude
> Code. This is verifiable because the GitHub token had read scope for
> `search_code` — if the call had reached GitHub it would have succeeded; it was
> WAIS, not GitHub, that blocked it.

> **Expected result.** The tool call is blocked; User Activity shows `BLOCK` for the
> tool that was not on the allow list.

---

## Step 6 — Add a specific block list entry (optional)

The catch-all blocks everything not on the allow list. You can also name specific
tools explicitly on the block list — useful when the catch-all is set to allow and
you want to carve out specific tools.

1. Set the **catch-all action** back to **Allow** temporarily.
2. Add `create_issue` to the **Block list**.
3. Save, then attempt:

   ```text
   WAIS-LAB-MCP-62c Create a GitHub issue in any repository
   ```

4. Confirm the block fires even though the catch-all is now Allow.
5. Reset both changes (restore the catch-all to Block, remove `create_issue` from
   the block list) before continuing to the reset step.

> **Why this matters:** A customer might want to allow most tools but hard-block
> specific write operations (create issue, push files, delete branch) regardless of
> how the catch-all is set.

---

## Where to see the evidence

| Evidence type | Where to find it |
|---|---|
| MCP server and tool catalog | Catalog → MCP Servers |
| MCP tool policy | Workforce Security → Default Policy → MCP Tools tab |
| Tool call events | Observe → User Activity → `>` detail panel |
| Policy change record | Observe → Audit Logs |

---

## Customer talk track

> "What you're seeing here is WAIS intercepting not a prompt, but a structured tool
> call — the agent decided to call `search_code`, and WAIS stopped it before the
> call reached GitHub. The developer's Claude session got a blocked-tool response
> and the event is in User Activity with the full tool name and decision. This is
> how you let Engineering use an AI coding agent with approved GitHub tools — read
> access to the repos they need — while blocking write tools, admin tools, and
> anything you haven't explicitly approved. And when something unexpected happens,
> the audit trail is here."

---

## Reset / cleanup (required)

1. Navigate to **Workforce Security → Default Policy → MCP Tools** tab.
2. Remove all tools from the **Allow list** that you added in Step 3.
3. Remove all tools from the **Block list** that you added in Step 6 (if completed).
4. Return the **catch-all action** to its original value (recorded in Step 2).
5. Click **Save**.
6. In Claude Code, run `/mcp` and confirm the GitHub server is still connected — the
   reset only changes policy, not the client config.
7. Optionally remove the GitHub MCP server from Claude Code's config:
   - Open `%APPDATA%\Claude\claude_desktop_config.json` in Notepad.
   - Delete the `github` entry from `mcpServers`.
   - Save and restart Claude Code.
8. Delete or expire the GitHub PAT created in Exercise 6.1 from your GitHub
   account settings.

> **Warning.** Do not leave a permissive or unexpected MCP Tools policy on the
> Default Policy — it applies to everyone in the tenant.

---

[Back to Module 6 overview →](/module6/README.md)
