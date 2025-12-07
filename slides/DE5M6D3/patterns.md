## <mark>How do DMBOK dimensions map to bronze/silver/gold?</mark>

*When we talk about bronze, silver, gold layers, what does ‘quality’ mean at each stage?*

### Bronze (raw / ingestion layer)

  * What dimensions are realistic here? (e.g. *timeliness*, *integrity*, *uniqueness*)
  * Should we enforce *accuracy* or *validity* at this stage, or just land the data "as is"?

### Silver (curated / cleansed layer)

  * Which dimensions are most relevant here? (e.g. *consistency*, *accuracy*, *validity*)
  * How does *completeness* get handled — are missing values imputed or flagged?

### Gold (business-ready / semantic layer)

  * Which are non-negotiable here? (e.g. *accuracy*, *consistency*, *timeliness*, *uniqueness*)
  * Should *fitness for purpose* be treated as a quality dimension here?

---

### Debate / Stretch Questions

- Is there a risk in pushing too much quality work down into bronze - does it slow down ingestion?
- Which dimensions are ‘absolute’ (must always hold) vs ‘relative’ (depend on business context)?
- Where would you handle deduplication - bronze or silver?
- Would you ever expose bronze data to end users? If so, what quality risks arise?
- If gold data has very high quality, does that excuse poor bronze data quality?

### Closing Prompt

*If you had to prioritise just one DMBOK dimension at each layer (bronze/silver/gold), which would you choose, and why?*
