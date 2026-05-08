# Day 3: Medallion Architecture & Quality Patterns

---

## Overview

This session combines hands-on experience with medallion architecture (Lab 3b) and structured analysis of how quality patterns are implemented in data architecture. Learners see how the DMBOK quality dimensions they studied earlier are addressed through bronze, silver, and gold layer design, then investigate modern quality tools and approaches.

---

## Session Structure

### Phase 1: Medallion Architecture Lab (45 minutes)

#### Lab 3b: Create a Medallion Architecture (45 minutes)

**Microsoft Learn Lab:** [Create a medallion architecture in a Fabric lakehouse](https://docs.microsoft.com/learn/modules/create-medallion-architecture-fabric-lakehouse/)

**Key Learning Focus for Today:**

While completing the lab, learners should pay attention to:

- **Bronze layer:** Raw data ingestion - what quality issues exist here?
- **Silver layer:** Data cleaning and validation - what quality improvements happen?
- **Gold layer:** Business-ready data - what quality standards are enforced?

**Facilitator Notes:**

- **Circulate during lab** to highlight quality aspects as learners work
- **Point out quality transformations:** "Notice how the silver layer handles missing values"
- **Connect to DMBOK:** "This validation step addresses which quality dimension?"
- **Time management:** Keep lab moving - focus on completion over perfection

---

### Phase 2: Quality Patterns Analysis (20 minutes)

#### Medallion Quality Mapping Discussion (20 minutes)

**Setup (2 minutes):**

**Facilitator Frame:**

- "You've just built a medallion architecture hands-on"
- "Now let's analyze how this pattern addresses the DMBOK quality dimensions you studied earlier"
- "We'll map specific quality improvements to each layer"

#### Structured Quality Analysis (15 minutes):

**Individual Reflection (5 minutes):**
Give learners this framework to complete based on their lab experience:

```none
MEDALLION QUALITY MAPPING

BRONZE LAYER - Raw Data:
□ What quality issues did you observe in the raw data?
□ Which DMBOK dimensions had problems here?
□ What was preserved "as-is" and why?

SILVER LAYER - Cleaned Data:  
□ What quality transformations happened in silver?
□ Which DMBOK dimensions were improved?
□ What validation rules were applied?

GOLD LAYER - Business-Ready Data:
□ What additional quality standards were enforced?
□ Which DMBOK dimensions reached "production quality"?
□ What business rules ensured fitness for purpose?

QUALITY PATTERNS OBSERVED:
□ How does this layered approach handle different quality requirements?
□ What are the trade-offs between layers?
□ Where would you add additional quality checks?
```

**Pair Discussion (5 minutes):**

- **Share findings** with a partner (different from morning DMBOK pairs)
- **Compare observations** about quality transformations
- **Identify** one quality improvement they found most effective

**Group Discussion (5 minutes):**
**Facilitator-led analysis:**

**Key Questions:**

- "Which DMBOK dimensions were most improved by the silver layer transformations?"
- "What quality trade-offs did you notice between preserving raw data and cleaning it?"
- "Where would you add additional quality checks if this was a production system?"

**Expected Insights to Highlight:**

- **Bronze preserves completeness** but may sacrifice accuracy
- **Silver improves accuracy and consistency** through validation and standardization
- **Gold ensures fitness for purpose** through business rule application
- **Different layers serve different quality needs** - exploration vs. reporting vs. analytics

#### Bridge to Quality Tools (3 minutes):

**Facilitator:**

- "The medallion pattern gives you architecture for quality improvement"
- "But you need tools to implement and monitor these quality standards"
- "Next we'll investigate modern data quality tools that can automate what you just did manually"

---

### Phase 3: Quality Tools Investigation (10 minutes)

#### Modern Data Quality Tools Research (10 minutes)

**Setup (1 minute):**

**Research Focus:**

"Investigate tools that could automate the quality checks you just implemented in the medallion architecture"

**Team Formation:**

- **Pairs or individuals** (depending on class size)
- **Each pair/person** takes a different tool category

#### Tool Categories to Research:

**Category 1: Data Quality Frameworks**

- **Great Expectations:** Python-based data validation framework
- **dbt tests:** Built-in and custom data quality tests
- **Focus:** How do these tools implement quality checks similar to your silver layer transformations?

**Category 2: Cloud-Native Quality Tools**

- **Azure Data Quality (in Fabric/Synapse):** Built-in quality monitoring
- **AWS Glue DataBrew:** Visual data quality profiling
- **Focus:** How do cloud platforms handle quality monitoring and alerting?

**Category 3: Quality Monitoring & Observability**

- **Monte Carlo:** Data observability and quality monitoring
- **Datadog Data Streams:** Real-time quality monitoring
- **Focus:** How do these tools detect quality issues automatically?

**Category 4: Open Source Quality Solutions**

- **Apache Griffin:** Data quality platform
- **DataHub:** Data discovery with quality insights
- **Focus:** How do open source tools provide cost-effective quality solutions?

#### Research Questions (8 minutes):

For each tool category, investigate:

**Implementation Approach:**

- How would this tool integrate with a medallion architecture?
- What quality checks could be automated?
- How does it compare to manual validation?

**Quality Dimensions Covered:**

- Which DMBOK dimensions does this tool address best?
- What types of quality issues would it catch/miss?
- How does it handle quality monitoring vs. quality improvement?

**Practical Considerations:**

- What skills/resources needed for implementation?
- How does it fit with Microsoft Fabric/Azure ecosystem?
- What would be the first quality check you'd implement?

#### Quick Sharing (1 minute):

**Rapid insights:** Each pair/person shares one key finding (15 seconds each):

- "The most interesting capability we found was..."
- "This tool would solve the problem of..."
- "The biggest implementation challenge would be..."

---

## Transition to Afternoon

### Bridge to Security & Governance (1 minute):

**Facilitator:**

- "This morning you've focused on data quality - ensuring data meets standards"
- "This afternoon we'll explore governance - ensuring the right people can access the right data safely"
- "Quality and governance work together - high-quality data that's not properly secured and governed can't deliver business value"

---

## Resources for Trainers

### Pre-Session Preparation:

- **Complete Lab 3b yourself** to understand quality transformation points
- **Research quality tools** briefly to guide learners if they struggle
- **Prepare quality examples** from the lab to highlight during discussion

### Managing the Lab Phase:

**Keep Quality Focus:**

- **Point out quality improvements** as they happen: "Notice how this addresses accuracy"
- **Connect to DMBOK:** Reference morning's framework throughout
- **Time management:** Ensure lab completion within 45 minutes

**Common Lab Issues:**

- **If learners struggle with technical steps:** Focus on understanding the quality patterns rather than perfect execution
- **If lab runs long:** Guide them to complete bronze and silver layers, skip gold if necessary
- **If learners finish early:** Have them analyze additional quality improvement opportunities

### Facilitating Quality Discussion:

**Drawing Out Insights:**

- **Use specific examples** from the lab: "What happened to the invalid dates in silver layer?"
- **Connect to workplace:** "How does this compare to quality processes in your organization?"
- **Highlight trade-offs:** "Why keep raw data in bronze if it has quality issues?"

**Managing Tools Research:**

- **Keep research focused** on practical implementation rather than deep technical details
- **Guide struggling researchers:** Suggest looking for case studies or getting-started guides
- **Connect to medallion:** "How would this tool fit into the architecture you just built?"

### Expected Learning Outcomes

**Practical Understanding:**

- **Quality patterns in action** - seeing DMBOK dimensions addressed through architecture
- **Tool awareness** - knowing what modern quality solutions exist
- **Implementation thinking** - connecting theory to practical application

**Quality Mindset:**

- **Layered quality approach** - different standards for different purposes
- **Automation possibilities** - tools can implement quality checks at scale
- **Integration considerations** - quality tools work within broader data architecture

### Connection to KSBs:

- **K4:** Frameworks for data quality (DMBOK applied to architecture)
- **S26:** Identify data quality metrics and track them (quality tools investigation)
- **S6:** Systematically clean, validate, and describe data at ETL stages (medallion lab)
- **S25:** Assess gaps in existing tools and technologies (quality tools research)
- **B3:** Quality focus that promotes continuous improvement (throughout session)

### Time Management Tips:

- **Lab phase:** Use timer, keep groups moving together
- **Discussion phase:** Limit individual reflection to 5 minutes max
- **Research phase:** Encourage "good enough" research over perfect analysis
- **Sharing:** Use strict time limits for rapid knowledge sharing
