# Day 2: Welcome & Context Setting
**Time:** 9:30-9:50 (20 minutes)  
**Learning Types:** Discussion → Acquisition

---

## Overview
This session transitions from Day 1's "when things work" to Day 2's "when things break" by collecting workplace failure experiences and establishing the foundational concepts of incident vs problem management. This creates the context for today's hands-on breaking and responding activities.

---

## Session Structure

### 1. Discussion: System Failure Stories - Workplace Edition (12 minutes)
**Learning Type:** Discussion  
**Format:** Structured sharing with experience capture

#### Opening Frame (2 minutes):
- **Yesterday:** "We talked about personal experiences with system failures"
- **Today:** "Let's focus on workplace experiences - when systems broke and how your organization responded"
- **Purpose:** "We're looking for patterns in how incidents happen and get handled"

#### Sharing Structure (8 minutes):
**Individual Reflection (2 minutes):**
Give learners time to think of a workplace example:
- System failure, data pipeline break, application outage
- Focus on the organizational response, not just the technical issue

**Round-Robin Sharing (6 minutes):**
Each learner shares briefly (45-60 seconds each):
- **What broke?** (brief technical context)
- **How did people find out?** (detection method)
- **Who got involved?** (response team/escalation)
- **How long to fix?** (resolution time)
- **What was learned?** (if anything)

#### Facilitator Role:
Listen for and capture these patterns on screen/flip chart:

**Detection Patterns:**
- User complaints vs automated alerts
- How long before someone noticed?
- Who noticed first?

**Response Patterns:**
- Clear vs chaotic response process
- Right people involved quickly vs hunting for expertise
- Good vs poor communication during incident

**Resolution Patterns:**
- Quick fix vs proper fix
- Root cause analysis vs just "make it work"
- Changes made to prevent recurrence

#### Guided Questions (2 minutes):
After sharing, ask:
- "What patterns do you notice in how incidents were detected?"
- "Where did the response go well vs poorly?"
- "What would have made the biggest difference?"

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

**Ask the group:**
- "What's the incident here?" *(Pipeline down, dashboard not updating)*
- "What's the immediate response?" *(Get pipeline running, communicate to customers)*
- "What's the potential problem?" *(Why did it fail? Schema change? Resource issue?)*
- "Who handles each part?" *(Ops team fixes incident, data team investigates problem)*

**Connect to Today:**
- "Today we'll practice both sides"
- "First: Break things and detect incidents quickly"
- "Then: Investigate what went wrong and how to prevent it"

---

## Transition to Next Session

### Bridge to Breaking Things 101 (1 minute):
- **Connect experiences:** "In your stories, most incidents were accidental - today we'll break things deliberately"
- **Learning purpose:** "By breaking systems in controlled ways, we learn how to detect and respond faster when real incidents happen"
- **Set expectations:** "We'll start with simple breaks, then build up complexity"
- **Safety note:** "Everything we break today can be easily fixed - that's the point!"

---

## Resources for Trainers

### Facilitator Preparation:
- **Have your own example ready** to model the sharing if the group is quiet
- **Review common incident types** in data engineering (pipeline failures, schema changes, performance issues)
- **Prepare backup scenarios** if learners struggle to think of examples

### Managing the Discussion:

**If learners are hesitant to share:**
- Start with your own workplace example
- Ask about "any system" not just data systems
- Frame as learning opportunity: "What can we learn from this?"

**If someone shares sensitive information:**
- "Thanks for sharing - let's focus on the response process rather than specific details"
- Guide toward general patterns rather than company-specific issues

**If stories are too long or off-topic:**
- "That's a great example - what's the key lesson for incident response?"
- "Let's capture the main point and hear from others"

### Time Management Tips:
- **Use visible timer** for the sharing round
- **Give 30-second warning** before moving to next person
- **Keep Acquisition section interactive** - ask questions rather than just presenting

### Common Patterns to Highlight:
- **Poor detection:** Found out from users instead of monitoring
- **Unclear escalation:** Nobody knew who to call
- **Communication gaps:** Teams working in isolation
- **No follow-up:** Fixed the symptom but not the cause

### Expected Outcomes:
By the end of this session, learners should:
1. **Recognize common patterns** in how incidents unfold in organizations
2. **Understand the difference** between incident and problem management
3. **Appreciate the dual focus** needed: restore service AND prevent recurrence
4. **Be mentally prepared** to practice both detection and response skills today

### Connection to KSBs:
- **K22:** Technology and service management best practice
- **S19:** Identify and escalate risks with suggested mitigation
- **S20:** Investigate and respond to incidents
- **B1:** Acts proactively and takes accountability