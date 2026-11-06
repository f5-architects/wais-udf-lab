# Module 1 — Start the Writable Lab

In this module you launch the UDF Blueprint, wait for your writable WAIS tenant,
open the Windows 11 client, and sign in to the admin console **from Chrome inside
the RDP session** — the same environment that carries intercepted traffic.

---

## Exercise 1.1 — Open WAIS from the UDF Orchestrator

**Goal:** Open the WAIS provisioning page so your writable tenant can begin
provisioning.

**Prerequisites:** You have deployed the writable WAIS UDF Blueprint and it shows
as running.

**Steps**

1. In UDF, open your running deployment.
2. Select the **Orchestrator** component.
3. In the Orchestrator, open the **Access** menu.
4. Select **WAIS**.

![UDF Orchestrator Access menu showing the WAIS entry.](../images/wais-menu.png ':size=400')

*Figure 1.1 — Orchestrator → Access → WAIS opens the tenant provisioning page.*

> **Expected result.** A new browser tab opens the WAIS provisioning status page.
> If the tenant is still provisioning it shows a **building** state; if it is
> ready, it shows the **ready** page with credentials and download links.

> **Note.** If your Blueprint revision shows **SurePath** instead of **WAIS** in
> this Access menu, treat them as the same entry and continue. (`SurePath` here is
> a literal UI label; the product is WAIS.)

---

## Exercise 1.2 — Wait for your tenant

**Goal:** Recognize the **building** and **ready** states and locate the
credentials and download links on the ready page.

**Steps**

1. Leave the provisioning page open. While the tenant is created, the page shows a
   **building / waiting for tenant readiness** state.

   ![WAIS provisioning page waiting for the tenant to be created.](../images/waiting-for-tenant.png ':size=600')

   *Figure 1.2a — The provisioning page while your tenant is still being created.*

2. Wait for provisioning to finish (typically a few minutes).

3. When provisioning completes, the page refreshes to the **ready** state and
   shows your tenant details and downloads.

![WAIS provisioning ready page showing the admin login, admin-console button, and connector downloads.](../images/status-window-tenant-available.png ':size=650')

*Figure 1.2 — The ready page shows the generated admin account, an admin-console
button, a Windows installer, and an all-platforms ZIP.*

4. On the ready page, locate:
   - The **petname-based admin account** (unique to your deployment).
   - The generated **password** (shown on the page — do not copy it anywhere).
   - The **admin console** button.
   - The **Windows installer** and **all-platforms ZIP** download links.

> **Warning — do not record secrets.** The password on the ready page is a live
> credential. Do not paste it into documents, tickets, chat, screenshots, or
> source control. If you screenshot this page, redact the password before sharing.

> **Tip — admin console vs. connector downloads.** The **admin console** is the
> WAIS management UI you sign in to. The **Windows installer** and
> **all-platforms ZIP** contain the endpoint **connector** (proxy configuration),
> not the console. On the normal lab path the Windows 11 VM is already configured
> by the Blueprint's boot setup, so those downloads are a **fallback**, not a
> required first step.

> **Expected result.** The page shows the ready state with a readable admin
> account, a password, an admin-console button, and connector download links.

---

## Exercise 1.3 — Open the Windows 11 RDP session

**Goal:** Open the Windows 11 desktop **before** signing in to the admin console.

**Steps**

1. In UDF, find the **Windows 11** component in your deployment.
2. Start its **RDP** session (use the access method UDF provides).
3. Sign in to Windows with the lab credentials:

   ```text
   Username: user
   Password: user
   ```

4. Let the desktop finish loading. At startup the WAIS boot setup configures the
   proxy path and **Chrome launches automatically**. If Chrome does not open, you
   can launch it manually.

> **Note.** Chrome launching at startup does **not** by itself prove that proxy
> interception is working. You run a simple proxy check in
> [Exercise 2.2](/module2/test-proxy.md), and you confirm a real intercepted event
> in [Module 3](/module3/README.md).

> **Warning.** Do not change proxy, PAC, or certificate settings on the Windows
> client unless an exercise tells you to. The boot setup configured these for you;
> altering them can break interception for the rest of the lab.

> **Expected result.** You reach the Windows 11 desktop and Chrome is open (or you
> can open it yourself).

---

## Exercise 1.4 — Sign in to the admin console from Windows Chrome

**Goal:** Sign in to the WAIS admin console from Chrome in the Windows session,
using the generated credentials from the tenant-ready page.

> **Note.** Use **Chrome inside the Windows 11 RDP session** for this lab. The
> console is reachable from other devices too, but signing in here keeps your
> management view and your intercepted traffic in the same environment.

**Steps**

1. In the Windows session, open **Chrome**. On the tenant-ready page, copy your
   generated **username**, then select **Open the admin console** (or navigate to
   the tenant-specific admin URL it provides). The ready page is shown in
   [Exercise 1.2](/module1/README.md?id=exercise-12--wait-for-your-tenant).

2. On the sign-in screen, paste the generated **username** into the username field
   and continue.

   ![WAIS sign-in screen with the username and password fields, ready to submit.](../images/username-and-password.png ':size=500')

   *Figure 1.4a — The WAIS sign-in screen where you enter your generated
   credentials.*

   ![WAIS sign-in screen with the generated username entered.](../images/username-entry.png ':size=500')

   *Figure 1.4b — Enter the username generated for your deployment.*

3. When asked how you want to sign in, choose **Email and Password**.

   ![Sign-in method selection showing the Email and Password option.](../images/choose-password-method.png ':size=500')

   *Figure 1.4c — Select Email and Password as the sign-in method.*

4. Enter the **password** from the tenant-ready page and complete sign-in.

> **Note.** Read the username and password directly from the ready page each time.
> They are generated per deployment; do not reuse values from a previous run or
> from any example, and do not copy the example credentials visible in the
> screenshots.

> **Tip — if corporate SSO interferes.** If the browser auto-redirects to a
> corporate identity provider or signs you in as the wrong identity, open a
> **private / incognito window** and use the admin-console URL and credentials
> from the ready page there.

> **Expected result.** The WAIS admin console opens. You can see the primary
> navigation (for example, User Activity and the Observe area). The tenant
> hostname reflects your deployment's petname.

**Why it matters:** A successful console sign-in confirms your tenant is fully
provisioned and your credentials work — the gate for every later exercise.

**Reset / cleanup:** Sign out of the console and the RDP session when you finish.
The VM state persists for the life of the deployment.

[Next: Module 2 — Explore Your Tenant →](/module2/README.md)
