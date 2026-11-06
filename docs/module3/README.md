# Module 3 — Generate and Inspect Live Events

So far you have explored preloaded sample data. In this module you generate your
first **live** event from the Windows 11 client and locate it in User Activity,
confirming the interception path actually carried your traffic to WAIS.

> **Note.** This module is preserved from the current draft and will be expanded
> with new screenshots in a later iteration.

---

## Exercise 3.1 — Generate and locate a new activity event

**Goal:** Send one harmless, uniquely identifiable GenAI request from the Windows
client, then find the resulting **live** event in the console and confirm it is new
(not synthetic).

**Prerequisites:**

- The proxy path checked in [Exercise 2.2](/module2/test-proxy.md).
- You are signed in to the admin console ([Module 1](/module1/README.md)).
- A browser on the Windows client with access to a GenAI service used by the lab.

**Steps**

1. On the Windows client, open the GenAI service the lab provides in the browser.

> **Note.** Which GenAI services and sign-ins are available on the writable client
> needs confirmation. Do not assume ChatGPT / Claude / CLI credits or sign-in "just
> work." If a service is signed out or out of credits, see the recovery notes below
> and [Troubleshooting](/appendix/troubleshooting.md).

2. Send a **baseline** prompt — harmless, no sensitive content — with a unique
   marker so you can find it later:

   ```text
   Lab baseline test WAIS-LAB-BASELINE-7F3. Please reply with a one-sentence fun fact about lighthouses.
   ```

3. Return to the admin console's **User Activity** view and refresh.

4. Find your new event. Identify it by:
   - A **timestamp** at (or just after) the moment you sent the prompt.
   - The **session identity** configured on the Windows client.
   - The unique marker text, if the view lets you search content.

> **Expected result.** A new activity event appears that matches your prompt's
> timing and identity — proving the interception path carried your live traffic to
> WAIS. This is distinct from the timestamp-adjusted, statically preloaded records.

**Why it matters:** This is the first result in the lab that actually demonstrates
**live interception**. Everything before it was exploration of sample data.

**Reset / cleanup:** None. The event stays in activity history as evidence for
later exercises. Use only the fictional marker prompts — never real personal or
customer data.

> **Tip — if no live event appears.**
> - Re-run the [Exercise 2.2](/module2/test-proxy.md) proxy check.
> - Confirm the browser is actually using the configured proxy/PAC (a different
>   profile or a VPN can bypass it).
> - Confirm the destination is a GenAI service WAIS is configured to intercept.
> - See [Troubleshooting](/appendix/troubleshooting.md).

> **Warning — if the app has no credits / is signed out.** A known lab constraint
> is that test apps can run out of credits. If the app rejects the prompt or is
> signed out, you may not generate a live event. Note it as an environment issue
> (not a WAIS failure) and use the demo-recovery guidance in the
> [Demo playbook](/demo.md).

[Next: Module 4 — Configure Policies →](/module4/README.md)
