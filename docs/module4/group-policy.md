# Exercise 4.7 — Group-Based Policy: Baseline Plus Approved Exceptions

> **Optional / advanced.** This exercise extends Module 4 after the Default Policy
> tour and the Grok exercises. Complete [Exercise 4.4](/module4/default-policy.md)
> through [Exercise 4.6](/module4/allow-grok.md) before starting here.

**Goal:** Create a lab-only group and group policy that grants access to a service
beyond the Default Policy baseline, verify the effective policy on a user, generate
a request, and confirm the outcome in User Activity and Audit Logs.

**Customer problem:** "Can our Engineering team use a tool that the baseline restricts,
while the rest of the organization stays on the stricter default?"

**Prerequisites:**

- Signed in to the admin console with an **admin or owner role**.
- Completed [Exercise 4.4](/module4/default-policy.md) (Default Policy tour).
- Working interception path from [Module 2](/module2/test-proxy.md).

---

## Background: how Default Policy and group policies relate

Before configuring anything, understand the design — it determines what is and is not
possible:

- **The Default Policy applies to everyone.** It is the strictest state the
  organization is willing to accept.
- **Group policies are additive.** They can only grant access or loosen restriction
  — they cannot tighten it. A control that is off in the Default cannot be turned
  back on by a group.
- **One important exception — the Service Block List concatenates.** A service on
  the Default's block list is blocked for everyone, and adding it to a group's allow
  list does not rescue it. *"If a service appears in both the block list and the
  allowed services list, the block takes precedence."*

> **The practical implication for this exercise:** You cannot use a group policy to
> allow a service that the Default Policy explicitly blocks. The working design for
> "Engineering can use X that others cannot" is:
> 1. Keep X **off** the Default block list (or in a neutral / unset state).
> 2. Set the Default action to **Block** (the whole posture).
> 3. Add X to the group policy's allow list for Engineering.
>
> In this lab the Default Policy is set to **Allow - Monitor** (the out-of-the-box
> posture), which means the block list governs exceptions. Use a service that is on
> the **Default block list** as the controlled example — the group policy will not
> override that block. Instead, choose a service that is **not** on the Default block
> list to demonstrate the group-allow pattern.

> **If your tenant's Default Policy currently has Grok on the block list** (from
> Exercise 4.5), use a **different** service for this exercise so the block-overrides-
> allow rule does not interfere. If Grok was reset and is no longer blocked, it is a
> usable example.

---

## Step 1 — Design the scenario

Before touching the console, write down your planned configuration:

```text
Service to demonstrate: [Choose a service not on the Default block list]
Group name:             Lab-Engineering-Test
Group policy name:      Lab - Engineering Allow
Test identity:          [The lab identity in your tenant, usually from synthetic data]
Action to grant:        Allow (or the specific service-allow behavior available)
```

> **Note on test identities.** In this writable tenant the user population is seeded
> with synthetic identities. If the tenant only has one seeded identity, you can still
> build and inspect the group and policy, but assigning the identity to the group and
> generating scoped traffic may not be possible. If assignment is not supported or the
> identity roster is empty, complete Steps 2–4 as a **read-only inspection** exercise
> and record the limitation in the validation checklist.

---

## Step 2 — Create a group and group policy

1. Open **Users & Groups → Groups** and create a new group.

> **Screenshot needed:** `docs/images/group-policy-create.png` — the Create Group or
> New Group Policy form with the lab group name entered; use `Lab-Engineering-Test`
> exactly.

2. Name the group `Lab-Engineering-Test`. Add a description such as
   `Lab only — delete after exercise`.

3. If the UI allows it, assign your test identity to the group at creation time.
   If assignment is a separate step, complete Step 3 first.

4. Navigate to **Workforce Security → Group Policies** and create a new group policy.

   | Field | Value |
   |---|---|
   | **Name** | `Lab - Engineering Allow` |
   | **Group** | `Lab-Engineering-Test` |

5. In the new group policy's **Services** tab, add your chosen service to the
   **Allowed Services** list.

6. Save the group policy.

> **Expected result.** A group named `Lab-Engineering-Test` and a group policy named
> `Lab - Engineering Allow` both exist. The group policy allows the chosen service.

---

## Step 3 — Assign the test identity to the group

> This step may already be done if the UI combined group creation and membership in
> Step 2.

1. Open **Users & Groups → End Users** and find your test identity.

> **Screenshot needed:** `docs/images/group-policy-assignment.png` — the End User
> record or Group membership screen showing the test identity assigned to
> `Lab-Engineering-Test`.

2. Add the test identity to `Lab-Engineering-Test`.

3. Save.

> **Expected result.** The test identity is a member of `Lab-Engineering-Test`.

---

## Step 4 — Inspect the effective policy

This is the step customers ask about first: *"Can I see what a specific person is
actually governed by?"*

1. Open **Users & Groups → End Users** and open your test identity's record.

