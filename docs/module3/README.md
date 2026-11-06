# Module 3 — Generate and Inspect Live Events

So far you have explored preloaded sample data. In this module you generate your
first **live** events from the Windows 11 client, find them in User Activity, and
watch WAIS redact sensitive content in real time.

---

## Exercise 3.1 — Generate a simple ChatGPT request

**Goal:** Send one harmless request from the Windows client and confirm it completes,
so you have known live traffic to find in WAIS.

**Prerequisites:**

- The proxy path and certificate checked in [Exercise 2.2](/module2/test-proxy.md).
- You are signed in to the admin console ([Module 1](/module1/README.md)).

**Steps**

1. From Chrome **inside the Windows 11 RDP session**, open ChatGPT as supported by
   the lab.

2. Send a short, harmless prompt. A simple sample:

   ```text
   Lab test WAIS-LAB-CHAT-01. Share a one-sentence fun fact about lighthouses.
   ```

   ![Entering a simple, harmless test request in ChatGPT from the Windows client.](../images/simple-chatgpt-test.png ':size=650')

   *Figure 3.1a — A simple harmless ChatGPT test request from the W11 browser.*

3. Send the request and wait for the reply.

   ![ChatGPT returning a successful response to the harmless test request.](../images/chatgpt-success.png ':size=650')

   *Figure 3.1b — ChatGPT returns a normal response; the request completed.*

> **Expected result.** ChatGPT returns a normal answer to the harmless prompt. The
> request has now passed through the WAIS proxy path and should appear in User
> Activity (next exercise).

> **Note.** This step assumes the lab's ChatGPT access is signed in and usable. Do
> not assume a ChatGPT account, model access, or free quota is universally available;
> if the app is signed out or out of credits, see the recovery tip at the end of this
> module and [Troubleshooting](/appendix/troubleshooting.md).

**Why it matters:** A known-good, harmless request gives you a specific event to look
for when you confirm live logging in the next exercise.

**Reset / cleanup:** None.

---

## Exercise 3.2 — Verify your activity in WAIS

**Goal:** Find the live event your ChatGPT request produced, and confirm it is new
(not timestamp-adjusted sample data).

**Prerequisites:** You completed [Exercise 3.1](/module3/README.md).

**Steps**

1. In the admin console, open **User Activity**.

   ![The new ChatGPT request appearing as a live event in WAIS User Activity.](../images/user-activity-logged.png ':size=700')

   *Figure 3.2 — Your live ChatGPT request appears in User Activity.*

2. Find the new event by its **recent time**, the **application** (ChatGPT), and the
   **username / identity assigned to your W11 lab session**.

> **Note — which identity to look for.** The traffic identity for your live events is
> the **session identity configured on the Windows 11 client**, which may differ from
> the account you used to sign in to the admin console. Match it to the identity your
> lab provisioning displays for this deployment.

3. Distinguish this new event from the **statically preloaded sample data**: the
   sample records have adjusted timestamps to look recent, but your live event appears
   at (or just after) the moment you sent the prompt and carries your session identity.

> **Expected result.** A new event associated with your W11 session appears in User
> Activity, matching the request you just sent.

**Why it matters:** This is the first point in the lab that proves **live
interception and logging** — not just a configured path.

**Reset / cleanup:** None. The event remains as history.

---

## Exercise 3.3 — Demonstrate real-time redaction

**Goal:** Send a synthetic marketing brief that contains sensitive content and watch
WAIS redact it in real time, then inspect the resulting event's classification and
violations.

**Prerequisites:** You completed [Exercise 3.2](/module3/README.md).

> **Note.** The sample below is **fictional demonstration content**, not customer
> data. All names, emails, numbers, and figures are made up to exercise WAIS content
> controls.

**Steps**

1. Use the exact synthetic sample text. Copy it from the block below, or download the
   file: <a href="../examples/simple-redaction.txt" download target="_blank">simple-redaction.txt</a>.

   ```text
   SYNTHETIC DEMONSTRATION CONTENT — NOT REAL DATA.
   All names, emails, phone numbers, and figures below are fictional and exist only
   to exercise WAIS content controls in the lab. Do not use real customer data.

   Create a campaign brief for my customer contact to help launch a new athletic
   clothing line.

   Primary contact:
     Jordan Rivera
     jordan.rivera@example.com
     +1-406-555-0147

   Campaign brief: "Horizon Threads" global launch

   Product: New sustainable streetwear collection
   Target audience: Gen Z and Millennial shoppers (ages 18-35)
   Campaign duration: 3 months
   Budget: USD 2,500,000 (CONFIDENTIAL — internal only, do not distribute)

   Campaign objective
   Launch the eco-conscious streetwear line across 15 markets, targeting a 25%
   increase in brand awareness and 40% of Q4 revenue from this collection.

   Key messages
   - "Style meets sustainability"
   - "Wear your values"
   - Hashtag: #HorizonThreads

   Notes
   - Draft contract terms reference our standard licensing agreement; reuse of the
     "Horizon" brand mark is governed by the attached (proprietary) license.
   - Include the confidential pricing table from the internal planning deck.
   ```

2. From the Windows browser, paste the text into ChatGPT and send it.

3. Observe the response. With sensitive-data controls applied (Allow - Protect),
   WAIS **redacts** the flagged content in real time rather than passing it through
   unchanged.

   <!-- TODO(optional image): a screenshot of the redacted browser response was not
   supplied. Add one here if it materially improves the guide. -->

4. In the admin console, open **User Activity** and open the event for this request.

   ![The redaction event in User Activity showing the classification, Redact action, and triggered violations.](../images/activity-redacted.png ':size=700')

   *Figure 3.3 — The event for the brief shows the classification intent, the Redact
   action, and the triggered violations.*

5. Read the event fields shown for this request:
   - **Classification intent:** Marketing
   - **Enforcement action:** Redact
   - **Violations:** PII, Confidential, Risk, and License

> **Expected result.** The brief's sensitive content is redacted in the response, and
> the User Activity event records a **Marketing** classification, a **Redact** action,
> and the **PII / Confidential / Risk / License** violations.

**Understanding the fields (plain language)**

- **Classification** describes *the type of request* — here, a Marketing brief.
- **Violations** are the *controls that triggered* — PII (the contact details),
  Confidential (the internal budget/pricing), Risk, and License (the proprietary
  licensing reference).
- **Redact** is the *enforcement action* that was applied as a result.

> **Note.** Classification, violations, and action are distinct ideas. This example
> shows one combination; do not assume every test yields exactly these categories, and
> this guide does not assert a fixed rule precedence between them.

**Why it matters:** This is the lab's clearest demonstration of WAIS protecting
sensitive data **in real time**, with an auditable record of what was detected and
what action was taken.

**Reset / cleanup:** None — you did not change any policy. The event remains as
history. Use only the synthetic sample text, never real data.

> **Tip — if the app has no credits or no event appears.** Re-check the
> [Exercise 2.2](/module2/test-proxy.md) proxy/certificate checks, confirm the browser
> uses the configured proxy, and confirm ChatGPT is signed in and has quota. See the
> [Demo playbook](/demo.md) recovery notes and
> [Troubleshooting](/appendix/troubleshooting.md).

[Next: Module 4 — Configure Policies →](/module4/README.md)
