# Troubleshooting the Tenant Instance

Reference checks for when a step does not behave as expected. **You should not need
any of this for a normal run** — it lives here, out of the main exercises, on
purpose. All commands shown are **read-only** unless explicitly noted.

> **Note.** The Orchestrator helper address in this Blueprint is **10.1.1.4**, but
> SEs should not need to know it for normal use. It appears here only for deep
> connectivity checks.

> **Warning — scope.** Run these checks only on the supplied lab Windows 11 VM. Do
> not reinstall the proxy or change proxy / PAC / certificate settings on your own
> or a corporate-managed device.

## Symptom → likely cause → next check

| Symptom | Likely cause | Next check |
|---|---|---|
| Provisioning page stays on **building** | Tenant not ready yet | Wait a few minutes; reopen Orchestrator → Access → WAIS |
| Can't sign in to the console | Stale/incorrect credentials, or SSO hijack | Re-read credentials from the ready page; try a private/incognito window |
| `Test-NetConnection` returns **False** | Helper unreachable from client | Confirm the VM is on the lab network; confirm the helper address for your deployment |
| Helper answers but download is **404** | File not served (not a network failure) | Confirm the exact file name/path from the helper before retrying |
| No **AutoConfigURL** / PAC set | Boot setup did not complete | Check the scheduled task and boot log below |
| No **new** User Activity after a prompt | Traffic bypassed proxy, or app issue | Re-check PAC/proxy; confirm an intercepted GenAI service; confirm app has credits |

## Provisioning page never leaves "building"

- Confirm the deployment is fully running in UDF.
- Reopen **Orchestrator → Access → WAIS** to refresh the page.
- Allow a few minutes; provisioning is not instant.
- If it stays in building well beyond the expected time, capture the state and
  escalate to the lab maintainer. Do not assume a fixed timeout.

## Cannot sign in to the admin console

- Re-read the admin account and password from the **ready** page (they are
  per-deployment and may have refreshed).
- If the browser redirects to corporate SSO or signs you in as the wrong identity,
  use a **private/incognito** window with the console URL from the ready page.
- Confirm the tenant is in the **ready** state, not building.

## Proxy authentication prompt on the first request

The first time you send traffic from the Windows client (for example, your first
ChatGPT test), the **WAIS proxy** may present an **authentication prompt** before it
allows the request through. This is expected.

- Enter the **WAIS tenant username and password shown on your tenant provisioning /
  ready page** — the generated, petname-based credentials for your deployment.
- Do **not** use the Windows RDP `user` / `user` credentials here.
- After authenticating, resend the harmless test prompt and confirm a matching new
  event appears in User Activity.

This lab uses **three distinct credential contexts** — keep them straight:

| Context | What it is | Credentials to use |
|---|---|---|
| **Windows RDP** | Signing in to the Windows 11 lab desktop | `user` / `user` |
| **WAIS admin login** | The admin console (management UI) | Generated tenant credentials from the ready page |
| **WAIS proxy authentication** | The proxy prompt before intercepted traffic is allowed | Generated tenant credentials from the ready page |

> **Note.** Read the tenant credentials from the ready page each time; they are
> per-deployment. If your tenant's proxy prompt behaves differently, follow the lab
> owner's tested observation rather than assuming this exact flow.

## Windows client: helper not reachable

Run the read-only reachability check (lab example address):

```powershell
Test-NetConnection 10.1.1.4 -Port 8080
```

- `TcpTestSucceeded : True` — the helper is reachable; the problem is elsewhere.
- `TcpTestSucceeded : False` — the helper is unreachable from the client. Confirm
  the client is on the lab network and that `10.1.1.4` is the correct address for
  **your** deployment (treat it as an example, not a universal value).

## Reachable but a download returns 404

If the helper answers but a file under its `/files/` path returns **HTTP 404**, the
helper is reachable but that specific file is not being served. This is **not** a
network failure. Confirm the exact file name/path expected by the boot setup before
retrying, and do not invent a URL.

## Boot setup / scheduled task missing

Check for the setup task (the literal task name may still contain `SurePath`):

```powershell
Get-ScheduledTask -TaskName 'F5 Workforce AI Security lab setup'
```

If nothing is returned, search more broadly:

```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -match 'SurePath|Workforce|WAIS' }
```

Review the boot log:

```powershell
Get-Content 'C:\ProgramData\SurePath\Lab\lab-boot.log' -Tail 40
```

> **Note.** The exact scheduled-task name and boot-log path need confirmation
> against the current Blueprint image.

## Inspect the PAC / AutoConfigURL (read-only)

Read the configured auto-config (PAC) URL **without changing it**:

```powershell
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name AutoConfigURL |
  Select-Object -ExpandProperty AutoConfigURL
```

A single `AutoConfigURL` value should point at the lab helper's PAC endpoint. Read
it, but do not modify it. Do **not** invent or hardcode a PAC URL.

## Manual connector install (fallback only)

> **Warning.** This is a **fallback**, not the normal path. On a healthy image the
> boot setup configures the client automatically. Only use this if the boot setup is
> confirmed missing/broken, and note it in your run report.

1. Download the setup script from the helper's `/files/` path (confirm the exact
   file name from the helper; do not assume it).
2. Run it with its run-now switch to apply the configuration immediately.
3. Re-run the check in [Exercise 2.2](/module2/test-proxy.md).

> **Note.** The exact script file name, parameters (run-now / remove switches), and
> download URL must be confirmed from the current helper before documenting them as
> copy/paste commands. They are intentionally **not** hardcoded here.

## No live event appears after a prompt

- Re-run the PAC / `AutoConfigURL` read-only check above.
- Confirm the browser/profile actually uses the proxy (a second profile, a VPN, or a
  direct connection can bypass it).
- Confirm the destination is a GenAI service WAIS is configured to intercept.
- Confirm the GenAI app is signed in and has credits.

## GenAI app out of credits

A known lab constraint: test apps can run out of credits. This is an environment
issue, not a WAIS failure. Switch to another available app if one exists, or pivot
to exploring existing activity/reporting. See the recovery guidance in the
[Demo playbook](/demo.md).
