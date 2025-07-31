# Day 2: Welcome & Context Setting

---

## Overview

This session transitions from Day 1's "when things work" to Day 2's "when things break" by collecting workplace failure experiences and establishing the foundational concepts of incident vs problem management. This creates the context for today's hands-on breaking and responding activities.

---

## Session Structure

### 1. Discussion: System Failure Stories - Workplace Edition (12 minutes)

**Learning Type:** Discussion  
**Format:** Structured sharing with experience capture

#### Sharing Structure (8 minutes):

**Individual Reflection (2 minutes):**
Think of a workplace example:

- System failure, data pipeline break, application outage
- Focus on the organizational response, not just the technical issue

**Round-Robin Sharing (6 minutes):**
Each learner shares briefly (45-60 seconds each):

- **What broke?** (brief technical context)
- **How did people find out?** (detection method)
- **Who got involved?** (response team/escalation)
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

