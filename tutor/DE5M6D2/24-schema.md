## 🧪 <mark>Lab 2.4 ~ A File That Makes It Fail</mark>

Continues from Lab 2.3 - `sales.csv` and `sales1.csv` should already be in place.

### Activities

- Upload `sales2.csv` (missing a column) into `Files/new_data`, alongside the other two
- Rerun the **Ingest Sales Data** pipeline, unchanged
- Check **Monitor** - this time it fails

### Overview

A missing column breaks the multi-file wildcard read itself, before the data quality filter ever runs - contrast with Lab 2.3, where a bad *value* didn't stop the pipeline but a missing *column* does. Discuss: how would you catch a malformed source file before it breaks a scheduled run in production?
