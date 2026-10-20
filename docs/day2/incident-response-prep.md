# Day 2: Incident Communication

## Why This Matters

When a data platform fails, fixing it is only half the job. The other half is keeping people informed - managers, colleagues and other teams who depend on your data. Often the communication is harder than the technical fix.

In this activity you'll look at how real companies worded their updates during and after major outages, and note the language that works.

---

## Your Task

1. Read [What Good Incident Language Looks Like](#what-good-incident-language-looks-like) below
2. Pick **two** incidents from [Real Incident Examples](#real-incident-examples) and skim how the company communicated
3. Write down **3-5 phrases** you could reuse yourself, using the [checklist](#phrases-to-collect)

**By the end you should have:** a short list of phrases in your notes that you could use when writing your own incident update.

!!! tip "Don't try to read everything"
    The post-mortems are long. Skim the summary at the top and the closing section - that's where most of the stakeholder language is.

---

### What Good Incident Language Looks Like

Good incident updates are written for **stakeholders** - people who need to know what's happening but don't need the technical detail. Here are two real examples.

**During an incident - Google Cloud, 20 October 2026**

> "Due to a power event we had suffered an outage within europe-west2-b zone. The power event is mitigated.
>
> Partial mitigation to infrastructure services will be observed within the next 30 minutes and the remaining services will be mitigated there after."

*Google Cloud status page, as reported in [BBC News live coverage](https://www.bbc.co.uk/news/live/c58jd2kjp93xt?post=asset%3Aa3c2303f-7197-4e4b-90a0-da596167af0c#post)*

What works:

- **Cause in a few words** - "a power event", with no guessing beyond that
- **Current status** - the cause "is mitigated"
- **What happens next, with a time** - partial recovery "within the next 30 minutes"
- **Honest about stages** - it doesn't promise everything is fixed at once

What wouldn't work for internal stakeholders: "europe-west2-b zone" and "infrastructure services" mean a lot to engineers but nothing to a finance director. They want to know: *are my reports affected, and when will they be back?*

**After an incident - AWS, October 2025**

> "We apologize for the impact this event caused our customers. While we have a strong track record of operating our services with the highest levels of availability, we know how critical our services are to our customers, their applications and end users, and their businesses. We know this event impacted many customers in significant ways. We will do everything we can to learn from this event and use it to improve our availability even further."

*Closing paragraph of the [AWS post-event summary](https://aws.amazon.com/message/101925/), as reported by [BBC News](https://www.bbc.co.uk/news/articles/cvgvnp77dy9o)*

What works:

- **A clear apology** - no excuses, no blaming anyone else
- **Shows they understand the impact** - not just on customers, but on their customers' users and businesses
- **Looks forward** - commits to learning and improving

---

### Real Incident Examples

Pick **two** of these. For each one, look at how the company explained the problem, not just what went wrong. Notice how many of them started with **data**, not code: a bad DNS record, a file that grew too big, a policy row with blank fields.

**AWS us-east-1 Outage - October 20, 2025**

- *About 15 hours of disruption in AWS's busiest region, taking down apps, banks and games worldwide*
- A race condition in DynamoDB's automated DNS management left its endpoint with an empty DNS record. Services that depended on DynamoDB (including EC2 launches and load balancers) then failed in turn.
- **Link:** [AWS post-event summary](https://aws.amazon.com/message/101925/)
- **Key lesson:** Hidden dependencies and cascading failures - fixing the first problem didn't end the outage

**Cloudflare Global Outage - November 18, 2025**

- *Around 3 hours of HTTP 5xx errors across a large share of the web (ChatGPT, X, Spotify and many more)*
- A database permissions change made a query return duplicate rows. That doubled the size of a configuration file, which crashed the proxy software when it was pushed to every server.
- **Link:** [Cloudflare post-mortem](https://blog.cloudflare.com/18-november-2025-outage/)
- **Key lesson:** Bad data spreads as fast as bad code - and the team first suspected an attack

**Google Cloud Global Outage - June 12, 2025**

- *Several hours of API failures across Google Cloud and Workspace, and many services built on them*
- A policy update with unexpected blank fields was replicated to every region within seconds. It triggered a crash in new code that had no error handling or feature flag.
- **Link:** [Google Cloud incident report](https://status.cloud.google.com/incidents/ow5i3PPK96RduMcb1SsW)
- **Key lesson:** Global changes need staged rollouts, even when they are "just data"

**CrowdStrike Falcon Update - July 19, 2024**

- *About 8.5 million Windows machines crashed, grounding flights and disrupting hospitals and banks*
- A faulty content update for security software was sent to all customers at once. Many machines needed someone to fix them by hand.
- **Link:** [CrowdStrike preliminary post-incident report](https://www.crowdstrike.com/en-us/blog/falcon-content-update-preliminary-post-incident-report/)
- **Key lesson:** Rollout strategy and recovery planning - how do you fix machines that won't boot?

**Meta/Facebook Global Outage - October 4, 2021**

- *6+ hour BGP configuration error taking down all Meta services*
- **Link:** [Meta engineering write-up](https://engineering.fb.com/2021/10/05/networking-traffic/outage-details/)
- **Key lesson:** When your monitoring and internal tools fail too

**GitHub Database Incident - October 21, 2018**

- *24+ hour degraded service after a brief network fault split the database cluster*
- **Link:** [GitHub post-incident analysis](https://github.blog/2018-10-30-oct21-post-incident-analysis/)
- **Key lesson:** Choosing data integrity over speed - and explaining that choice to users

---

### Phrases to Collect

Write down 3-5 phrases you could reuse yourself. Look for language that:

- Says **what's affected** in terms the reader cares about
- Gives a **time for the next update** or for recovery
- Admits **what isn't known yet**, without sounding lost
- **Apologises** without blaming people or suppliers
- States **what happens next**

And watch for things to avoid:

- Jargon and internal system names
- Guessing at the cause before it's confirmed
- Exact fix times that can't be promised
- Pointing the finger at a team or person

---

### If You Finish Early

Think about these questions for one of your incidents:

- How long was it before they first said anything publicly?
- How did they talk about things they didn't know yet?
- Did they send different messages to different audiences?
- How did they balance speed (saying something quickly) against accuracy (saying the right thing)?

!!! note "The goal isn't deep expertise - it's noticing the wording that works!"
