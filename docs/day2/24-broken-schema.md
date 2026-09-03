# Lab 2.4 ~ A File That Makes It Fail

!!! info "This lab continues from Lab 2.3. Your pipeline, `sales.csv`, and `sales1.csv` should still be in place."

`sales2.csv` - the same shape of file again, but this time it's **missing a column** compared to the others - is in the same `M6/day2/` folder on your Desktop.

## Steps

1. Open the **Load Sales** notebook and change the first cell to:

    ```python
    lab_name = "de5m6-lab24"
    ```

    !!! note
        Fabric notebooks save automatically - you don't need to explicitly save after editing this cell.

2. Upload `sales2.csv` into `Files/new_data`, alongside the two files already there.

3. Run the **Ingest Sales Data** pipeline again. Don't change it.

4. Go to **Monitor** and check the run.

## Observation Points

- This time, what happens?
- Open the failed run's details. Which activity failed, and what does the error say?
- The error comes from a check in the notebook itself, not from Spark refusing to read the file. Find that check - what is it comparing, and against what?
- Lab 2.3's bad file loaded and wrote *without* that check catching anything. What would have happened to `sales2.csv` if this check didn't exist? (A wildcard read takes its schema from one file and applies it positionally to every file it matches - it doesn't compare each file's columns to the others.)

## Discussion

- If this were a real production pipeline, how would you find out a new source file had the wrong number of columns *before* it broke a scheduled run?

---

## Relevant KSBs for this exercise

!!! abstract "S8: Identify and troubleshoot issues with data processing pipelines."

!!! abstract "K23: How to undertake analysis and root cause investigation."

!!! abstract "K22: Technology and service management best practice including configuration, change and incident management."

