# Day 1: Monitoring Strategy Creation
**Time:** 15:15-15:45 (30 minutes)  
**Learning Types:** Production + Collaboration

---

## Overview
This production activity synthesizes everything learners have experienced today - the labs, status page analysis, and cloud platform research - into a comprehensive monitoring strategy. Working in pairs, they create a tangible monitoring framework that could be applied in real-world scenarios.

---

## Session Structure

### Setup Instructions (3 minutes)

#### Pair Formation:
- **Recommended pairing:** Mix experience levels where possible
- **For odd numbers:** One group of 3 is fine
- **Continuity:** Ideally different pairs from the cloud monitoring research to cross-pollinate ideas

#### Scenario Assignment:
Give each pair a realistic scenario to make their strategy concrete:

**Scenario A: E-commerce Data Platform**
- Real-time customer behaviour tracking
- Daily sales reporting pipelines  
- Inventory management data feeds
- Customer impact: Revenue loss if data is stale/incorrect

**Scenario B: Healthcare Analytics**
- Patient data processing pipelines
- Clinical reporting systems
- Research data aggregation
- Customer impact: Patient safety and regulatory compliance

**Scenario C: Financial Services**
- Transaction processing monitoring
- Risk calculation pipelines
- Regulatory reporting systems
- Customer impact: Financial losses and regulatory penalties

**Scenario D: Manufacturing IoT**
- Sensor data ingestion from factory floor
- Predictive maintenance pipelines
- Quality control data processing
- Customer impact: Production delays and safety risks

---

### Strategy Development Phase (20 minutes)

#### Framework Template:
Provide pairs with this structured template to complete:

### **1. What We Monitor (5 minutes)**
Define the key monitoring areas:

**Data Pipeline Health:**
- [ ] Pipeline execution status (success/failure)
- [ ] Processing time/latency
- [ ] Data volume trends
- [ ] Error rates and types

**Data Quality:**
- [ ] Completeness (missing records)
- [ ] Accuracy (data validation failures)  
- [ ] Freshness (data age/staleness)
- [ ] Schema changes/drift

**Infrastructure & Performance:**
- [ ] Resource utilization (CPU, memory, storage)
- [ ] Cost monitoring
- [ ] Scalability metrics
- [ ] Security events

### **2. How We Monitor (5 minutes)**
Choose tools and methods:

**Monitoring Tools:**
- Primary platform: ________________
- Dashboard tools: ________________
- Alerting method: ________________
- Log aggregation: ________________

**Monitoring Approach:**
- [ ] Real-time monitoring
- [ ] Batch/scheduled checks
- [ ] Trend analysis
- [ ] Predictive monitoring

### **3. When We Alert (5 minutes)**
Define alert thresholds and escalation:

**Critical Alerts (immediate response required):**
- Trigger: _________________________
- Notify: __________________________
- Response time: ___________________

**Warning Alerts (monitor closely):**
- Trigger: _________________________
- Notify: __________________________
- Response time: ___________________

**Information Alerts (awareness only):**
- Trigger: _________________________
- Notify: __________________________

### **4. Who Responds (3 minutes)**
Define roles and responsibilities:

**First Response Team:**
- Role: ____________________________
- Responsibilities: _________________

**Escalation Path:**
- Level 1: _________________________
- Level 2: _________________________
- Level 3: _________________________

### **5. Communication Plan (2 minutes)**
How you communicate during incidents:

**Internal Communication:**
- Method: __________________________
- Frequency: _______________________

**External Communication:**
- Stakeholders: ____________________
- Method: __________________________
- Message template: ________________

#### Facilitator Guidance During Development:
- **Circulate between pairs** - offer guidance without giving answers
- **Ask probing questions:** "What would happen if this alert fired at 2am?" "Who else needs to know when this breaks?"
- **Reference today's learning:** "Think back to the status pages - what worked well?" "How could you use what you saw in [platform] monitoring?"
- **Keep them practical:** Focus on implementable solutions, not perfect theoretical frameworks

---

### Gallery Walk & Collaboration (7 minutes)

#### Setup (1 minute):
- Each pair posts their strategy (on flip chart or shared screen)
- Pairs rotate to review others' strategies
- Provide sticky notes or digital commenting method

#### Review Process (5 minutes):
**Round 1 (2.5 minutes):** Pairs visit half the other strategies
**Round 2 (2.5 minutes):** Pairs visit remaining strategies

#### Review Focus Questions:
Encourage reviewers to consider:
- "What's one thing this strategy does better than ours?"
- "What's missing that could cause problems?"
- "How would this work in our workplace scenario?"

#### Feedback Method:
**Green sticky:** "Great idea - we should consider this"
**Yellow sticky:** "Question - what about...?"
**Red sticky:** "Potential issue - have you considered...?"

#### Report Back (1 minute):
Quick sharing: "One insight we gained from reviewing others' strategies..."

---

## Wrap-up & Reflection

### Key Questions for Group Reflection:
- "What was the hardest part about designing a monitoring strategy?"
- "What did you learn from seeing different approaches to the same problem?"
- "How does this compare to monitoring in your current workplace?"
- "What would you need to implement this strategy in real life?"

### Bridge to Tomorrow:
- "Today you've built monitoring for when things work correctly"
- "Tomorrow we'll see what happens when things break - and how good monitoring helps you respond faster"
- "Your strategy will be tested when we start breaking pipelines deliberately"

---

## Resources for Trainers

### Pre-Activity Preparation:
- **Print templates** or prepare digital versions for sharing
- **Review scenarios** - be ready to explain context if pairs have questions
- **Prepare flip chart paper** or ensure digital collaboration tools work

### Facilitator Success Tips:

**Encourage Practical Thinking:**
- "Keep it simple - what would actually work in your organization?"
- "Don't try to monitor everything - what matters most?"

**Connect to Real Experience:**
- "Think about the alerts you get now - do they help or annoy?"
- "What monitoring gaps have you experienced in your work?"

**Time Management:**
- Use visible timer for each section
- Give 2-minute warning before transitions
- Be flexible if pairs are deeply engaged but keep overall timing

### Common Challenges:

**"We don't know enough about the scenario":**
- Encourage them to make reasonable assumptions
- "What would you need to know to implement this?"

**"This seems overwhelming":**
- "Start with the most critical thing - what absolutely must work?"
- "You can always add more monitoring later"

**"We can't agree on priorities":**
- "Both perspectives might be valid - how could you accommodate both?"
- "What would your stakeholders say is most important?"

### Assessment Opportunities:
While no formal assessment, observe for:
- **S18:** Development of monitoring tools concepts
- **S19:** Risk identification thinking
- **S26:** Data quality metrics understanding
- **B3:** Quality focus and continuous improvement mindset

### Expected Outputs:
Each pair should produce:
1. **Completed monitoring strategy template**
2. **Understanding of monitoring complexity**
3. **Appreciation for different monitoring approaches**
4. **Foundation for tomorrow's incident response activities**