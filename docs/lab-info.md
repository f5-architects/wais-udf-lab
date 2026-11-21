# Lab Guide Info

Version and update information for the WAIS Writable Lab Guide.

---

## Update the lab guide

The lab guide is served from `/srv/wais-lab-guide/` on this Ubuntu VM and synced
from [github.com/f5-architects/wais-udf-lab](https://github.com/f5-architects/wais-udf-lab)
at `/opt/wais-lab-guide/`. The VM pulls the latest version automatically on each boot.

To update manually without rebooting — for example after a content fix is pushed
mid-lab — run this command on the Ubuntu VM:

```bash
sudo /opt/wais-lab-guide/scripts/update-lab-guide.sh
```

Then hard-refresh your browser (`Ctrl+Shift+R`) to see the new content.

> **What the script does:** `git fetch && git reset --hard origin/main`, then
> `rsync docs/ → /srv/wais-lab-guide/`. It logs to
> `/var/log/wais-lab-guide-update.log`. The script is safe to run at any time.

---

## Boot-time auto-update

The systemd service `wais-lab-guide-update.service` runs the update script once
after the network is online on every boot. To check its status:

```bash
systemctl status wais-lab-guide-update.service
```

To view the update log:

```bash
sudo tail -40 /var/log/wais-lab-guide-update.log
```

---

## Changelog

What has been added, changed, or fixed in each release of this lab guide.
Newest entries first.

---

### 2026-11-21

**Added**

- Exercise 4.7 — Group-based policy: Engineering exception pattern
  - Create `Lab-Engineering-Test` group and `Lab - Engineering Allow` group policy
  - Allowed services: Claude, Claude Code, and Anthropic API (search "Claude" in the Services tab)
  - Step 5: change Default Service Action to **Show the No Access Page** before testing ChatGPT block
  - Figures 4.7a–e with screenshots across the full flow
- Exercise 5.4 — Custom classifiers: protect business context (Project Lighthouse scenario)
  - Drag-and-drop a `.txt` file to load custom intent prompts (copy/paste not supported)
  - Connect the classifier to Default Policy → Intent Topic Controls with Monitor action
  - Verify detection in User Activity using `WAIS-LAB-CI-54` marker prompts
- Exercise 2.3 — From AI Visibility to Governance Decisions
  - Insights tour: Public Services, Transactions, Top Users filters
  - Public Services Intercept Support capability grid (Request, Response, License, File Upload, MCP)
  - Formulate a first governance recommendation from real data
- Module 6 — MCP Governance with GitHub *(authored; hidden from nav pending Claude API key provisioning on Windows VM)*
  - Exercise 6.1: GitHub fine-grained PAT creation, `claude_desktop_config.json` Notepad++ edit
  - Exercise 6.2: Default Policy MCP Tools tab — allow list, catch-all block, allowed/blocked tool call tests

**Changed**

- Exercise 4.7 Step 5: replaced Copilot redirect with **Show the No Access Page** (Copilot was inaccessible in lab)
- All `Notepad` references changed to **Notepad++** (installed on lab jumphost)
- Module 6 nav hidden from sidebar; files remain in `docs/module6/` for future use

**Fixed**

- Exercise 5.4 navigation corrected to `Workforce Security → Classifiers`
- Exercise 5.4 Step 1 removed (default writable tenant has no pre-existing classifiers)
- Exercise 4.7 split group creation and group policy creation into explicit separate steps (they are distinct console actions)
- `sources/` added to `.gitignore` to prevent internal curriculum from being published

---

### 2026-11 (initial writable lab build)

- Module 1–5 and Class 2 Demo Playbook
- Troubleshooting, proxy connector advanced info, cleanup, references, validation appendices
- Docsify static site: vendored assets, search, copy-code, zoom-image, F5 red accent theme

---

*This changelog covers lab guide content only. It does not track changes to the UDF Blueprint, the Python provisioning service, or the WAIS product itself.*
