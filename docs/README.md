# F5 Workforce AI Security — Writable Lab Guide

Welcome. This guide helps an F5 Solutions Engineer (SE) stand up and explore a
**writable** F5 Workforce AI Security (WAIS) tenant in UDF, then run a short,
repeatable customer demo. It is a hands-on companion to the read-only WAIS lab.

## What you will do

The lab follows the order an SE actually works through the Blueprint:

1. **Start the writable lab (Module 1)** — open WAIS from the Orchestrator, wait
   for your tenant, open the Windows 11 RDP client, and sign in to the admin
   console from Chrome inside that session.
2. **Explore your tenant (Module 2)** — explore User Activity and Insights, and
   run a simple read-only check that the proxy path is configured.
3. **Generate and inspect live events (Module 3)** — send a harmless request from
   the Windows client and find the resulting live activity record.
4. **Configure policies (Module 4)** — create an isolated test policy and observe
   its effect, without editing the organization's default policy.
5. **Categorization (Module 5)** — explore categorization signals and a controlled
   test.

A separate [Demo playbook](/demo.md) packages a 5–10 minute customer demo.

> **Note — synthetic vs. live data.** Your tenant ships with *prepopulated
> synthetic User Activity* so you can explore reporting immediately. Synthetic
> records are sample data — they do **not** prove interception or enforcement is
> working. Only *live intercepted traffic* that you generate yourself (Module 3)
> demonstrates enforcement.

## Prerequisites

- Access to the writable WAIS UDF Blueprint.
- The ability to open an RDP session to the lab's Windows 11 desktop.
- A modern browser. A private/incognito window helps if corporate SSO interferes.

No prior WAIS configuration experience is required — the writable tenant is a
"blank canvas" you build on.

[Start the lab →](/module1/README.md)
