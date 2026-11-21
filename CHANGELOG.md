# WAIS Writable Lab Guide — Changelog

Tracks what was added, changed, or fixed across lab guide releases.
Newest entries at the top.

---

## Unreleased

- Lab Guide Info page and manual update command added to sidebar
- Boot-time auto-update systemd service (`scripts/update-lab-guide.sh`)

---

## 2026-11-21

### Added
- **Exercise 4.7** — Group-based policy: Engineering exception pattern
  - Create `Lab-Engineering-Test` group and `Lab - Engineering Allow` group policy
  - Allowed services: Claude, Claude Code, Anthropic API (search "Claude" in Services tab)
  - Step 5: change Default Service Action to "Show the No Access Page" before testing
  - Figures 4.7a–e with screenshots of group policy form, assigned groups, services, block page
- **Exercise 5.4** — Custom classifiers: protect business context (Project Lighthouse)
  - Drag-and-drop `.txt` file to load custom intent prompts
  - Connect classifier to Default Policy Intent Topic Controls (Monitor action)
  - Test with `WAIS-LAB-CI-54` marker prompts; verify in User Activity
- **Exercise 2.3** — From AI Visibility to Governance Decisions
  - Insights tour: Public Services, Transactions, Top Users
  - Public Services Intercept Support capability grid
  - Formulate a first governance recommendation
- **Module 6** — MCP Governance with GitHub (authored; hidden from nav pending Claude API key provisioning on Windows VM)
  - Exercise 6.1: GitHub fine-grained PAT setup, `claude_desktop_config.json` config
  - Exercise 6.2: Default Policy MCP Tools tab — allow list, catch-all block, enforcement verification
- **Demo playbook** — updated with group policy and classifier demo paths
- **`CONFIRMATION_NEEDED.md`** — internal authoring tracker for unverified steps
- **`SCREENSHOTS_NEEDED.md`** — screenshot capture queue with status tracking

### Changed
- Exercise 4.7 Step 5: redirect behavior changed from Copilot to **Show the No Access Page** (Copilot was inaccessible in lab)
- All `Notepad` references updated to **Notepad++** (installed on lab jumphost)
- Module 6 nav hidden from sidebar; files remain in `docs/module6/` for future use

### Fixed
- Exercise 5.4 navigation corrected to `Workforce Security → Classifiers`
- Exercise 5.4 Step 1 removed (default tenant has no pre-existing classifiers)
- Exercise 4.7 group creation and group policy creation split into explicit separate steps
- `sources/` directory added to `.gitignore` to prevent internal curriculum from being published

---

## 2026-11 (initial writable lab build)

### Added
- Module 1: UDF Orchestrator → Access → WAIS, provisioning building/ready states
- Module 2: User Activity and Insights exploration; proxy readiness check
- Module 3: Live event generation and inspection
- Module 4: Policy review (read-only), isolated test policy, Default Policy tour, block/redirect, Grok allow
- Module 5: Categorization review, configure, verify
- Demo playbook (Class 2): 5–10 minute SE customer demo with reset steps
- Appendices: troubleshooting, proxy connector advanced info, cleanup, references, validation checklist
- Docsify static site with vendored assets, search, copy-code, zoom-image plugins
- F5 red accent theme

---

*This changelog covers lab guide content only. It does not track changes to the UDF Blueprint, the Python provisioning service, or the WAIS product itself.*
