# Lab 2.3 ~ A File That Doesn't Make It Fail

!!! info "This lab continues from Lab 2.2. Your pipeline and `sales.csv` should still be in place."

From here on you're rerunning the **exact same pipeline, unchanged** - new files land alongside the ones already there, nothing gets deleted between labs.

`sales1.csv` - the same shape of file as `sales.csv`, but most of the rows have a negative `UnitPrice` - is in the same `M6/day2/` folder on your Desktop.

## Steps

1. Upload `sales1.csv` into `Files/new_data`, **alongside** `sales.csv` - don't delete anything.

2. Run the **Ingest Sales Data** pipeline again. Don't change it.

3. Go to **Monitor** and check the run.

4. Open the `sales` table and check the row count.

## Observation Points

- Did the pipeline run succeed or fail?
- Compare the new row count to the one you noted down in Lab 2.1. Did it go up by roughly the number of rows in `sales1.csv`?
- If not - where did those rows go? Check the notebook's printed output from this run.
- The pipeline reported success. Does "succeeded" mean "did what we wanted"?

## Record it

| Run     | Input        | Row count |
|---------|--------------|-----------|
| Lab 2.1 | sales.csv    |           |
| Lab 2.3 | + sales1.csv |           |

## Discussion

*Nothing to fix here - this file stays, ready for Lab 2.4.*

---

## Relevant KSBs for this exercise

!!! abstract "S26: Identify data quality metrics and track them to ensure the quality, accuracy and reliability of the data product."

!!! abstract "S6: Systematically clean, validate, and describe data at all stages of extract, transform, load (ETL)."

!!! abstract "K23: How to undertake analysis and root cause investigation."
