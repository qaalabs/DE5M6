## <mark>Break things systematically</mark>

<span style="background-color: orange;">Give learners the link:</span> https://qaalabs.github.io/DE5M6/day2/breaking-things/

First two are quick, reversible, notebook-only warm-ups. Last two are the real exercise - rerun the **same pipeline from Lab 04, unchanged** each time, with new files landing alongside the old ones in `Files/new_data`. Nothing gets deleted between Lab 2.2 and 2.3.

### Break 1: Notebook Error (typo)

- Break `CustomerName` -> `CustomerNam` in the notebook, run just that cell, observe, fix

### Break 2: File Not Found

- Delete `sales.csv` from `Files/new_data`, run the notebook, observe, restore the file

### Lab 2.2: Data That Doesn't Look Wrong at First

- Upload `sales1.csv` (mostly negative `UnitPrice`) alongside `sales.csv`
- Rerun the pipeline - it succeeds, but the row count barely moves
- The data quality filter from Lab 04 silently drops the bad rows

### Lab 2.3: Data That Breaks the Read

- Upload `sales2.csv` (missing a column) alongside the other two
- Rerun the pipeline - this time it **fails**
- Investigate why in **Monitor**: a missing column breaks the multi-file read itself, before the data quality filter ever runs

<span style="background-color: orange;">Go to the **Monitor** tab to see what is happening</span>