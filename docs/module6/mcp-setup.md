# Exercise 6.1 — Connect Claude Code to the GitHub MCP Server

**Goal:** Create a read-only GitHub Personal Access Token, configure the GitHub MCP
server in Claude Code's MCP settings, and confirm that Claude Code can call a GitHub
tool — with all traffic flowing through the WAIS proxy.

**Customer problem:** "We want to let developers use an AI coding agent with GitHub
access, but we need visibility and control over what the agent actually does."

**Prerequisites:**

- Proxy verified — [Exercise 2.2](/module2/test-proxy.md) passed.
- Claude Code is installed on the Windows 11 VM and the SurePath helper is
  configured. Confirm by running `claude --version` in a terminal.
- You have a GitHub account (a personal account is fine for the lab — no corporate
  GitHub organization is required).

> **Safety scope.** This exercise uses a **read-only** GitHub token scoped to public
> repositories only. Do not use tokens with write permissions, admin access, or
> access to private repositories containing sensitive code. The token is a live
> credential — do not commit it, paste it into chat, or include it in screenshots.

---

## Step 1 — Create a read-only GitHub Personal Access Token

1. In a browser, sign in to [github.com](https://github.com).

2. Navigate to **Settings → Developer settings → Personal access tokens →
   Fine-grained tokens** and click **Generate new token**.

   | Field | Value |
   |---|---|
   | **Token name** | `wais-lab-mcp-readonly` |
   | **Expiration** | 7 days (enough for the lab; shorter is safer) |
   | **Resource owner** | Your personal account |
   | **Repository access** | **Public Repositories (read-only)** |

3. Under **Permissions**, grant only:

   | Permission | Access |
   |---|---|
   | **Contents** | Read-only |
   | **Metadata** | Read-only (selected automatically) |

   > **Do not grant** write, admin, or any other permission. The lab only needs to
   > read file contents from a public repository.

4. Click **Generate token** and **copy the token value immediately** — GitHub shows
   it only once.

5. Store it temporarily in a Notepad window on the Windows VM. You will paste it
   into the Claude Code config in Step 3. Do not save it to a file you might commit.

> **Expected result.** A fine-grained token named `wais-lab-mcp-readonly` exists in
> your GitHub account with read-only access to public repositories.

---

## Step 2 — Confirm Node.js is available on the Windows VM

The GitHub MCP server runs as a Node.js process. Claude Code launches it
automatically when configured, but Node.js must be installed first.

1. Open a **Command Prompt** or **Windows Terminal** on the Windows 11 VM.

2. Run:

   ```powershell
   node --version
   ```

3. Confirm a version of **18 or higher** is printed (e.g. `v20.11.0`).

> **If Node.js is not installed:** Download the LTS installer from
> [nodejs.org](https://nodejs.org) and install it. Accept all defaults. Reopen your
> terminal after installation.

> **Screenshot needed:** `docs/images/mcp-node-version.png` — terminal output of
> `node --version` showing v18 or higher.

> **Expected result.** `node --version` prints v18+.

---

## Step 3 — Add the GitHub MCP server to Claude Code

The GitHub MCP server is published by GitHub as an npm package
(`@modelcontextprotocol/server-github`). Claude Code can launch it directly via
`npx` with no separate install step.

1. On the Windows VM, open a terminal and navigate to the directory where you will
   run Claude Code:

   ```powershell
   cd %USERPROFILE%
   ```

2. Create or edit Claude Code's MCP configuration file at
   `%APPDATA%\Claude\claude_desktop_config.json`. Open it in Notepad:

   ```powershell
   notepad "%APPDATA%\Claude\claude_desktop_config.json"
   ```

   > If the file does not exist, Notepad will offer to create it — click **Yes**.

3. Add the following configuration, replacing `<YOUR_TOKEN_HERE>` with the token
   you copied in Step 1:

   ```json
   {
     "mcpServers": {
       "github": {
         "command": "npx",
         "args": [
           "-y",
           "@modelcontextprotocol/server-github"
         ],
         "env": {
           "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_TOKEN_HERE>"
         }
       }
     }
   }
   ```

   > **Important.** The token value goes in the `env` block, not in `args`. This
   > keeps it out of process arguments and command history.

4. Save and close Notepad.

> **Screenshot needed:** `docs/images/mcp-config-file.png` — Notepad showing the
> `claude_desktop_config.json` contents with the token value **fully redacted**
> (replace with `<REDACTED>`). Do not capture a screenshot with a real token visible.

> **Expected result.** The config file is saved and contains a `github` entry in
> `mcpServers`.

---

## Step 4 — Start Claude Code and confirm the MCP server connects

1. In the terminal, start Claude Code:

   ```powershell
   claude
   ```

2. At the Claude Code prompt, check that the GitHub MCP server loaded:

   ```text
   /mcp
   ```

   This lists active MCP servers and their status. Look for `github` with a
   **connected** status.

> **Screenshot needed:** `docs/images/mcp-server-connected.png` — Claude Code
> terminal showing `/mcp` output with the `github` server listed as connected.

3. Run a quick read-only tool call to confirm connectivity. Use a public repository
   — the WAIS lab guide repository itself works:

   ```text
   List the files in the root of the repository github.com/f5devcentral/f5-surepath-lab-guide
   ```

   Claude Code should respond by calling `list_directory` or a similar GitHub MCP
   tool and returning a file listing.

> **Expected result.** Claude Code returns a file listing from the public repository,
> confirming the GitHub MCP server is connected and tool calls are flowing through
> the WAIS proxy.

> **What WAIS sees:** Every tool call made by Claude Code passes through the WAIS
> proxy as a structured request. You will verify the resulting User Activity event
> in [Exercise 6.2](/module6/mcp-policy.md).

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `github` not listed in `/mcp` | Config file not found or JSON syntax error | Re-open the config file and check for missing commas or braces; validate JSON at jsonlint.com |
| `npx` not found | Node.js not installed | Complete Step 2 |
| `401 Unauthorized` from GitHub | Token expired or wrong scope | Regenerate the token with the correct permissions |
| Tool call succeeds but no WAIS event appears | Proxy not routing Claude Code traffic | Confirm the SurePath helper is running (`surepath-helper --report`) |

---

[Next: Exercise 6.2 — Configure MCP tool governance →](/module6/mcp-policy.md)
