# Lab 2.6 ~ Stretch: Extend Your Pipeline

!!! info "This lab is for anyone who finishes Lab 2.5 early. It continues from Lab 2.5 - your pipeline, notebook, and all three sales files should still be in place."

Pick any of the stretches below - they are independent of each other, so do them in any order. Stretch 1 has full steps; the others give you a goal and a hint.

!!! warning "Stop any open notebook sessions first"
    Lab 2.5 Part 2 left a Spark session running on purpose. Stop it (or close that notebook) before you start, otherwise your pipeline runs will sit queued.

---

## Stretch 1: Track success and failure

Right now the only way to know whether the pipeline worked is to go and look in **Monitor**. You'll add two small notebooks that run *after* **Load Sales** - one on success, one on failure - so the pipeline reports its own outcome.

### Step 1: Update the lab name

1. Open the **Load Sales** notebook and change the first cell to:

    ```python
    lab_name = "de5m6-lab26"
    ```

### Step 2: Create two tracking notebooks

Neither notebook reads or writes any tables, so neither needs the lakehouse attached.

1. In the navigation pane on the left, select your workspace name to return to the workspace view.

2. Select **New item**, then search for and select **Notebook**.

3. Name the notebook: `Track Pipeline Success`

4. Replace the contents of the empty cell with:

    ```python
    import requests
    ctx = dict(notebookutils.runtime.context)
    ctx["source"] = "de5m6-lab26-PIPELINE-SUCCESS"

    try:
        requests.post("https://qapha-249748487450.us-east1.run.app/", json=ctx, timeout=5)
    except Exception:
        pass  # a dead endpoint must never fail the notebook run

    print("Pipeline succeeded")
    ```

5. Repeat steps 1-4 for a second notebook:

    - Name it: `Track Pipeline Failure`
    - Use the same cell contents, but change the `source` and `print` lines to:

        ```python
        ctx["source"] = "de5m6-lab26-PIPELINE-FAILURE"
        ```

        ```python
        print("Pipeline failed")
        ```

### Step 3: Add them to the pipeline

1. Open the **Ingest Sales Data** pipeline.

2. On the **Activities** tab, add a **Notebook** activity. Name it `Track Success` and, on the **Settings** tab, choose the `Track Pipeline Success` notebook.

3. Add a second **Notebook** activity. Name it `Track Failure` and choose the `Track Pipeline Failure` notebook.

4. Hover over the existing notebook activity (the one that runs **Load Sales**) until small coloured arrows appear at its corners:

    - Drag the **green** (on success) arrow to **Track Success**
    - Drag the **red** (on failure) arrow to **Track Failure**

5. On the **Home** tab, save the pipeline.

### Step 4: Run it - twice

1. Run the pipeline. `sales2.csv` from Lab 2.4 is still in `Files/new_data`, so **Load Sales** should fail.

2. Check the run in the **Output** pane or **Monitor**.

3. Delete `sales2.csv` from `Files/new_data` and run the pipeline again.

4. Check this run too.

### Observation Points

- In each run, which tracking activity ran, and which showed as **Skipped**?
- Look at the overall status of the *failed* run. Did adding a failure path make the pipeline run show as succeeded, or still failed? Why might that matter to whoever is watching the Monitor hub?
- Your **Load Sales** notebook already pings with `-SUCCESS` at the end. What does a separate **Track Success** activity tell you that the notebook's own ping can't?

---

## Stretch 2: Quarantine the bad file instead of failing

In Lab 2.4, one file with the wrong columns stopped *every* file from loading.

**Goal:** change the column check in **Load Sales** so a bad file is moved out of the way and the rest still load.

!!! tip "Hint"
    - Instead of `raise ValueError(...)`, move the file to a `Files/rejected` folder with `notebookutils.fs.mv(file.path, "Files/rejected/" + file.name, True)` and `print` a warning.
    - Upload `sales2.csv` again and rerun the pipeline. Is `sales2.csv` now in `Files/rejected`?

**Think about:** the pipeline now succeeds with a bad file in it. Who finds out that a file was rejected - and how?

---

## Stretch 3: Keep the rows you drop

The notebook drops rows with a missing or negative `UnitPrice` and only prints how many.

**Goal:** save the dropped rows to a `sales_rejects` table so someone can investigate them later.

!!! tip "Hint"
    - Before the filter, keep the bad rows in their own DataFrame: `rejects = df.filter(col("UnitPrice").isNull() | (col("UnitPrice") < 0))`
    - Write `rejects` to a table the same way `df` is written.

**Think about:** should `sales_rejects` use `overwrite` or `append`? What happens to the rejects from earlier runs in each case?

---

## Stretch 4: Log every run

**Goal:** add a cell at the end of **Load Sales** that writes one row per run to a `pipeline_runs` table - run time, `lab_name`, rows loaded, and rows dropped.

!!! tip "Hint"
    - Build a one-row DataFrame with `spark.createDataFrame([(...)], [...column names...])` and use `current_timestamp()` for the run time.
    - This table needs `mode("append")` - the opposite of the `sales` table. Why?

**Think about:** after a few runs, query `pipeline_runs`. Could you spot Lab 2.3's bad data from this table alone, without opening the files?

---

## Stretch 5: Pass the folder in as a parameter

**Goal:** the notebook reads from `Files/new_data` because that path is written into the code. Make the folder a pipeline setting instead.

!!! tip "Hint"
    - In **Load Sales**, put `source_folder = "Files/new_data"` in its own cell, then use the cell's **...** menu to select **Toggle parameter cell**.
    - Replace the hard-coded folder in the notebook with `source_folder`.
    - In the pipeline, select the notebook activity that runs **Load Sales**, and on the **Settings** tab add a **Base parameter** named `source_folder` (type **String**, value `Files/new_data`).

**Think about:** what could you now do with one notebook that you couldn't do before?

---

## Relevant KSBs for this exercise

!!! abstract "S4: Automate data pipelines such as batch, real-time, on demand and other processes using programming languages and data integration platforms with graphical user interfaces."

!!! abstract "S8: Identify and troubleshoot issues with data processing pipelines."

!!! abstract "S18: Develop simple forecasts and monitoring tools to anticipate or respond immediately to outages and incidents."
