# Lab 2.5 ~ Competing for Capacity

!!! info "This lab continues from Lab 2.4. Your pipeline and all three sales files should still be in place."

This one isn't about the data, or even about two things writing to the same table - it's about **capacity**. This environment runs on a small Fabric capacity (F2), and every Spark session - interactive or pipeline-triggered - has to fit within it. You're going to see what happens when that capacity is already spoken for.

---

## Setup

1. Open the **Load Sales** notebook and change the first cell to:

    ```python
    lab_name = "de5m6-lab25"
    ```

    !!! note
        Fabric notebooks save automatically - you don't need to explicitly save after editing this cell.

---

## Part 1: Trigger the same pipeline multiple times

1. Run the **Ingest Sales Data** pipeline.

2. Without waiting for it to finish, trigger it again. Then again.

3. Watch **Monitor** - you should see more than one run listed.

### Observation Points

- Do the extra runs start immediately, sit queued, or get rejected outright?
- Once they do run, do they run one at a time or genuinely in parallel?
- Does anything fail?

---

## Part 2: Hold a Spark session open, then run the pipeline

1. Create a new notebook. Don't attach it to anything in particular - it just needs one cell.

2. In that one cell, run something trivial, for example:

    ```python
    df = spark.range(10)
    df.show()
    ```

3. Run that cell, and leave the notebook open. Starting a Spark session this way holds onto capacity for a while even after the cell finishes - by default, an idle session hangs around for about 20 minutes before it's released.

4. While that session is still alive, go and run the **Ingest Sales Data** pipeline.

### Observation Points

- What happens to the pipeline run - does it start straight away, sit queued, or fail?
- Check **Monitor** for both the notebook session and the pipeline run - what does each one show?
- If it's queued, how long does it wait? Does it start once the notebook session ends (or is manually stopped)?
- How would you notice this was the cause, if you didn't already know the notebook was sitting there?

## Discussion

- On a small capacity like this one, is an idle notebook session a hidden cost you'd want to actively manage? How?
- If a scheduled production pipeline queued (or failed) because someone left a notebook running, how would you find that out - and how would you prevent it happening again?

---

## Relevant KSBs for this exercise

!!! abstract "K1: Processes to monitor and optimise the performance of the availability, management and performance of data product."

!!! abstract "S18: Develop simple forecasts and monitoring tools to anticipate or respond immediately to outages and incidents."

!!! abstract "K22: Technology and service management best practice including configuration, change and incident management."

