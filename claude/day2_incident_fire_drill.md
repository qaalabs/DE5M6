# Day 2: Incident Response Fire Drill
**Time:** 13:30-15:45 (2 hours 15 minutes)  
**Learning Types:** Investigation → Practice → Collaboration → Production

---

## Overview
This realistic incident simulation puts learners into the pressure of real operational scenarios. Using Microsoft Fabric pipeline failures as the context, teams practice coordination, communication, and decision-making under time pressure. The "fire drill" approach creates authentic urgency while allowing them to apply workplace experience and today's learning.

---

## Session Structure

### Phase 1: Fire Drill Preparation (13:30-13:50, 20 minutes)

#### Opening Frame (2 minutes):
**Facilitator Introduction:**
- "Back from lunch - time to put incident response into practice"
- "This afternoon is a fire drill - you're incident response teams for a data platform"
- "In 20 minutes, you might receive an incident alert"
- "Use this time to prepare and form your response teams"

#### Team Formation & Role Assignment (5 minutes):

**Group Sizing:**
- **5 learners:** 2 teams (2-3 people each)
- **10 learners:** 3 teams (3-4 people each) OR 2 teams (5 each)
- **15+ learners:** 4-5 teams (3-4 people each)

**Role Assignments within Teams:**
**For 3-4 person teams:**
- **Incident Commander:** Coordinates response, makes decisions, manages timeline
- **Technical Lead:** Investigates root cause, determines fix options
- **Communications Lead:** Handles stakeholder updates, manages messaging
- *(4th person: Business Impact Analyst - assesses downstream effects)*

**For 2 person teams:**
- **Person A:** Incident Commander + Technical Lead
- **Person B:** Communications + Business Impact

#### Preparation Materials (10 minutes):

**Real Incident Report Examples:**
Provide teams with these actual incident reports to study:

**Cloudflare DNS Outage (June 21, 2022):**
- BGP route leak caused global DNS failures
- 27-minute outage affecting millions of websites
- Key lessons: Communication timeline, technical transparency

**AWS us-east-1 Outage (December 7, 2021):**
- Power issues cascaded to affect thousands of services
- 5+ hour outage with multiple service impacts
- Key lessons: Dependency mapping, customer communication

**GitHub Database Incident (October 21, 2018):**
- Database cluster failure during maintenance
- 24+ hour degraded service period
- Key lessons: Incident escalation, technical decision-making

**Quick Study Instructions:**
- **5 minutes:** Choose one report to focus on
- **5 minutes:** Note key decisions they made (good and bad)
- **Focus questions:**
  - How did they structure their response?
  - What communication decisions did they make?
  - What would you do differently?

#### Team Readiness Check (3 minutes):
**Facilitator Questions:**
- "Teams ready? Roles assigned?"
- "You've studied real incidents - any key insights for your approach?"
- "Remember: You can bring your workplace experience into this"

---

### Phase 2: Initial Incident Response (13:50-14:30, 40 minutes)

#### Incident Alert Delivery (2 minutes):

**Facilitator (dramatically):**
- "INCIDENT ALERT: We have a critical data platform failure"
- "Customer dashboards are showing stale data"
- "Multiple business units reporting problems"
- *Hand out scenario cards to each team*

#### Scenario Cards (Teams receive ONE of these):

**Scenario A: Revenue Pipeline Failure**
```
TIME: 09:15 Monday morning
ALERT: "Sales revenue pipeline failed at 02:00 - daily dashboard shows yesterday's data"
IMPACT: Sales teams can't see weekend sales, finance can't run Monday morning reports
CUSTOMER CALLS: 3 calls in the last 15 minutes asking about data freshness
TECHNICAL CONTEXT: Fabric pipeline "Sales-ETL-Daily" showing "Failed" status
INITIAL INVESTIGATION: Source system changed data format over weekend
PRESSURE: Sales director wants explanation in 30 minutes for board meeting
```

**Scenario B: Customer Data Processing Failure**  
```
TIME: 14:30 Friday afternoon
ALERT: "Customer onboarding pipeline failing for 4 hours"
IMPACT: New customer registrations not appearing in systems
CUSTOMER CALLS: 12 new customers can't access accounts they just created
TECHNICAL CONTEXT: Fabric pipeline "Customer-Onboarding" timing out on large files
INITIAL INVESTIGATION: File size 10x larger than normal due to bulk import
PRESSURE: Customer service queue backing up, social media complaints starting
```

