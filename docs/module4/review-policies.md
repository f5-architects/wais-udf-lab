# Exercise 4.1 — Review existing policies safely

**Goal:** Review how policy is structured in your tenant — the default baseline and
any group policies — **without changing anything**.

**Prerequisites:** You are signed in to the admin console
([Module 1](/module1/README.md)).

**Steps**

1. Open the **policy** area of the console.
2. Locate the **default policy** (the baseline applied to everyone).
3. Note any **group policies** and what each one grants or restricts.
4. Open one policy to see the controls it configures (for example public-service
   access, content controls, and PII handling), but **do not edit or save**.

> **Expected result.** You can describe, at a high level, what the default policy
> does and whether any group policies exist.

**Why it matters:** Understanding the baseline before you add anything is what lets
you create an isolated test policy whose effect you can clearly attribute.

**Reset / cleanup:** None. This exercise is read-only.

> **Warning.** Never edit the default / organization policy in the main lab path.
> Changing the baseline affects every identity and can invalidate the rest of the
> lab or a later customer demo. In
> [Exercise 4.2](/module4/create-policy.md) you create a *separate, isolated* policy
> instead.

> **Tip — policy model (for context).** WAIS generally applies least-privilege: a
> default policy sets the baseline, and group policies are additive for specific
> populations. The exact menu names, the policy editor layout, and how
> **precedence** resolves overlapping rules must be confirmed in your writable
> tenant's current UI before you rely on them.

[Next: Exercise 4.2 — Create an isolated test policy →](/module4/create-policy.md)
