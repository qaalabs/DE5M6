# Day 2: Major Outage Case Studies
**Time:** After Lab 11 completion (55 minutes total)  
**Learning Types:** Investigation → Discussion

---

## Overview
This investigation moves from the small-scale pipeline breaks learners just practiced to major real-world incidents affecting millions of users. By analyzing how major companies detected, responded to, and communicated during significant outages, learners develop perspective on incident management at scale and identify best practices for their own operational contexts.

---

## Session Structure

### Setup & Assignment (5 minutes)

#### Pair Formation:
- **Form pairs** (ideally different from yesterday's pairings)
- **For odd numbers:** One group of 3 is acceptable
- **Mixed experience levels** preferred for richer analysis

#### Outage Assignment:
Each pair gets assigned **one major outage** to research in depth:

**Outage 1: Facebook/Meta Global Outage (October 4, 2021)**
- All Facebook, Instagram, WhatsApp services down globally
- 6+ hour outage affecting 3+ billion users
- BGP routing configuration error

**Outage 2: AWS us-east-1 Outage (December 7, 2021)**
- Major AWS region failure affecting thousands of services
- Netflix, Ring, Amazon's own retail site affected
- Power-related issues in data center

**Outage 3: Google Cloud Global Outage (June 2, 2019)**
- YouTube, Gmail, Google Drive, Google Cloud Platform down
- Network congestion and configuration issues
- 4+ hour impact across multiple services

**Outage 4: GitHub Outage (October 21, 2018)**
- Major database failure affecting millions of developers
- 24+ hour degraded service
- Network partition and database replication issues

**Outage 5: Slack Global Outage (January 4, 2021)**
- Complete service unavailability during peak work hours
- DNS and internal infrastructure issues
- Major productivity impact for remote workers

**Outage 6: Microsoft 365 Global Outage (March 15, 2021)**
- Teams, Outlook, SharePoint affected globally
- Authentication system failures
- Major impact during pandemic remote work surge

---

### Investigation Phase (35 minutes)

#### Research Framework:
Provide each pair with this structured investigation template:

### **Incident Timeline & Detection (8 minutes)**

**When and How It Started:**
- What was the root cause? (technical failure, human error, external factor)
- How long before the company detected the problem?
- How did they find out? (monitoring alerts, user complaints, internal discovery)

**Timeline Research:**
- What time did the incident start?
- When did the company acknowledge it publicly?
- How long until full resolution?

### **Response and Communication (10 minutes)**

**Internal Response:**
- Who was involved in the response? (on-call engineers, executives, PR teams)
- What was the escalation process?
- How did they coordinate across teams?

**External Communication:**
- How quickly did they communicate with users?
- What channels did they use? (status page, social media, email)
- How detailed/honest were their updates?

**Communication Examples:**
- Find 2-3 actual quotes from their status updates
- How did the tone/detail change over time?

### **Impact and Lessons (10 minutes)**

**Business Impact:**
- How many users/customers affected?
- Estimated financial impact (if available)
- Reputation/trust impact

**Technical Lessons:**
- What did they say went wrong technically?
- What changes did they make to prevent recurrence?
- What processes/tools did they improve?

### **Connection to Today's Learning (7 minutes)**

**Compare to Pipeline Breaks:**
- How similar/different were the detection methods?
- How would monitoring have helped (or did help)?
- What role did communication play vs. just fixing the problem?

#### Research Resources:
**Suggested Starting Points:**
- Company status page archives and incident reports
- Technology news coverage (TechCrunch, Ars Technica, The Verge)
- Post-incident blog posts from the companies
- Industry analysis articles

**Search Tips:**
- "[Company name] outage [date] post-mortem"
- "[Company name] incident report [date]"
- "What caused [company] outage [date]"

#### Facilitator Role During Investigation:
- **Circulate between pairs** - ensure they're finding good information
- **Provide guidance** if pairs struggle to find details
- **Suggest alternative search terms** if research stalls
- **Keep them focused** on the framework questions
- **Have backup sources** ready for difficult-to-research outages

---

### Discussion Phase (15 minutes)

#### Report Back Structure (12 minutes):
Each pair gets **2 minutes** to share key findings using this format:

**30 seconds - The Incident:**
- "What broke and how badly?"
- "How long did it take to fix?"

**30 seconds - Detection & Response:**
- "How did they find out?"
- "What went well or poorly in their response?"

**30 seconds - Communication:**
- "How did they communicate with users?"
- "What was effective or problematic?"

**30 seconds - Lessons:**
- "Key lesson for data operations teams?"
- "What would you do differently?"

#### Facilitator Role:
- **Strict timekeeper** - use visible timer
- **Capture themes** on screen/flip chart
- **Ask follow-up questions** to highlight patterns
- **Connect back** to morning's pipeline breaking experience

#### Pattern Recognition Discussion (3 minutes):
After all presentations, facilitate group discussion:

**Detection Patterns:**
- "What's common about how these major incidents were detected?"
- "How does this compare to our pipeline monitoring today?"

**Communication Patterns:**
- "What made some company communications more effective than others?"
- "When do you communicate vs. when do you just focus on fixing?"

**Scale Differences:**
- "How are these different from the pipeline breaks we practiced?"
- "What principles apply regardless of scale?"

---

## Wrap-up & Transition

### Key Insights Capture (5 minutes):
**Group Reflection Questions:**
- "What surprised you most about how major companies handle incidents?"
- "Which company's approach would you want to emulate?"
- "How does this change your thinking about incident response?"
- "What's the biggest difference between small pipeline breaks and these major outages?"

### Bridge to Afternoon Session:
- "These companies had massive resources and still struggled with communication and coordination"
- "This afternoon we'll practice incident response role-play with the pipelines you broke this morning"
- "We'll also research your own workplace procedures to see how they compare"

---

## Resources for Trainers

### Pre-Session Preparation:
- **Research each outage yourself** to understand key facts
- **Bookmark good sources** for each incident in case pairs struggle
- **Prepare backup summaries** if internet access is problematic
- **Review timeline** - this session could easily overrun without strict time management

### Backup Information Sources:
If learners struggle to find information, have these ready:

**Facebook Outage 2021:**
- Official explanation: BGP routing error disconnected data centers
- No monitoring alerts because monitoring systems were also affected
- Took hours just to get physical access to data centers

**AWS us-east-1 2021:**
- Power-related issues triggered cascading failures
- Many services lacked cross-region failover
- Amazon's own retail site was affected, highlighting internal dependencies

### Managing Discussion:

**If pairs found limited information:**
- "That's a valid finding - sometimes companies aren't transparent"
- "What does that tell us about incident communication?"

**If someone found conflicting information:**
- "Different sources often have different perspectives on the same incident"
- "What does that teach us about communicating during incidents?"

**If discussion goes long:**
- Focus on 1-2 key patterns rather than all findings
- "We'll continue this theme in the afternoon sessions"

### Common Learning Outcomes:

**Technical Insights:**
- Detection is hard even with massive monitoring infrastructure
- Cascading failures are common in complex systems
- Simple changes can have massive consequences

**Communication Insights:**
- Transparency generally builds more trust than hiding details
- Regular updates matter even without new information
- Different audiences need different levels of detail

**Operational Insights:**
- Having processes doesn't guarantee they'll work under pressure
- Cross-team coordination is often the hardest part
- Post-incident learning is as important as the immediate response

### Connection to KSBs:
- **K23:** How to undertake analysis and root cause investigation
- **S20:** Investigate and respond to incidents
- **K30:** Methods and techniques used to communicate messages to meet audience needs
- **S10:** Communicate downtime and issues with database access to stakeholders