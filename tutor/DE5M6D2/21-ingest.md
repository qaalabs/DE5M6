## 🧪 <mark>Lab 2.1 ~ Ingest Data with a Rerunnable Pipeline</mark>

### Activities

- Create a workspace
- Create a lakehouse
- Upload `sales.csv` (from the `M6` repo they cloned earlier) into `Files/new_data`
- Create a notebook - reads `Files/new_data/*.csv`
- Stop the notebook's Spark session
- Build a pipeline wrapping the notebook
- Run it, check **Monitor**, note the row count

### Text for the WebEx chat
```text
## Lab 2.1 ~ Rerunnable Pipeline
https://qaalabs.github.io/DE5M6/day2/21-ingest-pipeline/

Lab 2.2:|https://qaalabs.github.io/DE5M6/day2/21-ingest-pipeline/
```
---

### Overview

This pipeline is deliberately built to be **rerun unchanged** for the rest of the morning, against different versions of the source data (Lab 2.2 through 2.5). Two design choices make that possible: the notebook reads *every* file currently in `Files/new_data` via wildcard, and it writes with `overwrite`/`overwriteSchema` rather than `append`. Make sure learners understand *why* before moving on, not just that it works.
