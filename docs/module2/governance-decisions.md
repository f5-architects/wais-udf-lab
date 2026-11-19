# Exercise 2.3 — From AI Visibility to Governance Decisions

> **Optional / advanced.** This exercise extends the basic Insights tour from
> [Exercise 2.1](/module2/activity-insights.md). Complete that exercise first. No
> policy changes are required here.

**Goal:** Use Insights and the Public Services catalog to build a factual picture of
AI usage in the tenant — which services are in use, for what purposes, and what the
platform can and cannot govern on each — then formulate a concrete first governance
recommendation.

**Customer problem:** "What AI services are my employees using, for what purposes, and
where is the actual exposure? I don't know where to start."

**Prerequisites:**

- Signed in to the admin console ([Module 1](/module1/README.md)).
- Completed [Exercise 2.1](/module2/activity-insights.md) (basic User Activity and
  Insights tour).

---

## Step 1 — Read the Insights summary

1. Open **Observe → Insights** and select the **Public Services** view.

> **Screenshot needed:** `docs/images/insights-service-filter.png` — Insights
> Public Services view with a service filter applied; use synthetic data and redact
> any real identifiers.

2. Note the services with the most transactions. Write down the **top two or three**
   without evaluating individual users.

3. Switch to the **Transactions** view and read the overall volume. Note any services
   with disproportionately high transaction counts.

4. Open the **Top Users** view.

> **Warning.** The Top Users view identifies individuals. Use it to understand usage
> patterns and service spread — not to evaluate individual performance, productivity,
> or intent. Do not share this view in a customer meeting without first confirming the
> customer's HR and privacy policies on employee monitoring.

5. Apply a filter — by **service** or by **date range** — and observe how the numbers
   shift.

> **Screenshot needed:** `docs/images/user-activity-governance-detail.png` — a single
> User Activity event's detail panel showing service, identity, classified intent,
> violations, and decision; redact identity fields.

6. Clear the filter before continuing.

> **Expected result.** You can read Insights at three levels (service summary,
> transaction volume, top users), apply and clear a filter, and state one factual
> observation about usage in this tenant.

---

## Step 2 — Inspect an event in context

1. Open **Observe → User Activity**.

2. Select a row for a service you identified in Step 1. Click the **`>`** chevron to
   open the detail panel.

3. In the detail panel, locate and note:

   | Field | What to look for |
   |---|---|
   | **Service** | Which AI service was used |
   | **Identity** | Who sent the request (synthetic in this tenant) |
   | **Classified intent** | The business domain and task WAIS inferred |
   | **Violations** | Any sensitive-data or classifier findings |
   | **Decision** | The gateway outcome: `INTERCEPT`, `BLOCK`, `REDACT`, etc. |

> **Note on `INTERCEPT`.** The decision value `INTERCEPT` means the request was
> **allowed through untouched** — it does not mean WAIS stopped it. `BLOCK` is the
> value that means the request was terminated. This naming surprises almost every
> customer; know it before you open this view on a call.

4. Open at least **one more** event from a different service and compare the two
   detail panels.

> **Expected result.** You can locate service, identity, classified intent,
> violations, and decision in an event detail, and explain what `INTERCEPT` actually
> means.

---

## Step 3 — Compare capabilities in the Public Services catalog

1. Open **Catalog → Public Services**.

> **Screenshot needed:** `docs/images/public-service-intercept-support.png` — the
> Public Services catalog table showing several rows with their Risk Level and
> Intercept Support columns (Request, Response, License, File Upload, MCP); crop to
> show the column headers clearly.

2. Find at least one of the services you observed in Insights. Read across its row:

   | Column | What it tells you |
   |---|---|
   | **Risk Level** | Low / Medium / High — a curated score, **not** real-time vendor intelligence |
   | **Request** | WAIS can read and act on the outgoing prompt |
   | **Response** | WAIS can read and act on the response |
   | **License** | WAIS can detect business vs. personal account tiers |
   | **File Upload** | WAIS can detect file uploads |
   | **MCP** | WAIS can govern MCP tool calls to this service |

3. Find a service that has **Request** checked but no **Response** check, or one
   that has **neither** checked (access-only). Note the difference.

4. Explain to yourself — or a colleague — what an **access-only** service means in
   practice:

> An access-only service is one where WAIS can **allow or block** the whole service
> but **cannot read the prompt or response**. WAIS *"cannot record, evaluate, or
> prevent sensitive data from being transmitted"* on an access-only service. Policy
> can still block it entirely, but sensitive-data detection, intent classification,
> and redaction are unavailable.

5. Note the catalog caveat: **Risk Level reflects the curated record at the last
   catalog sync, not live vendor posture.** Do not present it as real-time
   intelligence to a customer.

> **Expected result.** You can read a service's capability row, distinguish
> prompt-intercept from access-only services, and correctly qualify the Risk Level
> signal to a customer.

---

## Step 4 — Formulate a first governance recommendation

Based on what you observed in Steps 1–3, draft a one-paragraph recommendation you
could give a customer. Use this structure:

```text
"Based on the data, [Service A] and [Service B] are the most-used services, and both
support prompt interception — which means you have full visibility and enforcement
capability there today. [Service C] is access-only: you can allow or block it, but
you cannot inspect prompts. A good first step is to stay on Allow - Monitor for 2–4
weeks, review Insights weekly, then move to Allow - Protect and add your most
sensitive services to the block list once you understand your own usage pattern."
```

Adjust the service names and finding to match what you actually saw in the tenant.

> **Expected result.** You have a data-backed, service-specific first governance
> recommendation using only what WAIS can actually show and enforce — not marketing
> claims.

---

## Where to see the evidence

| Evidence type | Where to find it |
|---|---|
| Service usage summary | Observe → Insights → Public Services |
| Transaction volume | Observe → Insights → Transactions |
| Individual event details | Observe → User Activity → `>` chevron |
| Service capability matrix | Catalog → Public Services |

---

## Customer talk track

> "Before you change a single policy setting, WAIS already tells you which AI
> services your workforce is using, how often, and what subjects they're discussing.
> When you open the catalog, you can see exactly what WAIS can govern for each service
> — some support full prompt inspection, others are allow-or-block only. That gap is
> what tells you where to focus first. The standard approach is to monitor for a few
> weeks, let the data show you your real usage pattern, and then apply targeted
> controls based on evidence rather than guessing."

Key qualification to deliver honestly:

> "The Risk Level in the catalog is a curated score, not a live threat feed. It tells
> you what our research team found at their last review — not what changed at that
> vendor yesterday."

---

## Reset / cleanup

No policy or tenant configuration changes were made in this exercise. Clear any
Insights filters before continuing.

---

[Next: Exercise 2.2 — Test the Proxy →](/module2/test-proxy.md)