2. Scroll to the **Policies** section (the name and location of this section need
   hands-on confirmation — it may appear as a **Policies** tab or as a summary
   within the user record).

> **Screenshot needed:** `docs/images/end-user-effective-policy.png` — the End User
> record's Policies section or tab showing the Default Policy plus the
> `Lab - Engineering Allow` group policy, and the resulting allowed service visible;
> redact any identity fields.

3. Confirm the effective policy includes:
   - The Default Policy (baseline)
   - `Lab - Engineering Allow` (group addition)
   - The chosen service listed as allowed

> **Note.** The assembled effective policy is never stored — WAIS builds it at
> request time by folding each applicable group policy into the Default. What you see
> in the End User record is a snapshot of the current state, not a saved document.

> **Expected result.** The user's effective policy shows the chosen service as allowed,
> even if the Default Policy alone does not explicitly allow it.

---

## Step 5 — Generate a request and inspect the event

1. From the Windows client, send a request to the service you added to the group
   policy. Include a unique marker so you can find the event:

   ```text
   WAIS-LAB-GP-47 Testing group policy access to [service name]. This is a lab test.
   ```

2. Open **Observe → User Activity** and find the new event by marker or timestamp.

> **Screenshot needed:** `docs/images/group-policy-activity.png` — User Activity event
> for the lab test prompt, showing the allowed decision and the correct service; redact
> identity fields.

3. Open the event detail. Confirm:
   - **Service** matches your chosen service.
   - **Decision** is `INTERCEPT` (allowed through) — not `BLOCK`.
   - **Identity** matches your test identity.

> **Expected result.** The event shows `INTERCEPT`, proving the group policy granted
> access that the Default Policy alone would not have provided under a Block posture.

> **Note on the current Default Policy posture.** If the Default Policy is still set to
> `Allow - Monitor` (the out-of-the-box state), every service is allowed by default
> unless explicitly blocked. In that case, the group policy allow is not strictly
> required for the request to go through — but creating the group and policy, assigning
> the user, and verifying the effective policy still demonstrates the full workflow.
> To make the group allow meaningful in a live demo, temporarily set the Default
> Service Action to **Block** and then show the group allow rescuing the specific
> service. If you do this, **reset the Default Policy action immediately after**.

---

## Step 6 — Review Audit Logs for the administrative change

1. Open **Observe → Audit Logs**.

> **Screenshot needed:** `docs/images/policy-change-audit-log.png` — the Audit Logs
> view showing an administrative event for the group or group policy creation
> performed in this exercise; highlight the event type and actor column.

2. Filter by action type or by the timeframe of your changes.

3. Locate the event for creating `Lab-Engineering-Test` or `Lab - Engineering Allow`.

4. Note the distinction: Audit Log events are **administrative actions** (what admins
   changed), not **user activity** (what employees sent). These are different screens
   with different purposes.

> | | What it records |
> |---|---|
> | **User Activity** | Employee AI requests and their outcomes |
> | **Audit Logs** | Admin changes to configuration, policy, groups, and users |

> **Expected result.** You can locate the administrative event for the group and policy
> you created, and explain to a customer the difference between User Activity and
> Audit Logs.

> **Note.** Exact Audit Log event types and field names need hands-on confirmation.
> Record any discrepancies in the [validation checklist](/appendix/validation.md).

---

## Where to see the evidence

| Evidence type | Where to find it |
|---|---|
| Group membership | Users & Groups → Groups → group record |
| Effective policy per user | Users & Groups → End Users → user record → Policies section |
| Request outcome | Observe → User Activity → `>` detail panel |
| Administrative change record | Observe → Audit Logs |

---

## Customer talk track

> "The Default Policy is your organizational floor — the strictest posture you're
> comfortable with for the whole company. Group policies are additive: they open things
> up for specific teams, they never tighten. So if Engineering needs access to a tool
> that the baseline restricts, you don't weaken the baseline; you give Engineering
> their own group policy that allows it. The effective policy for each person is
> assembled at request time — you can inspect it right here on the user record and
> confirm exactly what they can and can't do before anything is enforced."
>
> Important qualification to deliver:
> "One thing that runs the other way: the block list concatenates. If a service is on
> the Default block list, a group allow will not override it. That is by design —
> there's always a floor the whole org is held to."

---

## Reset / cleanup (required)

1. Open **Users & Groups → End Users**, find your test identity, and **remove** it
   from `Lab-Engineering-Test`.
2. Open **Workforce Security → Group Policies** and **delete** `Lab - Engineering
   Allow`.
3. Open **Users & Groups → Groups** and **delete** `Lab-Engineering-Test`.
4. If you changed the Default Service Action in Step 5, return it to its original
   value and save.
5. Confirm User Activity shows no unexpected blocked or restricted events for your
   test identity after reset.

> **Warning.** Do not leave a lab group or group policy in place. Even in this
> ephemeral tenant it will add noise to any subsequent demo run.

---

[Back to Module 4 overview →](/module4/README.md)
