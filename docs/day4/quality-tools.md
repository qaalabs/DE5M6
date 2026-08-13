# Quality Tools Investigation

!!! abstract "S25: Assess and identify gaps in existing tools and technologies in respect of implementing changes required."

!!! abstract "K28: Continuous improvement including how to: capture good practice and lessons learned."

## Tool Categories to Research

### Group A: Data Quality Frameworks

For example:

- **Great Expectations:** Python-based data validation framework
- **dbt tests:** Built-in and custom data quality tests
- Soda Core: monitoring and operational data quality (SQL/YAML-based data quality checks)

❓ How do these tools implement quality checks?

!!! tip "Think about:"
    - validation rules
    - null or duplicate checking
    - schema enforcement
    - automated testing
    - integration into ETL pipelines

---

### Group B: Cloud-Native Quality Tools

For example:

- **Azure Data Quality (in Fabric/Synapse):** Built-in quality monitoring
- **AWS Glue DataBrew:** Visual data quality profiling
- Google Dataplex: More for profiling, validation, and monitoring

❓ How do cloud platforms handle quality monitoring and alerting?

!!! tip "Think about:"
    - dashboards and monitoring
    - profiling and statistics
    - automated alerts
    - integration with cloud services
    - ease of use for teams


---

### Group C: Quality Monitoring & Observability

For example:

- **Monte Carlo:** Data observability and quality monitoring
- **Datadog Data Streams:** Real-time quality monitoring
- Soda Cloud: Continuous data quality monitoring and alerts
- Bigeye: Automated monitoring and alerting

❓ How do these tools detect quality issues automatically?

!!! tip "Think about:"
    - freshness issues
    - schema changes
    - unexpected spikes/drops
    - pipeline failures
    - missing or duplicate data

---

### Group D: Open Source Quality Solutions

For example:

- **Apache Griffin:** Data quality platform
- **DataHub:** Data discovery with quality insights
- **OpenMetadata**: Metadata platform with built-in data quality checks

❓ How do open source tools provide cost-effective quality solutions?

!!! tip "Think about:"
    - licensing and cost
    - community support
    - scalability
    - customisation
    - technical skills required


---

## Research Guidelines

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

## Teach Back

- Each person presents what they have found.
- If possible, try and link the tool back to the [*Dimensions of Data Quality*](../day3/quality-dimensions.md) covered earlier.

