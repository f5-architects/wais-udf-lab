# Exercise 5.3 — Verify the resulting activity

**Goal:** Generate a request that should match your categorization test and confirm
the resulting event reflects the category and action you configured.

**Prerequisites:** You completed
[Exercise 5.2](/module5/configure-categorization.md) (and categorization
configuration is supported in your tenant).

**Steps**

1. From the Windows client, send a synthetic prompt crafted to fall into the
   category you configured. Include a unique marker:

   ```text
   Lab categorization test WAIS-LAB-CAT-05. [Include harmless content that fits the category you configured.]
   ```

2. In **User Activity**, open the new event (identify it by timestamp, your test
   identity, and the marker).

3. Confirm the event shows the expected **category** signal and the **action** you
   configured in [Exercise 5.2](/module5/configure-categorization.md).

> **Expected result.** The new event is categorized as expected and shows the
> configured action, demonstrating categorization end to end on live traffic.

**Why it matters:** Closing the loop — configure, trigger, verify — is what turns a
feature tour into a credible demonstration.

**Reset / cleanup:**

1. Revert or delete the category rule you created in
   [Exercise 5.2](/module5/configure-categorization.md).
2. Delete any test group/policy you created for this test.
3. Confirm the default policy is unchanged.

> **Warning.** The category names, action labels, and whether a crafted prompt
> reliably lands in a given category must be verified hands-on before you rely on
> this exercise in a customer setting.

[Back to the lab overview →](/README.md)
