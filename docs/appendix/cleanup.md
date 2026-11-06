# Cleanup and lifecycle

## Per-run cleanup

After a lab run or a demo, return the tenant to a clean starting state:

1. **Delete test policies and groups** you created in
   [Module 4](/module4/README.md) and [Module 5](/module5/README.md).
2. **Confirm the default / organization policy is unchanged.** You should never have
   edited it; verify this explicitly.
3. **Leave activity history** as-is — accumulated synthetic and live test events do
   not need deletion. Optionally note which unique markers belonged to this run.

> **Warning.** Do not run destructive cleanup across the tenant (bulk policy
> deletion, resetting org settings) in the main lab path. Only remove the specific
> isolated objects you created.

## Deployment lifecycle

- A fresh deployment provisions a **new unique tenant** and proxy connector; an old
  deployment's tenant is torn down when the deployment is removed.
- If an environment is degraded (credits exhausted, proxy path broken, tenant
  stuck), the cleanest reset is often a **fresh Blueprint deployment** rather than
  in-place repair.
- Exact teardown timing and whether any artifacts persist between deployments need
  confirmation; verify before relying on it for a back-to-back customer demo.

## Secrets hygiene

- Never store or share the ready-page password, connector identifiers, or tenant
  URLs outside the lab environment.
- If you captured screenshots that show credentials, **redact** them before sharing
  or publishing.
- Keep petnames, passwords, PAC URLs, and connector IDs out of this guide's source
  and out of version control.
