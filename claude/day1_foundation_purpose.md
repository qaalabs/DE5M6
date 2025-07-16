# Day 1: Foundation & Purpose
**Time:** 9:50-10:30 (40 minutes)  
**Learning Types:** Discussion → Acquisition → Investigation

---

## Overview
This session establishes the foundational understanding of why monitoring matters in data operations by connecting personal experiences with business impact and examining real-world communication during system failures.

---

## Session Structure

### 1. Discussion: System Failure Stories (15 minutes)
**Learning Type:** Discussion  
**Format:** Group discussion with individual sharing

#### Facilitator Instructions:
1. **Opening Question (2 minutes):**
   - "Think of a time when a system failure impacted you personally - could be at work, online shopping, banking, social media. What happened?"

2. **Individual Reflection (3 minutes):**
   - Give learners time to think of their example
   - Encourage them to consider: What broke? How did they find out? What was the impact?

3. **Sharing Round (8 minutes):**
   - Each learner shares their story (1-2 minutes each)
   - As facilitator, listen for common themes:
     - How they discovered the problem
     - Lack of communication about the issue
     - Business/personal impact
     - Resolution time

4. **Pattern Recognition (2 minutes):**
   - Summarise common themes you heard
   - "What patterns do you notice in these stories?"

#### Key Questions to Guide Discussion:
- How did you first realise something was wrong?
- Did anyone tell you what was happening?
- How long did it take to resolve?
- What would have made the experience better?

#### Expected Outcomes:
- Learners connect personally with system reliability challenges
- Common themes emerge: detection, communication, resolution
- Natural lead-in to why monitoring matters

---

### 2. Acquisition: Why Monitor? (10 minutes)
**Learning Type:** Acquisition  
**Format:** Trainer presentation with interactive elements

#### Key Points to Cover:

**From Personal Pain to Business Impact (3 minutes):**
- Personal frustration = lost customers/revenue for businesses
- System downtime costs: Amazon loses £2.8M per minute of downtime
- Reputation damage can last longer than the outage

**The Monitoring Pyramid (4 minutes):**
```
Business Impact     (Customer complaints, lost revenue)
        ↑
Service Impact      (Application slow/down, data unavailable)
        ↑
Technical Issues    (CPU high, disk full, network timeout)
        ↑
Monitoring Data     (Metrics, logs, alerts)
```

**Key Monitoring Questions (3 minutes):**
1. **Is it working?** (Availability monitoring)
2. **Is it working well?** (Performance monitoring)  
3. **Will it keep working?** (Predictive monitoring)
4. **When it breaks, how do we know?** (Alerting)
5. **When it breaks, what do we tell people?** (Communication)

#### Interactive Elements:
- Ask: "Which level of the pyramid do you think most organisations focus on?"
- Quick poll: "Hands up if your workplace monitors at each level"

---

### 3. Investigation: Status Page Analysis (15 minutes)
**Learning Type:** Investigation  
**Format:** Pairs research with report back

#### Setup Instructions (2 minutes):
1. **Form pairs** - mix experience levels if possible
2. **Assign each pair 1-2 status pages** from the list below
3. **Research task:** 10 minutes investigation + 3 minutes prep for sharing

#### Status Pages to Research:
Choose from these well-known status pages:
- **AWS:** https://health.aws.amazon.com/health/status
- **Microsoft Azure:** https://status.azure.com/
- **Google Cloud:** https://status.cloud.google.com/
- **GitHub:** https://www.githubstatus.com/
- **Slack:** https://status.slack.com/
- **Stripe:** https://status.stripe.com/
- **Zoom:** https://status.zoom.us/

#### Investigation Questions for Pairs:
Provide each pair with these guiding questions:

**Current Status:**
- What's the overall system health right now?
- How is information organised? (by service, region, etc.)

**Historical Incidents:**
- Look at 1-2 recent incidents - what information is provided?
- How detailed are the updates?
- How frequently were updates posted?

**Communication Style:**
- How technical is the language?
- What do they tell users about impact?
- Do they explain what they're doing to fix it?

**What Works Well:**
- What would be helpful if you were a customer?
- What builds confidence that they're handling it?

#### Report Back Session (3 minutes):
Each pair shares **one key insight** in 30 seconds:
- "The most interesting thing we noticed was..."
- "If we were designing a status page, we'd make sure to..."

#### Facilitator Notes:
- **If internet issues:** Have screenshots of status pages prepared as backup
- **Time management:** Keep sharing tight - use a timer
- **Follow-up questions:** "How does this connect to monitoring?" "What would happen without these status pages?"

---

## Transition to Next Session
**Bridge to Lab 5 (2 minutes):**
- "We've talked about why monitoring matters and how companies communicate when things go wrong"
- "Now let's start building something we can monitor"
- "Our first lab will introduce you to Microsoft Fabric and create a simple data process"

---

## Resources for Trainers

### Common Challenges:
- **Quiet group:** Start with your own system failure story to model sharing
- **Too much detail:** Gently redirect: "Great story - let's hear one key point others can learn from"
- **Off-topic:** "That's interesting - how does it connect to monitoring and system reliability?"

### Extension Activities (if running ahead):
- Quick discussion: "What would you want to know if your data pipeline failed?"
- Preview tomorrow: "Tomorrow we'll deliberately break things to see what happens"

### Key Takeaways:
By the end of this session, learners should understand:
1. System failures have real business and personal impact
2. Monitoring helps detect, communicate, and resolve issues faster
3. Good communication during incidents builds trust
4. We're going to learn operational skills to handle these challenges