# Day 1: Cloud Monitoring Comparison

## Overview
This investigation activity allows learners to explore how major cloud providers approach data monitoring, comparing different tools and philosophies. This builds on their hands-on Fabric experience and prepares them for creating their own monitoring strategy.

---

## Session Structure

### Setup Instructions (3 minutes)

#### Platform Assignments:
Assign each group one primary platform to research:

**Group 1: AWS Monitoring**
- CloudWatch (metrics, logs, dashboards)
- AWS X-Ray (distributed tracing)
- AWS Data Pipeline monitoring

**Group 2: Google Cloud Monitoring**  
- Cloud Monitoring (formerly Stackdriver)
- Cloud Logging
- Data pipeline monitoring in Cloud Composer/Dataflow

**Group 3: Azure Monitoring (beyond Fabric)**
- Azure Monitor
- Application Insights  
- Data Factory monitoring vs Fabric monitoring

**Group 4: Fabric Deep Dive** *(if enough groups)*
- Advanced Fabric monitoring features
- Integration with Azure Monitor
- Comparison with other Azure data services

---

### Research Phase (15 minutes)

#### Investigation Framework:
Provide each group with these structured research questions:

#### **Core Monitoring Capabilities:**
1. **What can you monitor?**
   - Data pipeline performance?
   - Data quality metrics?
   - Infrastructure metrics?
   - Cost/resource usage?

2. **How do you set up monitoring?**
   - Automatic vs manual configuration?
   - Built-in dashboards vs custom creation?
   - Ease of setup for data pipelines?

3. **Alerting and Notifications:**
   - What triggers can you set?
   - How are alerts delivered? (email, SMS, Slack, etc.)
   - Can you set up automated responses?

#### **Data-Specific Questions:**
4. **Data Pipeline Monitoring:**
   - Can you track data freshness/latency?
   - Schema change detection?
   - Data volume monitoring?
   - Failed job notifications?

5. **Integration and Ecosystem:**
   - How well does it integrate with other tools?
   - APIs for custom monitoring?
   - Third-party tool support?

6. **Cost and Complexity:**
   - What's the pricing model?
   - How complex is it to maintain?
   - Required expertise level?

#### **Research Resources:**
Point groups to these starting points:
- **AWS:** Search "CloudWatch data pipeline monitoring"
- **GCP:** Search "Cloud Monitoring dataflow pipeline"  
- **Azure:** Search "Azure Monitor data factory"
- **Fabric:** Microsoft Learn documentation on monitoring

#### **Research Strategy Tips:**
- Look for documentation, tutorials, and real-world examples
- Focus on data/analytics monitoring, not just general infrastructure
- Take screenshots of interesting dashboards or features
- Note what seems easy vs complex to implement

---

### Report Back Session (7 minutes)

#### Presentation Format:
Each group has **90 seconds** to share their key findings using this structure:

**30 seconds - Platform Overview:**
- "The main monitoring tool for platform X is..."
- "The best feature for data monitoring is..."

**30 seconds - Strengths:**
- "What this platform does really well is..."
- "The standout capability is..."

**30 seconds - Challenges/Gaps:**
- "The biggest limitation we found is..."
- "You'd struggle with this platform if..."

#### Key Questions for Discussion:
After all groups present, facilitate quick discussion:
- "Which approach seems most similar to what you've used in your workplace?"
- "What surprised you about the differences between platforms?"
- "If you had to choose one for a new project, what would drive your decision?"

---

### Expected Outcomes:
By the end of this activity, learners should:

1. Understand that different platforms have different monitoring philosophies
2. Recognize common patterns across cloud monitoring tools  
3. Have concrete examples of monitoring capabilities beyond what they've seen
4. Be prepared to make informed choices about monitoring approaches
