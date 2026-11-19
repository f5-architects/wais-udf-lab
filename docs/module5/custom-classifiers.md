# Exercise 5.4 — Custom Classifiers: Protect Business Context, Not Just Known PII

> **Optional / advanced.** This exercise expands on the existing Categorization
> module. It introduces Custom Intent and Custom Entity classifiers using a fictional
> acquisition scenario. Steps requiring hands-on UI verification are flagged — do not
> present unverified click paths to a customer.

**Goal:** Create a lab-only Custom Intent classifier that detects a fictional
confidential subject across paraphrased prompts, attach a safe monitor action, generate
test traffic, and verify the classifier finding in User Activity.

**Customer problem:** "Can WAIS detect if someone is discussing a confidential business
topic even when they don't use the exact project name or keywords?"

**Prerequisites:**

- Signed in to the admin console with an **admin or owner role**.
- You have a working interception path from [Module 2](/module2/test-proxy.md) and
  [Module 3](/module3/README.md).
- You have completed [Exercise 5.1 — Review categories](/module5/review-categories.md).

> **Important — scope.** This exercise makes changes to the **Classifiers** list and
> the **Default Policy Classifiers tab**. At the end, you will reset both. Changes to
> the Default Policy affect everyone in the tenant, which is safe here because the
> tenant is ephemeral and dedicated to you. Reset before ending the lab.

---

## Background: two kinds of classifier, two jobs

Before configuring anything, understand the distinction — it determines whether
detection is enforceable:

| Classifier type | How it matches | Enforcement |
|---|---|---|
| **Built-in Intent Taxonomy** (Domains, Actions, Topics) | WAIS-maintained; classifies every request automatically | **Reporting only** — no policy action can be attached |
| **Custom Intent** | Semantic similarity to your example prompts | **Enforceable** — but only once you attach an action in policy |
| **Custom Entity** | Regular-expression pattern match | **Enforceable** — but only once you attach an action in policy |

> **Key principle:** Authoring a classifier and enforcing on it are two separate steps.
> A classifier with no policy action does nothing — it will not appear as a violation
> and will not change any decision.

---

## Step 1 — Inspect existing classifiers

1. Open **Detection → Classifiers** (or the equivalent current navigation path in your
   tenant).

> **Screenshot needed:** `docs/images/custom-intent-list.png` — the Classifiers list
> view showing existing custom intents and/or custom entities; redact any real
> customer-specific classifier names if visible.

2. Note how many Custom Intent and Custom Entity classifiers already exist in this
   tenant. Record this count — you will confirm it is restored in the reset step.

3. Open the **Default Policy** (Workforce Security → Default Policy) and select the
   **Classifiers** tab.

4. Note the current state of **Intent Topic Controls** and **Custom Entity Controls**.
   Record any actions that are already configured — you will restore them.

> **Expected result.** You have a baseline record of existing classifiers and their
> current policy actions, so the reset can be exact.

---

## Step 2 — Create a Custom Intent classifier

The fictional scenario: your customer has a confidential acquisition called
**Project Lighthouse**, also internally referred to as **Northstar Analytics**. They
need to detect when employees discuss it with public AI services, even in paraphrase.

1. From the Classifiers screen, create a **New Custom Intent**.

> **Screenshot needed:** `docs/images/custom-intent-create.png` — the Create Custom
> Intent dialog or form, showing the name field and example-prompts area; use the
> fictional Project Lighthouse content exactly.

2. Set the following values:

   | Field | Value |
   |---|---|
   | **Name** | `Lab - Project Lighthouse` |
   | **Description** | `Lab-only: fictional confidential acquisition scenario` |

3. Add the following example prompts. These train the semantic matcher — the more
   varied the phrasing, the broader the coverage.

> **Screenshot needed:** `docs/images/custom-intent-examples.png` — the example
> prompts field with the five fictional prompts entered below; no real data.

   Enter each prompt on its own line:

   ```text
   What's the latest on the Project Lighthouse acquisition?
   ```

   ```text
   Has anyone talked to the Northstar Analytics team about the deal timeline?
   ```

   ```text
   Can you draft a message to our investment banker about the target company?
   ```

   ```text
   What valuation range is typical for a mid-market SaaS acquisition like ours?
   ```

   ```text
   I need to summarize the due diligence findings for the board presentation.
   ```

4. Save the classifier.

> **Note — no model training.** Despite any UI language suggesting otherwise, there is
> no model training run. The example prompts are converted to embeddings when you save
> and are available for matching almost immediately. A prompt is flagged when its
> meaning is close enough to your examples — which is why paraphrases match without
> sharing any keywords.

> **Expected result.** A classifier named `Lab - Project Lighthouse` appears in the
> Classifiers list.

---

## Step 3 — Attach a policy action

A classifier with no action is invisible. You must attach an action in policy before
any detection can influence a decision or appear on an event.

1. Return to **Workforce Security → Default Policy → Classifiers tab**.

2. Under **Intent Topic Controls**, find `Lab - Project Lighthouse`.

> **Screenshot needed:** `docs/images/classifier-policy-action.png` — the Default
> Policy Classifiers tab showing the Intent Topic Controls section with
> `Lab - Project Lighthouse` visible and an action being selected; prefer Monitor for
> the first test.

3. Set the action to **Monitor**.

   > **Why Monitor first?** Monitor lets the request through and records the finding
   > without alerting the user or blocking the prompt. This lets you verify the
   > classifier is firing before you apply a stronger action — the same approach you
   > would recommend to a customer starting out.

4. Save the policy.

