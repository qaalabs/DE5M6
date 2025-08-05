# Quality Tools Investigation

## Modern Data Quality Tools Research

**Research Focus:**

"Investigate tools that could automate the quality checks you just implemented in the medallion architecture"

**Team Formation:**

- **Pairs or individuals** (depending on class size)
- **Each pair/person** takes a different tool category

## Tool Categories to Research

### Group 1: Data Quality Frameworks

- **Great Expectations:** Python-based data validation framework
- **dbt tests:** Built-in and custom data quality tests
- **Focus:** How do these tools implement quality checks similar to your silver layer transformations?

### Group 2: Cloud-Native Quality Tools

- **Azure Data Quality (in Fabric/Synapse):** Built-in quality monitoring
- **AWS Glue DataBrew:** Visual data quality profiling
- **Focus:** How do cloud platforms handle quality monitoring and alerting?

### Group 3: Quality Monitoring & Observability

- **Monte Carlo:** Data observability and quality monitoring
- **Datadog Data Streams:** Real-time quality monitoring
- **Focus:** How do these tools detect quality issues automatically?

### Group 4: Open Source Quality Solutions

- **Apache Griffin:** Data quality platform
- **DataHub:** Data discovery with quality insights
- **Focus:** How do open source tools provide cost-effective quality solutions?

---

## Research Questions

**For each tool category, investigate:**

### Implementation Approach

- How would this tool integrate with a medallion architecture?
- What quality checks could be automated?
- How does it compare to manual validation?

### Quality Dimensions Covered

- Which DMBOK dimensions does this tool address best?
- What types of quality issues would it catch/miss?
- How does it handle quality monitoring vs. quality improvement?

### Practical Considerations

- What skills/resources needed for implementation?
- How does it fit with Microsoft Fabric/Azure ecosystem?
- What would be the first quality check you'd implement?

---

## Report Back

**Rapid insights:** Each pair/person shares one key finding (15 seconds each):

- "The most interesting capability we found was..."
- "This tool would solve the problem of..."
- "The biggest implementation challenge would be..."

---

## Transition to Afternoon

### Bridge to Security & Governance

**Facilitator:**

- "This morning you've focused on data quality - ensuring data meets standards"
- "This afternoon we'll explore governance - ensuring the right people can access the right data safely"
- "Quality and governance work together - high-quality data that's not properly secured and governed can't deliver business value"

---

## Resources for Trainers

### Expected Learning Outcomes

**Practical Understanding:**

- **Quality patterns in action** - seeing DMBOK dimensions addressed through architecture
- **Tool awareness** - knowing what modern quality solutions exist
- **Implementation thinking** - connecting theory to practical application

**Quality Mindset:**

- **Layered quality approach** - different standards for different purposes
- **Automation possibilities** - tools can implement quality checks at scale
- **Integration considerations** - quality tools work within broader data architecture