**Scenario C: Compliance Reporting Failure**
```
TIME: 08:00 Last day of quarter
ALERT: "Regulatory reporting pipeline failed overnight"
IMPACT: Quarterly compliance reports due to regulators by 17:00 today
CUSTOMER CALLS: Compliance team escalating to C-suite
TECHNICAL CONTEXT: Fabric pipeline "Compliance-Quarterly" failed on data validation
INITIAL INVESTIGATION: Source data contains records that don't meet validation rules
PRESSURE: Regulatory fine of £50k per day if reports are late
```

#### Team Response Phase (30 minutes):

**Response Template** (provide to each team):

```
INCIDENT RESPONSE LOG
Team: _______________  Scenario: _______________

IMMEDIATE ASSESSMENT (5 minutes):
□ Incident severity level: _______________
□ Affected systems/users: _______________
□ Estimated business impact: _______________
□ Key stakeholders to notify: _______________

TECHNICAL INVESTIGATION (10 minutes):
□ Root cause hypothesis: _______________
□ Diagnostic steps to take: _______________
□ Quick fix options: _______________
□ Proper fix options: _______________
□ Estimated fix time: _______________

COMMUNICATION PLAN (10 minutes):
□ Internal notifications sent to: _______________
□ Customer communication needed? _______________
□ First public update (if any): _______________
□ Update frequency: _______________
□ Key message: _______________

COORDINATION DECISIONS (5 minutes):
□ Who's working on technical fix: _______________
□ Who's handling communication: _______________
□ Next decision point: _______________
□ Escalation triggers: _______________
```

#### Facilitator Role During Response:
- **Circulate between teams** - observe decision-making
- **Provide clarifications** if teams ask technical questions
- **Add pressure** with occasional updates: "Customer calls increasing"
- **Time warnings:** 20 minutes left, 10 minutes left, 5 minutes left

#### Report Back (8 minutes):
Each team gets **2 minutes** to present their initial response:
- **30 seconds:** Situation assessment
- **30 seconds:** Technical approach  
- **30 seconds:** Communication decisions
- **30 seconds:** Next steps

---

### Break (14:30-14:50, 20 minutes)

---

### Phase 3: Escalation Round (14:50-15:25, 35 minutes)

#### Escalation Scenario Delivery (2 minutes):

**Facilitator:**
- "1 hour has passed since the initial incident"
- "Your technical fixes are in progress, but now you have new pressures"
- *Hand out escalation cards*

#### Escalation Cards (Teams receive scenario-specific escalations):

**For Revenue Pipeline Teams:**
```
ESCALATION UPDATE - 1 HOUR LATER
□ CEO just called: "Board meeting in 30 minutes, need explanation and timeline"
□ Sales director: "Are we going to lose the big client deal because of missing weekend data?"
□ Technical update: Initial fix worked but data is still 8 hours behind
□ New pressure: Media picked up story from social media complaints

YOUR CHALLENGE: Prepare CEO briefing and decide on customer communication
```

**For Customer Data Teams:**
```
ESCALATION UPDATE - 1 HOUR LATER  
□ Customer service manager: "Phone queue is 45 minutes, customers are furious"
□ Marketing director: "This is killing our customer acquisition campaign"
□ Technical update: Pipeline running but 200 customers still can't access accounts
□ New pressure: Competitor's marketing team highlighting our outage on social media

YOUR CHALLENGE: Handle customer communication and manage competitive damage
```

**For Compliance Teams:**
```
ESCALATION UPDATE - 1 HOUR LATER
□ Legal counsel: "Regulators are asking for status update on quarterly reports"
□ CFO: "What's the financial exposure if we miss the deadline?"
□ Technical update: Data validation fixed but reports need manual review
□ New pressure: IT security wants investigation of why validation failed

YOUR CHALLENGE: Balance speed vs. accuracy for regulatory submission
```

#### Team Response to Escalation (25 minutes):

