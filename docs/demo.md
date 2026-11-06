# Class 2 — SE Demo Playbook

This is a **self-contained** customer demo. You can run it without reading Class 1,
provided your writable tenant is ready. It is a 5–10 minute story that shows WAIS
visibility and control over GenAI traffic.

> **Note — choosing a blueprint for demos.** If you only need a fast, reliable
> walkthrough, the existing read-only WAIS blueprint may be the better choice. Use
> this writable-lab demo when you want to show **building and modifying** policy
> live. Confirm which fits the customer before you start.

---

## Demo readiness checklist

Run these checks **before** the customer joins:

1. **Tenant ready.** Open **Orchestrator → Access → WAIS** and confirm the page is
   in the **ready** state with credentials and downloads ([Module 1](/module1/README.md)).
2. **Console sign-in works.** Sign in to the admin console once in advance, from
   Chrome in the Windows RDP session. If corporate SSO interferes, pre-open a
   **private/incognito** window.
3. **Client proxy path verified.** On the Windows 11 client, run the read-only
   check from [Exercise 2.2](/module2/test-proxy.md) and confirm a PAC (automatic
   proxy) script is configured.
4. **A live event works.** Send one baseline prompt
   ([Exercise 3.1](/module3/README.md)) and confirm a new event appears. This proves
   interception *before* the customer is watching.
5. **GenAI app is signed in and has credits.** Confirm the test app is usable now —
   a known constraint is that test apps can run out of credits.
6. **Starting state is clean.** No leftover test policies/groups from a previous run
   (see Reset and repeat).

> **Warning.** Never show a customer a **synthetic** record and imply it proves live
> enforcement. The synthetic data demonstrates *reporting shape*; your live
> baseline + match events demonstrate *enforcement*.

---

## 5–10 minute demo script

Each stage lists what you **say**, what you **do**, and what the customer should
**observe**.

### Stage 1 — The problem (about 1 minute)

- **Say:** "Your workforce is already using public GenAI. The question isn't
  whether to allow it — it's how to get visibility and apply policy without
  blocking productivity."
- **Do:** Open the admin console to the **User Activity** view.
- **Customer observes:** A populated view of AI usage across identities and
  services.

> **Note.** The preloaded activity here is **synthetic sample data**. Frame it
> honestly: "This tenant ships with sample data so you can see the reporting; in a
> moment I'll generate real traffic live."

### Stage 2 — Live visibility (about 2 minutes)

- **Say:** "Let me show you a real request flowing through, right now."
- **Do:** On the Windows client, send a harmless baseline prompt with a unique
  marker:

  ```text
  Demo baseline WAIS-DEMO-BASE. Share a one-sentence fun fact about satellites.
  ```

- **Do:** Refresh **User Activity** and open the new event (match it by timestamp
  and marker).
- **Customer observes:** A brand-new event appears — live interception, not a
  canned record.

### Stage 3 — Policy in action (about 3–4 minutes)

- **Say:** "Now I'll apply a simple, targeted control and show the difference."
- **Do:** Use the **isolated test policy** you prepared
  ([Module 4](/module4/README.md)), scoped only to the demo identity, with a safe
  action (for example mask an email entity or warn on a category).
- **Do:** Send a prompt crafted to match the control:

  ```text
  Demo match WAIS-DEMO-MATCH. Draft a note to taylor.fictional@example.com about the satellite briefing.
  ```

- **Do:** Open the new event next to the baseline event.
- **Customer observes:** The matching event shows the control's action (mask /
  warn / monitor); the baseline did not. Same user, different outcome, because of
  policy.

> **Warning.** Use a **non-blocking** action for the main demo unless you have
> verified a block works in your tenant. Always use **fictional** identities and
> `example.com` addresses — never real customer data.

### Stage 4 — Wrap-up (about 1 minute)

- **Say:** "Visibility across all GenAI use, and targeted policy that protects
  sensitive data without blocking the workforce — configured in minutes."
- **Do:** Return to User Activity to show both events in context.
- **Customer observes:** The full loop — usage, detection, and enforcement — in one
  console.

---

## Customer talking points

- **Visibility first.** WAIS gives an auditable record of workforce AI use across
  public services.
- **Least-privilege policy.** A default baseline for everyone, additive group
  policies for specific populations.
- **Protect, don't just block.** Actions range from monitor and warn to mask and
  block, so you can reduce data exposure while keeping people productive.
- **Only GenAI is diverted.** Normal web traffic follows its usual path; only GenAI
  destinations are sent to WAIS.
- **Deploys into existing architecture.** Interception can be driven by a SASE
  forward-proxy chain or an endpoint PAC configuration.

> **Note.** Keep talking points to capabilities you can show or cite. Do not promise
> specific SKUs, roadmap items, or "works out of the box" credit/sign-in behavior
> for third-party AI apps.

---

## Recovering during a demo

- **No live event appears.** Re-run the [Exercise 2.2](/module2/test-proxy.md) proxy
  check; confirm the browser uses the proxy; confirm the destination is an
  intercepted GenAI service. If needed, fall back to narrating the synthetic data
  (clearly labeled as sample data).
- **App out of credits / signed out.** This is an environment issue, not a WAIS
  failure. Say so plainly, switch to a different available app if one exists, or
  pivot to the activity/reporting story using existing events.
- **SSO hijacks sign-in.** Use a private/incognito window with the console URL and
  credentials from the ready page.

---

## Reset and repeat

Return the tenant to a clean starting state before the next demo:

1. **Delete demo policies/groups** you created ([Module 4](/module4/README.md) /
   [Module 5](/module5/README.md)). Confirm the **default policy is unchanged**.
2. **Leave activity history** as-is (it is fine to accumulate test events), or note
   which markers were from this run.
3. **Re-verify readiness** using the Demo readiness checklist above.
4. If the environment is degraded (credits exhausted, proxy broken), consider a
   fresh Blueprint deployment — see
   [Cleanup and lifecycle](/appendix/cleanup.md).