> **Expected result.** The `Lab - Project Lighthouse` classifier has a Monitor action
> in the Default Policy. Policy changes typically take effect within seconds.

---

## Step 4 — Test with paraphrased prompts

Send the following test prompts from the Windows client, through a prompt-intercept
supported service (ChatGPT is confirmed in this lab). Each prompt uses different
wording to test semantic coverage.

Include the unique marker `WAIS-LAB-CI-54` at the start so you can find the events
easily.

**Prompt 1 — close paraphrase:**

```text
WAIS-LAB-CI-54 What's the status of the Northstar Analytics deal we've been working
on? I need to update the steering committee.
```

**Prompt 2 — indirect reference:**

```text
WAIS-LAB-CI-54 Can you help me write talking points for a board meeting about an
unannounced acquisition in the enterprise software space?
```

**Prompt 3 — no project name used:**

```text
WAIS-LAB-CI-54 What are the typical integration risks when acquiring a 200-person
SaaS company and onboarding their engineering team?
```

**Prompt 4 — negative control (should not match):**

```text
WAIS-LAB-CI-54 What is the best way to structure a weekly team standup for a
distributed engineering team?
```

> **Note — expected behavior.** Prompts 1 and 2 should match the classifier. Prompt 3
> may match (the semantic meaning is close to M&A due diligence). Prompt 4 is a
> negative control and should not match. Actual results depend on the semantic model
> in this tenant version; record what you observe rather than asserting a guaranteed
> outcome.

---

## Step 5 — Verify the classifier findings in User Activity

1. Open **Observe → User Activity** and filter by the marker `WAIS-LAB-CI-54` or by
   your test identity and approximate timestamp.

2. Open the detail panel for each of the four events.

> **Screenshot needed:** `docs/images/custom-intent-event-detail.png` — User Activity
> detail panel for one of the test events, showing the classifier finding
> (`Lab - Project Lighthouse`) and the Monitor decision; redact any identity fields.

3. For each event, record:

   | Prompt | Classifier fired? | Decision |
   |---|---|---|
   | Prompt 1 | | |
   | Prompt 2 | | |
   | Prompt 3 | | |
   | Prompt 4 (control) | | |

> **Key distinction:** A classifier **finding** is not the same as an enforcement
> **decision**. With Monitor set, the decision is `INTERCEPT` (allowed through) even
> though the classifier fired. If you later change the action to Block, the decision
> will change — the finding itself does not change.

> **Expected result.** Prompts 1 and 2 show a `Lab - Project Lighthouse` finding.
> Prompt 4 does not. The decision for all events is `INTERCEPT` because Monitor does
> not stop the request.

---

## Optional: change the action and retest

> **This step changes policy behavior during the test.** It is safe in this ephemeral
> tenant. Reset immediately after.

1. Return to **Default Policy → Classifiers → Intent Topic Controls** and change
   `Lab - Project Lighthouse` to **Block** (or the strongest available action).
2. Save the policy.
3. Resend **Prompt 1** with an updated marker:

   ```text
   WAIS-LAB-CI-54b What's the status of the Northstar Analytics deal?
   ```

4. Confirm the new event shows a `BLOCK` decision instead of `INTERCEPT`.
5. **Immediately reset** the action back to Monitor, or proceed to the full reset below.

---

## Step 6 — Custom Entity: a note on pattern-based detection

You do not need to create a Custom Entity for this exercise, but understand when to
recommend one:

> **Reach for Custom Entity when the target has a literal shape** — an internal
> ticket format like `LH-XXXX`, a deal codename used exactly as written, or an account
> number format. It is a regular expression and matches text, not meaning.
>
> **Reach for Custom Intent when the target is a subject** — anything phrased a
> hundred different ways.
>
> **Important anchor warning:** An anchored pattern (`^LH-1234$`) matches only when
> the entire prompt is exactly that string. Real prompts are sentences. Use unanchored
> patterns in Custom Entity classifiers.

> **Screenshot needed:** `docs/images/custom-entity-example.png` — the Custom Entity
> creation form showing an example pattern field with a fictional ticket-format
> pattern (e.g. `LH-\d{4}`) and no real customer data.

---

## Where to see the evidence

| Evidence type | Where to find it |
|---|---|
| Classifier list and counts | Detection → Classifiers |
| Policy actions for classifiers | Workforce Security → Default Policy → Classifiers tab |
| Classifier findings on events | Observe → User Activity → `>` detail panel → Violations section |

---

## Customer talk track

> "Custom Intent classifiers let you describe a business topic in plain language, using
> example prompts, and WAIS will flag any AI conversation that's semantically similar —
> even when users paraphrase or don't use the project name. It works because the
> examples are turned into meaning vectors, not keyword lists. What catches a customer
> off guard is that creating the classifier and enforcing on it are two separate steps:
> you author it in Classifiers, but it only acts when you attach an action in policy.
> The standard recommendation is to start with Monitor for a week so you can see how
> often it fires before you block anything."

---

## Reset / cleanup (required)

1. Open **Default Policy → Classifiers → Intent Topic Controls** and remove the
   action from `Lab - Project Lighthouse` (set to no action, or the original state
   you recorded in Step 1).
2. Save the policy.
3. Open **Detection → Classifiers** and delete the `Lab - Project Lighthouse`
   classifier.
4. Confirm the classifier count matches what you recorded in Step 1.
5. Confirm the Default Policy Classifiers tab is back to its original state.

> **Warning.** Do not leave a monitor or block action on a custom classifier in the
> Default Policy. It applies to everyone in the tenant.

---

[Back to Module 5 overview →](/module5/README.md)
