# Day 2: Breaking Setup

## Overview

Before today's breaking exercises, you'll upgrade this morning's pipeline with two things:

- **Three standby Copy data activities** - each pre-built and pointed at a different broken source, sitting ready on the canvas so today's exercises are about wiring them in, not building them live.
- **A fallback path** - a fourth Copy data activity, wired in so it only runs if the main one fails.

Nothing in this session breaks anything yet. By the end you'll have re-run the pipeline and confirmed it still works exactly as it did this morning - just with more pieces in place, ready for **Breaking Things** and **Complex Breaking**.

---

## Part 1: Protect your working pipeline

1. In your workspace, find the **Ingest Sales Data** pipeline from Lab 04.

2. In its **...** menu, select **Duplicate**.

3. Rename the copy to `Ingest Sales Data - Breaking`.

4. Open the duplicate. All remaining steps happen here - your original pipeline stays untouched as a working reference.

---

## Part 2: Add three standby Copy data activities

A Copy data activity can only point at one connection - so instead of one activity you swap connections on, you need one activity per broken source. Add three more Copy data activities to the canvas, position them off to the side away from the main flow, and leave them disconnected for now.

| Activity name | Connection URL | Represents |
|---|---|---|
| `Copy Data (Not Exists)` | `https://raw.githubusercontent.com/qaalabs/files/main/msfabric/sales-does-not-exist.csv` | File not found |
| `Copy Data (Wrong Header)` | `https://raw.githubusercontent.com/qaalabs/files/main/msfabric/sales-wrong-header.csv` | Schema mismatch |
| `Copy Data (Wrong Data)` | `https://raw.githubusercontent.com/qaalabs/files/main/msfabric/sales-wrong-data.csv` | Data quality issues |

**For each row in the table:**

1. On the **Activities** tab, add a **Copy data** activity to the canvas, positioned away from the existing activities.

2. Select the new activity, then in the pane below the canvas, on the **General** tab, set **Name** to match the table.

3. Configure its **Source** tab:
    - **Connection**: select **Browse all**, search for **HTTP**, and create a new connection using the **URL** from the table
        - **Connection name**: a short name matching the activity, e.g. `sales-not-exists`
        - **Data gateway**: (none)
        - **Authentication kind**: Anonymous
        - **Privacy level**: None
    - **File format**: DelimitedText, with the same file format settings as your original Copy data activity

4. Configure its **Destination** tab - identical to your original Copy data activity:
    - **Connection**: your lakehouse
    - **Root folder**: Files
    - **File path**: `new_data` / `sales.csv`
    - **File format**: DelimitedText

5. Don't connect it to anything yet.

!!! info "Why leave these disconnected?"
    These three are standalone, ready-built activities, not switches on the main one. Today's breaking exercises will have you wire one in at a time - in place of the main Copy data activity - then disconnect it again to restore the working pipeline.

---

## Part 3: Add a fallback Copy data activity

1. On the **Activities** tab, add another **Copy data** activity to the canvas.

    - Fabric will name it `Copy data1` by default - rename it, otherwise you'll end up with `Copy data1`, `Copy data2` etc. that are hard to tell apart later.

2. Select the new activity, then in the pane below the canvas, on the **General** tab, set **Name** to `Copy Data Fallback`.

3. Configure its **Source** tab:
    - **Connection**: `sales` (the original, working connection)
    - **File format**: DelimitedText, same file format settings as your original Copy data activity

4. Configure its **Destination** tab - identical to your original Copy data activity:
    - **Connection**: your lakehouse
    - **Root folder**: Files
    - **File path**: `new_data` / `sales.csv`
    - **File format**: DelimitedText

---

## Part 4: Wire the fallback path

Each activity has small connector icons on its right edge: a green check (**Success**), a red X (**Failure**), and a blue circular arrow (**Completion**).

1. Select the connector line currently running from **Copy data** to **Notebook** and delete it.

2. Drag from **Copy data**'s green check (**Success**) to **Notebook**.

3. Drag from **Copy data**'s red X (**Failure**) to **Copy Data Fallback**.

4. Drag from **Copy Data Fallback**'s green check (**Success**) to **Notebook**.

Your pipeline shape should now be:

```
Delete data --(Completion)--> Copy data --(Success)-----------------> Notebook
                                  |
                                  --(Failure)--> Copy Data Fallback --(Success)--> Notebook
```

---

## Part 5: Verify it still works

1. Confirm the main **Copy data** activity's Connection is set to `sales`.

2. Save the pipeline.

3. Run it, and wait for all activities to complete.

4. Confirm the run succeeds end-to-end, the same as it did this morning - **Copy Data Fallback** should not run, since the main **Copy data** activity succeeds.

You now have a pipeline with pre-built alternate sources and a fallback path, ready for today's breaking exercises.

