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

## Steps — confirm interception with the certificate (Chrome)

Because WAIS inspects the connection, the certificate presented to Chrome for an
intercepted site is issued through the **WAIS inspection trust** configured on this
VM — not the site's own public certificate. Viewing it is a quick, read-only way to
confirm traffic is taking the WAIS path.

1. In Chrome on the Windows client, open a site that the lab routes through WAIS.
2. Select the **padlock / site information** icon to the left of the address bar.
3. Open **Connection is secure → Certificate is valid** to view the certificate.
4. Inspect the **Issued by** and the certification path (intermediate/issuer). For an
   intercepted connection this reflects the lab's WAIS inspection trust rather than a
   public certificate authority.

![Viewing the certificate for an intercepted connection in Chrome to confirm the WAIS inspection path.](../images/validate-certificate.png ':size=650')

*Figure 2.2 — Inspecting the certificate chain for the test connection confirms the
traffic is taking the configured WAIS inspection path.*

> **Note.** Read the certificate; do **not** install or change any certificate. The
> exact subject and issuer values are whatever your tenant's inspection trust shows —
> compare against what your deployment documents.

> **Expected result.** The certificate for the intercepted connection is issued
> through the lab's WAIS inspection trust, confirming the connection is being routed
> through the WAIS proxy path.

> **Note.** A successful certificate check is strong evidence of the **configured
> path**, but it does not by itself prove that events are being **logged**. You
> confirm logging in [Module 3](/module3/README.md) by generating a live event and
> finding it in User Activity.

**Why it matters:** Confirming the PAC configuration *and* the inspection certificate
*before* you send traffic means a later "no event appeared" result points to the app
or policy, not a missing or broken proxy path.

**Reset / cleanup:** None — both checks are read-only and change nothing.

> **Tip.** If the automatic proxy setup is missing, or you want the deeper
> connectivity, scheduled-task, and log checks, see
> [Troubleshooting the Tenant Instance](/appendix/troubleshooting.md) and
> [Advanced Info for Proxy Connector Configuration](/appendix/proxy-connector-advanced.md)
> at the end of this guide. Those are reference material, not part of the normal
> path.

[Next: Module 3 — Generate and Inspect Live Events →](/module3/README.md)
