# Day 3: Security & Access Governance

---

## Overview
This afternoon session shifts from data quality to data governance, focusing on security and access control. Through hands-on Lab 19 and structured discussion, learners explore how to balance data accessibility with security requirements, understanding governance as an operational discipline that enables rather than restricts business value.

---

## Session Structure

### Phase 1: Secure Data Access Lab (45 minutes)

#### Lab 19: Secure Data Access in Microsoft Fabric (45 minutes)
**Microsoft Learn Lab:** [Secure data access in Microsoft Fabric](https://docs.microsoft.com/learn/modules/secure-data-access-fabric/)

**Key Learning Focus for Today:**
While completing the lab, learners should pay attention to:
- **Workspace permissions:** Who can access what at the workspace level?
- **Item-level security:** Granular control over individual data assets
- **OneLake data access roles:** File-level security and data lake permissions
- **Row-level security:** Controlling access to specific data records

**Governance Mindset During Lab:**
As learners work through security configurations, encourage them to think:
- **Business justification:** Why would you restrict this access?
- **User experience:** How do security controls affect data consumers?
- **Operational impact:** What happens when security is too restrictive vs. too permissive?

**Facilitator Notes:**
- **Emphasize business context** over technical configuration
- **Connect to real scenarios:** "When would you use row-level security?"
- **Highlight trade-offs:** "How does security affect data accessibility?"
- **Time management:** Focus on understanding concepts over perfect setup

---

### Phase 2: Security vs. Accessibility Analysis (20 minutes)

#### Governance Trade-offs Discussion (20 minutes)

**Setup (2 minutes):**
**Facilitator Frame:**
- "You've just implemented multiple layers of data security"
- "Good governance requires balancing security with business needs"
- "Let's analyze the trade-offs and decision frameworks you just experienced"

#### Structured Analysis (15 minutes):

**Individual Reflection (5 minutes):**
Give learners this framework based on their lab experience:

```
SECURITY & ACCESSIBILITY TRADE-OFFS

WORKSPACE-LEVEL SECURITY:
□ What business scenarios require workspace restrictions?
□ How would this affect collaborative analytics work?
□ What problems could overly restrictive workspace access cause?

ITEM-LEVEL SECURITY:
□ When would you restrict access to specific datasets?
□ How does this impact self-service analytics capabilities?
□ What governance challenges arise with granular permissions?

ROW-LEVEL SECURITY:
□ What business cases justify filtering data by user?
□ How does this affect performance and user experience?
□ What alternatives exist to row-level restrictions?

GOVERNANCE DECISION FRAMEWORK:
□ How do you decide what level of security to apply?
□ Who should make these access control decisions?
□ How do you balance compliance requirements with business agility?
```

**Pair Discussion (5 minutes):**
- **Form pairs** (mix from different lab experiences if possible)
- **Share perspectives** on security trade-offs observed
- **Focus question:** "What's the biggest governance challenge you identified?"

**Group Discussion (5 minutes):**
**Facilitator-led synthesis:**

**Key Questions:**
- "Where did you see the biggest tension between security and accessibility?"
- "How would these security controls affect data scientists or analysts in your organization?"
- "What governance decisions require business stakeholder input vs. technical judgment?"

**Expected Insights to Highlight:**
- **Over-restriction kills innovation** - too much security prevents valuable analysis
- **Under-restriction creates compliance risk** - inadequate security exposes sensitive data
- **User experience matters** - complex security creates workarounds and shadow IT
- **Governance is about enabling business value** safely, not just preventing access

#### Bridge to Governance Principles (3 minutes):
**Facilitator:**
- "Security controls are just one part of data governance"
- "Good governance creates frameworks for making these trade-off decisions consistently"
- "Next we'll investigate governance approaches that balance multiple competing priorities"

---

### Phase 3: Governance Approaches Investigation (10 minutes)

#### Governance Framework Research (10 minutes)

**Setup (1 minute):**
**Research Focus:**
"Investigate how organizations structure governance to make consistent, business-aligned decisions about data access, quality, and usage"

**Team Formation:**
- **Pairs or small groups** (depending on class size)
- **Each group** investigates a different governance approach

#### Governance Approaches to Research:

**Group 1: Data Mesh Governance**
- **Concept:** Decentralized governance with domain ownership
- **Research focus:** How do domain teams balance autonomy with consistency?
- **Key question:** What governance decisions stay centralized vs. distributed?

**Group 2: Centralized Data Governance**
- **Concept:** Enterprise-wide standards and controls
- **Research focus:** How do central teams ensure compliance while enabling innovation?
- **Key question:** What are the benefits and challenges of centralized control?

**Group 3: Federated Data Governance**
- **Concept:** Shared governance across business units
- **Research focus:** How do organizations coordinate governance across multiple stakeholders?
- **Key question:** How do you resolve conflicts between different business needs?

**Group 4: Agile Data Governance**
- **Concept:** Iterative, flexible governance that evolves with business needs
- **Research focus:** How do you maintain control while adapting quickly?
- **Key question:** What governance elements can be lightweight vs. must be rigorous?

#### Research Questions (8 minutes):
For each governance approach, investigate:

**Decision-Making Structure:**
- Who makes governance decisions (access, quality standards, retention)?
- How are business priorities balanced with technical constraints?
- What escalation paths exist for governance conflicts?

**Implementation Practical:**
- How would this approach handle the security scenarios from Lab 19?
- What tools and processes support this governance model?
- How does this approach scale with organizational growth?

**Business Alignment:**
- How does this governance approach enable vs. restrict business value?
- What cultural changes are required for successful implementation?
- How do you measure governance effectiveness?

#### Quick Sharing (1 minute):
**Rapid insights:** Each group shares one key finding (15 seconds each):
- "This governance approach works best when..."
- "The biggest challenge with this model is..."
- "This would solve the problem of..."

---

## Transition to Session 4

### Bridge to Governance Framework Design (1 minute):
**Facilitator:**
- "You've seen different governance philosophies and experienced security trade-offs hands-on"
- "After the break, we'll design a practical governance framework"
- "We'll focus on creating decision-making processes that balance competing priorities"

---

## Resources for Trainers

### Pre-Session Preparation:
- **Complete Lab 19 yourself** to understand security configuration options
- **Research governance models** briefly to guide groups if needed
- **Prepare real-world examples** of governance trade-offs to reference

### Managing the Lab Phase:

**Emphasize Business Context:**
- **Connect security to scenarios:** "When would a sales team need row-level security?"
- **Highlight user impact:** "How would these restrictions affect a data analyst's daily work?"
- **Discuss implementation costs:** "What's the operational overhead of maintaining these permissions?"

**Common Lab Challenges:**
- **Technical complexity:** Focus on understanding concepts over perfect configuration
- **Permission errors:** Use as learning opportunities about governance hierarchy
- **Time management:** Ensure core security concepts are understood, skip advanced features if needed

### Facilitating Trade-offs Discussion:

**Drawing Out Business Thinking:**
- **Use specific examples:** "In the row-level security setup, what business rule determined the filtering?"
- **Challenge assumptions:** "Is restricting access always the answer to data security?"
- **Connect to workplace:** "How do these decisions get made in your organization?"

**Managing Governance Research:**
- **Keep research practical:** Focus on decision-making processes, not theoretical frameworks
- **Guide struggling groups:** Suggest looking for case studies or implementation examples
- **Time box tightly:** 8 minutes is quick research - aim for key insights, not comprehensive analysis

### Expected Learning Outcomes:

**Governance Mindset:**
- **Security as business enabler** - not just risk prevention
- **Trade-off thinking** - balancing competing priorities systematically
- **Stakeholder coordination** - governance involves business and technical perspectives

**Practical Skills:**
- **Security implementation** - hands-on experience with access controls
- **Decision frameworks** - understanding different approaches to governance choices
- **Business communication** - translating technical security to business impact

### Common Discussion Themes:

**Security Complexity:**
- Difficulty determining appropriate security levels
- User experience degradation with complex permissions
- Operational overhead of maintaining granular controls

**Governance Challenges:**
- Balancing centralized control with business agility
- Coordinating decisions across multiple stakeholders
- Measuring effectiveness of governance processes

**Business Alignment:**
- Ensuring governance supports rather than hinders business goals
- Managing conflicts between security and accessibility
- Evolving governance as business needs change

### Connection to KSBs:
- **S13:** Use data systems securely to meet requirements and in line with organizational procedures
- **K10:** Concepts of data governance, including regulatory requirements, data privacy, security
- **S22:** Develop collaborative relationships with stakeholders (business vs. technical needs)
- **K13:** Implications of security, scalability, compliance regarding local, remote or distributed solutions
- **B2:** Works collaboratively with stakeholders to achieve common goals

### Time Management Tips:
- **Lab phase:** Monitor progress, assist with conceptual understanding over technical details
- **Discussion phase:** Use structured reflection to maximize learning from lab experience
- **Research phase:** Encourage rapid insight gathering over comprehensive research
- **Keep transitions crisp:** Each phase builds toward practical governance framework design