**Updated Response Template:**
```
ESCALATION RESPONSE
Team: _______________  Time: 1 hour after initial incident

SITUATION UPDATE (5 minutes):
□ Current technical status: _______________
□ Outstanding issues: _______________
□ New stakeholder pressures: _______________

EXECUTIVE COMMUNICATION (10 minutes):
□ Key message for CEO/senior leadership: _______________
□ Timeline commitment: _______________
□ Resource needs: _______________
□ Risk assessment: _______________

CUSTOMER/PUBLIC COMMUNICATION (10 minutes):
□ Updated public message: _______________
□ Proactive vs. reactive communication: _______________
□ Channel strategy: _______________
□ Next update timing: _______________
```

#### "CEO Briefing" Presentations (8 minutes):
**Facilitator role-plays as CEO/Senior Executive**

Each team gets **90 seconds** to brief the "CEO":
- **30 seconds:** Current situation
- **30 seconds:** Action plan and timeline
- **30 seconds:** Risk mitigation

**CEO Questions to Ask:**
- "When will this be fully resolved?"
- "How do we prevent this happening again?"
- "What are you telling customers?"
- "Do we need additional resources?"

---

### Phase 4: Debrief & Real-World Learning (15:25-15:45, 20 minutes)

#### Hot Wash Debrief (10 minutes):

**Immediate Reflection Questions:**
- "What was the hardest decision your team had to make?"
- "Where did you feel most/least confident?"
- "What information did you wish you had?"
- "How did the pressure affect your decision-making?"

**Cross-Team Learning:**
- "Which team's approach would you want to adopt?"
- "What different strategies did you notice?"

#### Real-World Connection (10 minutes):

**Connect to Actual Incidents:**
- **Show quotes** from the Cloudflare/AWS/GitHub reports
- **Compare their decisions** with what major companies actually did
- **Highlight patterns:** "Notice how you all struggled with communication timing - so did these companies"

**Workplace Application:**
- "How does this compare to incident response in your organizations?"
- "What would you change about today's experience?"
- "What's the one thing you'd implement from this exercise?"

**Bridge to Tomorrow:**
- "Today was about technical incidents - pipelines breaking, systems failing"
- "Tomorrow we'll look at a different type of 'incident' - when data quality doesn't meet standards"
- "The coordination and communication skills you practiced today apply to quality issues too"

---

## Resources for Trainers

### Pre-Session Preparation:
- **Print scenario and escalation cards** - have extras ready
- **Set up timer** - visible countdown for each phase
- **Prepare role-play attitude** for CEO character
- **Review real incident reports** to reference during debrief

### Facilitator Tips:

**During Preparation Phase:**
- **Encourage workplace sharing:** "Anyone dealt with incidents like these before?"
- **Set realistic expectations:** "Perfect response isn't the goal - learning is"

**During Incident Response:**
- **Add realistic pressure:** Occasional "updates" about customer complaints
- **Don't rescue struggling teams** - let them work through uncertainty
- **Observe decision patterns** to highlight during debrief

**During Escalation:**
- **Make CEO role realistic** - ask tough but fair questions
- **Balance pressure with support** - challenging but not defeating
- **Focus on learning** not "gotcha" moments

### Common Challenges:

**"We don't have enough technical information":**
- "That's realistic - incidents rarely come with complete information"
- "What would you do to get more information?"

**"We don't know the company's communication policies":**
- "Make reasonable assumptions based on best practices"
- "Focus on the principle: who needs to know what, when?"

**"This scenario couldn't happen in our workplace":**
- "Focus on the response process, not the specific technology"
- "What similar situations could happen in your environment?"

### Expected Learning Outcomes:

**Operational Skills:**
- **Decision-making under pressure**
- **Coordination between technical and communication needs**
- **Escalation and stakeholder management**

**Communication Skills:**
- **Adapting messages for different audiences**
- **Balancing transparency with uncertainty**
- **Managing expectations during ongoing incidents**

**Team Collaboration:**
- **Role clarity during crisis situations**
- **Information sharing and coordination**
- **Collective problem-solving under time pressure**

### Connection to KSBs:
- **S20:** Investigate and respond to incidents, identifying root cause and resolution
- **S10:** Communicate downtime and issues to stakeholders
- **K22:** Technology and service management best practice
- **S23:** Present and communicate messages about data products
- **B2:** Works collaboratively with stakeholders and colleagues