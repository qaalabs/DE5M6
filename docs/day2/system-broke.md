# When a system broke at work

## Overview

Yesterday you shared experiences of systems failing — from the outside, as a user. Today we look at the same kind of event from the inside: what happened organisationally when it broke?

This reframes Day 1 stories (or new ones) to focus on the response — who got involved, how it was escalated, and what the process looked like. It sets up the Incident vs Problem framework and the hands-on breaking activities that follow.

## Session Structure

### 1. Discussion: The organisational response

**Learning Type:** Discussion  
**Format:** Structured sharing with experience capture

#### Sharing Structure

**Opening prompt**

> "Yesterday we looked at system failures from the outside. Today, think about one from the inside — at work, or somewhere you've seen the response up close. You can use the same example as yesterday if it fits."

**Round-Robin Sharing**
Each learner shares briefly (45-60 seconds each):

- **What broke?** (brief technical context)
- **How did people find out?** (was there monitoring, or did someone notice?)
- **Who got involved?** (response team, escalation path)
- **How long to fix?** (resolution time)
- **What was learned?** (if anything)

---

### 2. Acquisition: Incident vs Problem Framework (8 minutes)

**Learning Type:** Acquisition  
**Format:** Interactive presentation with real examples

#### Core Definitions (3 minutes):

**Incident:**

- **Definition:** Unplanned interruption or reduction in quality of service
- **Focus:** Restore service as quickly as possible
- **Timeframe:** Minutes to hours
- **Example:** "Data pipeline failed at 2am, sales dashboard showing yesterday's data"

**Problem:**

- **Definition:** Root cause of one or more incidents
- **Focus:** Prevent incidents from recurring
- **Timeframe:** Days to weeks
- **Example:** "Why do our pipelines keep failing when the source system releases schema changes?"

#### The Response Hierarchy (3 minutes):

```
INCIDENT MANAGEMENT           PROBLEM MANAGEMENT
↓                            ↓
Detect → Respond → Restore   Analyze → Identify → Prevent
↓                            ↓
"Make it work now"           "Stop it happening again"
```

**Key Insight:** You often need to do both simultaneously

- **Immediate team:** Fix the incident (restore service)
- **Analysis team:** Investigate the problem (prevent recurrence)

#### Real-World Application (2 minutes):

**Scenario Walkthrough:**

"A data pipeline feeding the customer dashboard fails at 6am. Customers start calling at 8am saying they can't see their orders."

---

