# Exercise 2.1 — Explore User Activity and Insights

**Goal:** Learn where WAIS shows activity and how to inspect events, recognize
trends, and filter insights — before configuring any policies.

**Prerequisites:** You are signed in to the admin console
([Module 1](/module1/README.md)).

> **Note.** Screenshots show synthetic demonstration data. Values, timestamps, and
> displayed records may vary.

## Part A — User Activity

1. In the admin console, open the **User Activity** view.

![WAIS User Activity view listing activity events with identities and services.](../images/user-activity-screen.png ':size=700')

*Figure 2.1a — The User Activity view lists recent AI interactions.*

2. The tenant ships with **statically preloaded sample log data**. Its timestamps
   are adjusted so the records appear recent, which makes the lab useful
   immediately.

> **Warning.** This is preloaded sample data, not your session's traffic. The
> adjusted timestamps make the records look current, but they did **not** come
> from your current session and do **not** prove that interception, detection, or
> enforcement is working. Never tell a customer that a preloaded record
> demonstrates enforcement.

3. Once the Windows 11 (W11) lab client's interception path is working, **new live
   traffic from that machine is also added to User Activity** alongside the
   preloaded samples. You generate and locate a live event in
   [Module 3](/module3/README.md). A live event appears at the moment you send a
   prompt, uses the W11 session identity, and can contain a unique marker you
   chose.

4. Select an activity row and click the **`>`** chevron at the side of the row to
   open its details.

![Expanded details panel for a single User Activity event.](../images/user-event-details.png ':size=700')

*Figure 2.1b — The chevron on a row opens that event's details panel.*

5. Explore several records and their detail panels to learn the shape of an event.
   You do not need to change anything.

> **Try it.** Open the details for at least **two** different events and note
> **one** difference between them. No configuration changes are required.

## Part B — Observe → Insights

1. Navigate to **Observe → Insights**. Where User Activity shows individual events,
   Insights shows **patterns and summaries across activity**.

2. Start with the **Public Services** view.

![Insights Public Services view summarizing activity across public AI services.](../images/insights-public-data.png ':size=700')

*Figure 2.1c — The Public Services view summarizes usage across public AI services.*

3. Open the **Transactions** view.

![Insights Transactions view showing activity as transactions.](../images/insights-transactions.png ':size=700')

*Figure 2.1d — The Transactions view shows activity as a set of transactions.*

4. Open the **Top Users** view.

![Insights Top Users view listing the most active identities.](../images/insights-top-users.png ':size=700')

*Figure 2.1e — The Top Users view highlights the most active identities.*

> **Warning.** Use Top Users to understand usage patterns, not to judge individual
> employees. Do not infer performance, productivity, or intent from this view.

5. Apply a filter to narrow the results.

![Insights view with a filter applied to narrow the displayed results.](../images/insights-filter.png ':size=700')

*Figure 2.1f — Apply a filter to focus Insights on a subset of activity.* Select
an available filter, observe how the results change, then **clear or reset** the
filter.

> **Try it.** Compare **two** Insights views, apply a **filter**, then restore the
> default (unfiltered) view.

## Close the exercise

> **Expected result.** You can navigate User Activity, expand an event with the
> `>` chevron, open Insights, compare the Public Services, Transactions, and Top
> Users views, and apply then clear a filter.

**Why it matters:** Event details explain individual interactions; Insights help
you communicate the broader usage picture. This is the basic UI tour before you
create or change any policies.

**Reset / cleanup:** Clear any Insights filters you applied. No policy or tenant
configuration should have changed — this exercise is read-only.

## Known Issue — Messages Tab Permissions

Now that you have explored the admin panel, enable one permission you will need
later in the lab. On newly provisioned tenants, the **Initial Tenant Owner** account
may be created **without** the **View User Conversation Data** permission enabled. If
that permission is missing, the **Messages** tab is not accessible, and later
exercises that inspect conversation content will not work as described.

> **Note.** This is a known **WAIS platform** issue, **not** a problem with the lab
> deployment or your tenant. It has been reported to engineering. The steps below are
> a **temporary workaround** and may be removed once the platform behavior is
> corrected.

**Steps — enable the permission**

1. In the WAIS admin panel, navigate to **Users & Groups → Admin**.
2. Locate your administrator (Initial Tenant Owner) account.
3. Select **Edit user**.
4. Under **View Permissions**, enable **View User Conversation Data**.
5. **Save** the changes.
6. Return to the interface and confirm that the **Messages** tab is now accessible.

> **Expected result.** The **View User Conversation Data** permission is enabled for
> your administrator account, and the **Messages** tab is accessible for the
> exercises that follow.

[Next: Exercise 2.2 — Test the Proxy →](/module2/test-proxy.md)
