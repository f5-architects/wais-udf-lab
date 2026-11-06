# Exercise 4.5 — Demonstrate blocking and redirection

**Goal:** See what a user experiences when they reach a **blocked** service, and how
the policy **redirects** them to a sanctioned alternative.

**Prerequisites:** You completed [Exercise 4.4](/module4/default-policy.md) and are
working from Chrome in the Windows 11 RDP session.

**Starting state (from the lab configuration):** **Grok** is **blocked**, and the
Service Block Action is configured to **redirect to Copilot**.

**Steps**

1. In a new Windows Chrome tab, navigate to Grok at `https://x.ai` and select
   **Try for free**.

   ![Reaching the Grok "Try for free" entry point at x.ai.](../images/x-ai-trial.png ':size=650')

   *Figure 4.5a — Starting a Grok trial at `https://x.ai`.*

2. Because Grok is blocked, WAIS intercepts the request and shows the blocked
   experience rather than the service.

   ![The blocked experience shown when reaching a blocked service.](../images/try-something-better.png ':size=650')

   *Figure 4.5b — The blocked service presents a "try something better" experience.*

3. Follow the policy-directed redirection to the sanctioned alternative.

   ![Policy-directed redirection to Microsoft Copilot.](../images/copilot-redirection.png ':size=650')

   *Figure 4.5c — The Service Block Action redirects the user to Copilot.*

> **Expected result.** Grok does not load; the user is presented with the blocked
> experience and redirected to the sanctioned service (Copilot) configured by the
> Service Block Action.

> **Note.** The redirect you see depends on the **current Service Block Action**.
> Another organization might instead redirect to `portal.surepath.ai` or show the
> no-access page — the mechanism is the same, the destination is a policy choice.

**Why it matters:** This shows how WAIS steers users away from unsanctioned AI toward
approved tools **without a hard dead end** — a key part of the customer story.

**Reset / cleanup:** None yet — you change the policy in the next exercise and restore
it there.

[Next: Exercise 4.6 — Allow a service and retest →](/module4/allow-grok.md)
