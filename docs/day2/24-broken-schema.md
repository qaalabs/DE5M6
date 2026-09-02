# Lab 2.4 ~ A File That Makes It Fail

!!! info "This lab continues from Lab 2.3. Your pipeline, `sales.csv`, and `sales1.csv` should still be in place."

`sales2.csv` - the same shape of file again, but this time it's **missing a column** compared to the others - is in the same `M6/day2/` folder on your Desktop.

## Steps

1. Upload `sales2.csv` into `Files/new_data`, alongside the two files already there.

2. Run the **Ingest Sales Data** pipeline again. Don't change it.

3. Go to **Monitor** and check the run.

## Observation Points

- This time, what happens?
- Open the failed run's details. Which activity failed, and what does the error say?
- Why did a *missing column* cause a failure when a *bad value* (Lab 2.3) didn't?
- The pipeline is reading three files as one wildcard match - what does that tell you about how Spark expects files matched by the same pattern to line up with each other?

## Discussion

- If this were a real production pipeline, how would you find out a new source file had the wrong number of columns *before* it broke a scheduled run?

---

!!! abstract "S8: Identify and troubleshoot issues with data processing pipelines."

!!! abstract "K23: How to undertake analysis and root cause investigation."

!!! abstract "K22: Technology and service management best practice including configuration, change and incident management."

