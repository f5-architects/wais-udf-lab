# Exercise 4.4 — Explore the Default Policy

**Goal:** Tour the **Default Policy** and understand the service action modes and the
block-response choices, before changing anything.

**Prerequisites:** You are signed in to the admin console
([Module 1](/module1/README.md)).

> **Ephemeral tenant.** This deployment is a dedicated tenant for you alone. Exploring
> and (in 4.5–4.6) changing its Default Policy affects no one else, and the tenant is
> removed within about 5 minutes after the deployment stops.

**Steps**

1. Navigate to **Workforce Security → Default Policy**.

   ![The WAIS Default Policy page.](../images/default-policy.png ':size=700')

   *Figure 4.4a — The Default Policy page.*

2. Note the **Default Service Action**. In this lab's starting configuration it is set
   to **Allow - Protect**.

3. Open the Default Service Action choices.

   ![The Default Service Action choices: Allow - Monitor, Allow - Protect, and Block.](../images/action-choices.png ':size=600')

   *Figure 4.4b — The three Default Service Action modes.*

The three modes behave as follows:

- **Allow - Monitor:** Requests to known services are allowed, the Allowed Services
  list is ignored, and sensitive-data controls are set to **Monitor**.
- **Allow - Protect:** Requests to known services are allowed, the Allowed Services
  list is ignored, and sensitive-data controls are **applied** (enforced).
- **Block:** Known services are **blocked by default** unless explicitly allowed
  through **Service Access Control**; the response to blocked traffic is set by the
  **Service Block Action**.

> **Note.** **Block** does **not** mean "all AI is forbidden." Approved services can
> still be allowed individually through Service Access Control.

4. Review the **Service Block Action** — how blocked traffic is handled. The observed
   choices are:
   - **Redirect to a configured URL** (for example, a sanctioned AI service such as
     Microsoft Copilot).
   - **Redirect to `portal.surepath.ai`** (the WAIS end-user portal).
   - **Display the no-access page.**

> **Note.** `portal.surepath.ai` is a literal product URL and is preserved exactly;
> the product name in prose remains WAIS.

5. Review the blocked / allowed services under Service Access Control.

   <!-- TODO(image): service-block.png was not supplied with this pass. When provided,
   add it here to show the blocked-services list:
   ![Blocked services under Service Access Control.](../images/service-block.png ':size=700') -->

> **Expected result.** You can state the current Default Service Action
> (**Allow - Protect**), describe the three modes, and name the three block-response
> choices.

**Why it matters:** Knowing the modes and block responses is the foundation for the
blocking/redirect/allow demonstration in the next two exercises.

**Reset / cleanup:** None — this is a guided tour. **Do not change the Default Service
Action mode just to view the menu.** You make a deliberate, reversible service change
in 4.5–4.6.

[Next: Exercise 4.5 — Demonstrate blocking and redirection →](/module4/block-redirect.md)
