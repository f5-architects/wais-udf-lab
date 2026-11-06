# Exercise 4.6 — Allow a service and retest

**Goal:** Move **Grok** into **Allowed Services**, save the change, and retest to see
the blocked service become reachable — then restore the original blocked state.

**Prerequisites:** You completed [Exercise 4.5](/module4/block-redirect.md).

> **Warning — this changes the tenant's Default Policy.** This exercise edits the
> Default Policy's Allowed Services for **this** tenant. That is safe here because the
> deployment is an **ephemeral, dedicated tenant**: the change affects no one else, and
> the whole tenant is removed within about 5 minutes after the deployment stops. **Do
> not** perform this against a shared or production org. Complete the reset step at the
> end to return the tenant to its starting state.

**Steps**

1. Return to **Workforce Security → Default Policy** and move **Grok** into the
   **Allowed Services** list (Service Access Control).

   ![Adding Grok to the Allowed Services list.](../images/add-grok.png ':size=700')

   *Figure 4.6a — Move Grok into Allowed Services.*

2. Select **Save**.

   ![Selecting Save to apply the policy change.](../images/click-save.png ':size=650')

   *Figure 4.6b — Save the policy change.*

3. Confirm the change was saved.

   ![Confirmation that the policy change was saved.](../images/saved.png ':size=650')

   *Figure 4.6c — The policy change is saved.*

4. From the Windows browser, retry **Try for free** at `https://x.ai`.

5. Observe the allowed result — Grok is now reachable instead of blocked/redirected.

   ![Grok reachable after being added to Allowed Services.](../images/grok-allowed.png ':size=650')

   *Figure 4.6d — With Grok allowed, the service now loads.*

> **Expected result.** After saving, the same request that was blocked and redirected
> in Exercise 4.5 now reaches Grok — demonstrating that service access is controlled by
> policy and updates take effect after you save.

**Blocked vs. allowed — what changed:** The only difference is the policy. In 4.5 Grok
was absent from Allowed Services, so the Default Service Action blocked it and applied
the Service Block Action (redirect to Copilot). Here Grok is in Allowed Services, so
the same request is permitted.

**Reset / cleanup (required):**

1. Return to **Workforce Security → Default Policy** and **remove Grok** from Allowed
   Services, restoring the original blocked state.
2. Select **Save**.
3. Re-run **Try for free** at `https://x.ai` and verify the original blocked /
   redirected behavior returns.

> **Note.** If you cannot safely restore the state, remember the tenant is ephemeral —
> it is removed within about 5 minutes after the deployment stops, so the change does
> not persist beyond this deployment. Still, restoring keeps the lab repeatable for a
> back-to-back demo.

[Next: Module 5 — Categorization →](/module5/README.md)
