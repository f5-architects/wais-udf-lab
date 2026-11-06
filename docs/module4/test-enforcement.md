# Exercise 4.3 — Test and inspect enforcement

**Goal:** Send a baseline request and then a request designed to match your
isolated policy, and compare the two activity events to see the control take effect.

**Prerequisites:**

- Your isolated test policy from [Exercise 4.2](/module4/create-policy.md) is saved.
- You can send prompts from the Windows client as your test identity.

**Steps**

1. **Baseline.** From the Windows client, send a harmless prompt that should **not**
   match your new control:

   ```text
   Lab policy baseline WAIS-LAB-POL-BASE-22. Please reply with a one-sentence fun fact about rivers.
   ```

2. **Matching test.** Send a prompt crafted to **match** the control you configured
   (for example, containing the content category or a fictional PII entity you set
   to mask). Keep it synthetic and harmless. Example for a mask test on an email
   entity:

   ```text
   Lab policy match WAIS-LAB-POL-MATCH-22. Draft a reply to jordan.fictional@example.com about the lighthouse newsletter.
   ```

   > **Note.** Use only **fictional** identities and **synthetic** content.
   > `example.com` addresses and made-up names are safe. Never use real customer
   > data to trigger a policy.

3. In the console's **User Activity**, open both new events (identify them by
   timestamp, your test identity, and the unique markers).

4. Compare them: the baseline event should show no policy action from your test
   control; the matching event should show the action you configured (monitor,
   warn, mask, or block).

> **Expected result.** The matching event shows your configured control's outcome
> while the baseline event does not — demonstrating that your isolated policy
> enforced as intended on live traffic.

**Why it matters:** A side-by-side baseline-vs-match comparison is the cleanest way
to prove enforcement, both for your own learning and in front of a customer.

**Reset / cleanup:**

1. Delete the **isolated test policy** (and test group) you created in
   [Exercise 4.2](/module4/create-policy.md).
2. Confirm the default policy was never modified.
3. The test activity events can remain as history.

> **Warning.** Whether a given control reliably triggers on a crafted prompt, and
> exactly how the outcome is labeled in the event, must be verified hands-on. If the
> matching event does not show the expected action, re-check the policy scope (your
> identity), the control configuration, and that the live request actually went
> through the proxy ([Exercise 2.2](/module2/test-proxy.md)).

[Next: Exercise 4.4 — Explore the Default Policy →](/module4/default-policy.md)
