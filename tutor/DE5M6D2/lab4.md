## 🧪 <mark>Lab 04 ~ Ingest Data with a Rerunnable Pipeline</mark>

<span style="background-color: orange;">Give learners the link:</span>
https://qaalabs.github.io/DE5M6/labs/04-ingest-pipeline/

### Activities

- Create a workspace
- Create a lakehouse
- Upload `sales.csv` (trainer-provided)
- Create a notebook - reads `Files/new_data/*.csv`, drops rows with a missing/negative `UnitPrice`, writes with `overwrite` + `overwriteSchema`
- Build a pipeline wrapping the notebook
- Run it, check **Monitor**, note the row count

### Overview

This pipeline is deliberately built to be **rerun unchanged** later today, against different versions of the source data (Lab 2.2 and Lab 2.3). The wildcard read and `overwrite`/`overwriteSchema` write are what make that possible - make sure learners understand *why* before moving on, not just that it works.

