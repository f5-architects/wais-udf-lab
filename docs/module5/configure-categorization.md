# Exercise 5.2 — Configure a controlled categorization test

**Goal:** If your tenant supports it, configure or modify a category rule in an
**isolated** way so you can observe categorization affecting an outcome.

**Prerequisites:**

- You reviewed categories ([Exercise 5.1](/module5/review-categories.md)).
- You have an isolated test identity (as in [Module 4](/module4/README.md)).

**Steps**

1. Determine whether your tenant allows creating or modifying a **category rule**
   (as opposed to only viewing categories).

   > **Warning.** Whether category rules can be created/edited in the writable
   > tenant, and the exact steps to do so, are **unconfirmed**. Do not invent a
   > click path. If the feature is not available, skip to the "If not supported"
   > note below and record the finding in the
   > [validation checklist](/appendix/validation.md).

2. If supported, create or modify a rule that maps a specific, easily triggered
   category to a **safe, observable action** (prefer monitor/warn), scoped to your
   test identity only — not the default policy.

3. Save the change and note exactly what you configured.

> **Expected result.** Either a category rule is configured in an isolated way, or
> you have confirmed the feature is not available and recorded that in the
> validation checklist.

**Why it matters:** Categorization is a differentiator worth demonstrating, but only
if the feature and its click path are real in this tenant. Verifying availability
prevents a failed live demo.

**Reset / cleanup:** If you created or modified a rule, revert/delete it after
[Exercise 5.3](/module5/verify-categorization.md) so the tenant returns to its
starting state. Do not leave category changes on the default policy.

> **Tip — if categorization configuration is not supported.** Treat categorization
> as **inspection-only** for now: use [Exercise 5.1](/module5/review-categories.md)
> to show category signals on existing events, and note in the
> [validation checklist](/appendix/validation.md) that hands-on category
> configuration could not be confirmed. Do not present an unverified categorization
> workflow to a customer.

[Next: Exercise 5.3 — Verify the resulting activity →](/module5/verify-categorization.md)
