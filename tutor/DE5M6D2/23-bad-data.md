## 🧪 <mark>Lab 2.3 ~ A File That Doesn't Make It Fail</mark>

**Activities**

- Upload `sales1.csv` (mostly negative `UnitPrice`) into `Files/new_data`, alongside `sales.csv`
- Rerun the **Ingest Sales Data** pipeline, unchanged
- Check **Monitor**, then compare the new row count against Lab 2.1's

**Overview**

The pipeline succeeds - but the row count barely moves. The data quality filter from Lab 2.1 silently drops the bad rows. This is the "succeeded" trap: a green tick in Monitor doesn't mean the data did what was expected. Nothing to fix here - `sales1.csv` stays in place for Lab 2.4.

### Text for the WebEx chat

```text
## Lab 2.3 ~ Bad data received
https://qaalabs.github.io/DE5M6/day2/23-bad-data/

Lab 2.3:|https://qaalabs.github.io/DE5M6/day2/23-bad-data/
```
