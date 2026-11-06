# Exercise 2.2 — Test the Proxy after Tenant is Created

**Goal:** Confirm, with a simple read-only check, that the Windows 11 client is
configured to send eligible traffic through the WAIS proxy path.

**Prerequisites:** You are signed in on the Windows 11 desktop
([Module 1](/module1/README.md)).

## What the Blueprint already did

When your tenant was created, the Blueprint automatically **creates or reuses a
WAIS Proxy Connector** for your deployment and **configures the Windows 11 VM**
during startup. You do not install anything by hand.

A **PAC file** (Proxy Auto-Configuration) tells the client *which requests* to send
through the WAIS proxy path and which to send directly. It is **not** the admin
console URL — one routes traffic for inspection, the other is the management UI you
signed in to.

Chrome opening at startup is expected, but by itself it does **not** prove that
interception is active. This quick check confirms the PAC configuration is present;
the next module proves the path by generating a live event.

## Steps — read-only check (Windows UI)

1. In Windows, open **Settings → Network & Internet → Proxy**.
2. Under **Automatic proxy setup**, confirm **Use setup script** is **On** and a
   **Script address** is present.
3. Note that a script address belonging to the lab is configured. You do **not**
   need to know or change its exact value.

> **Warning.** Do not toggle these settings off or edit the script address. The
> Blueprint set them for this VM. Changing them can break interception for the
> rest of the lab.

> **Expected result.** A PAC (automatic proxy setup) script is configured for this
> lab VM. No changes are required.

**Why it matters:** Confirming the PAC configuration exists *before* you send
traffic means a later "no event appeared" result points to the app or policy, not
a missing proxy setup.

**Reset / cleanup:** None — this check is read-only and changes nothing.

> **Tip.** If the automatic proxy setup is missing, or you want the deeper
> connectivity, scheduled-task, and log checks, see
> [Troubleshooting the Tenant Instance](/appendix/troubleshooting.md) and
> [Advanced Info for Proxy Connector Configuration](/appendix/proxy-connector-advanced.md)
> at the end of this guide. Those are reference material, not part of the normal
> path.

[Next: Module 3 — Generate and Inspect Live Events →](/module3/README.md)
