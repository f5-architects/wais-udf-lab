# Exercise 4.2 — Create an isolated test policy

**Goal:** Create a new, **isolated** policy (and, if required, a test group) that
applies only to your test identity, with a safe, non-destructive action.

**Prerequisites:**

- You reviewed existing policy ([Exercise 4.1](/module4/review-policies.md)).
- You know the **session identity** used by your Windows client
  ([Module 3](/module3/README.md)).

**Steps**

1. In the policy area, create a **new group policy** (do not edit the default).

   > **Note.** The exact steps to create a policy and scope it to a single
   > identity/group need confirmation in the current UI. Record the real click path
   > during your run and update this exercise.

2. Scope it to **only your test identity** (or a test group that contains only your
   test identity). This keeps the blast radius to your own traffic.

3. Configure one **clear, safe** control you can observe. Prefer a non-blocking
   action first so you do not disrupt the environment, for example:
   - A **monitor** or **warn** action on a specific content category, or
   - A **mask** action on a specific PII entity.

   Choose a control whose effect is easy to trigger with a crafted prompt in
   [Exercise 4.3](/module4/test-enforcement.md).

4. Save the new policy.

> **Expected result.** A new policy exists, scoped only to your test identity, with
> one safe, observable control configured. The default policy is unchanged.

**Why it matters:** An isolated policy lets you demonstrate enforcement cleanly and
reversibly — essential for a repeatable customer demo.

**Reset / cleanup:** Remember what you created. In
[Exercise 4.3](/module4/test-enforcement.md) (and the demo reset) you will **delete
this test policy / group** to return the tenant to its starting state.

> **Warning.** Start with a **non-blocking** action (monitor/warn/mask) before
> trying a block, so an unexpected result does not lock you out of a service
> mid-lab. Only use a block action once you can reliably produce and observe the
> non-blocking case.

[Next: Exercise 4.3 — Test and inspect enforcement →](/module4/test-enforcement.md)
