# Advanced Info for Proxy Connector Configuration

This is **optional reference material**, not a core exercise. It explains how the
Windows 11 client ends up configured to send eligible traffic through WAIS. The
normal lab path ([Exercise 2.2](/module2/test-proxy.md)) does not require any of it.

## The deployment chain

```text
UDF deployment
  → tenant provisioning and credentials
  → Python helper creates/reuses Proxy Connector
  → connector-specific PAC URL and deployment package
  → Windows scheduled startup task
  → proxy/PAC and trust configuration
  → eligible traffic sent through WAIS
  → new User Activity records
```

## What each stage means

- **Connector creation and reuse / tenant isolation.** The UDF Python helper
  provisions your writable tenant and then **creates or reuses a Proxy Connector**
  for it. Each deployment's connector identity and PAC configuration are specific to
  that tenant.
- **Why the PAC URL is not constructed from the petname.** Connector IDs and PAC
  URLs are tenant-specific and generated per deployment. They **must not** be
  reconstructed from the petname or copied from another deployment. Always let the
  boot setup — or the ready page's links — provide them.
- **The generated PowerShell deployment package and scheduled task (conceptually).**
  The connector exposes a generated Windows deployment package. In this lab a
  **scheduled startup task** runs it for you at boot, which is why you *verify*
  readiness instead of downloading and running the script by hand.
- **Admin login vs. proxy routing vs. traffic identity.** Three separate things,
  often confused:
  - *Admin-console login* — who you are in the management UI.
  - *Proxy routing* — which traffic is sent to WAIS for inspection, via PAC.
  - *Traffic identity* — which user the inspected traffic is attributed to.
  A working console login does not imply working proxy routing, and vice versa.
- **Where to look if the lab fails.** Work the checkpoints in order: helper
  reachable → connector ready → scheduled task ran → PAC configured → new activity
  visible. The read-only commands for each live in
  [Troubleshooting the Tenant Instance](/appendix/troubleshooting.md).

> **Warning.** Do not change proxy, PAC, or certificate settings on a non-demo or
> corporate-managed device without authorization and a rollback plan. It may work
> technically, but this lab should only alter its supplied Windows VM. Do not run
> the generated PowerShell on arbitrary endpoints.

> **Note.** Existing technical filenames, task names, registry keys, and URLs are
> kept exactly as the Blueprint uses them, including any that still contain
> `SurePath` as a literal string. The product name is **WAIS**.
