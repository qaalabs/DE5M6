# Day 2: Breaking Things

## Overview

This hands-on session introduces failures into your upgraded pipeline from **Breaking Setup**.
You will practice controlled troubleshooting while observing how MS Fabric responds to different types of failures.

## Part 1: Establish Working Baseline

### Setup Instructions

**Technical Setup:**

- This morning you completed [Lab 04 - Ingest Pipeline Data](../labs/04-ingest-pipeline.md)
- Earlier today you completed **Breaking Setup**, adding three standby Copy data activities and a fallback path to `Ingest Sales Data - Breaking`
- Verify the pipeline still runs successfully end-to-end before you start

### Bypass the fallback path

The fallback path you built in Breaking Setup would quietly recover from some of today's breaks - which hides the failure rather than showing it. Today's breaks should be plainly visible, so disconnect the fallback for now:

1. Select the connector running from **Copy data**'s red X (**Failure**) to **Copy Data Fallback**, and delete it.
2. Confirm **Copy data**'s green check (**Success**) is still connected to **Notebook**.
3. Save the pipeline.

*You'll reconnect this path in Complex Breaking.*

---

## Part 2: Systematic Breaking & Learning

### Break Cycle Process

For each break type, follow this 4-step cycle:

1. **Break**   - introduce the failure
2. **Observe** - run it, note error messages
3. **Discuss** - what does the error tell us?
4. **Fix**     - restore to working state

---

### Break 1: Notebook Error

The simplest break - no pipeline run needed, just the notebook itself.

**Break Instructions:**

- Open the **Load Sales** notebook
- Find the line that reads:

    ```python
    df = df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))
    ```

- Change `CustomerName` to `CustomerNam` (a deliberate typo) in both places on that line
- Run just that cell

**Observation Points:**

- What kind of error does Spark give you?
- Does the error message tell you exactly which column is missing?
- How is this different from a file-level error?

**Discussion:**

**Fix & Verify:**

- Change `CustomerNam` back to `CustomerName`
- Re-run the cell to confirm it works
- Re-run the whole notebook once, to confirm the fix took

---

### Break 2: File Not Found

**Break Instructions:**

- On the pipeline canvas, select the connector from **Delete data** to **Copy data**, and delete it
- Drag from **Delete data**'s completion connector to **Copy Data (Not Exists)**
- Drag from **Copy Data (Not Exists)**'s green check (**Success**) to **Notebook**
- Save and run the pipeline

**Observation Points:**

- How quickly can you see the error?
- What does Fabric's error message say?
- Does the error message help you identify the problem?
- Does the Notebook activity run at all?

**Discussion:**

**Fix & Verify:**

- Delete the two connectors you just added
- Reconnect **Delete data** to **Copy data**, and confirm **Copy data**'s Success connector to **Notebook** is intact
- Save and run the pipeline again to confirm it works

---

### Break 3: Schema Mismatch

**Break Instructions:**

- Reconnect **Delete data** to **Copy Data (Wrong Header)** instead of **Copy data** (same swap as Break 2)
- Connect **Copy Data (Wrong Header)**'s Success to **Notebook**
- Save and run the pipeline

**Observation Points:**

- Does the **Copy Data (Wrong Header)** activity fail, or does it succeed and pass the problem downstream to the **Notebook** activity?
- Does the error message clearly indicate a schema issue?
- Is it obvious which activity caused the problem?

**Discussion:**

**Fix & Verify:**

- Reconnect **Delete data** back to **Copy data**, and **Copy data** to **Notebook**
- Save and run the pipeline again to confirm it works

---

### Break 4: Data Quality Issues

**Break Instructions:**

- Reconnect **Delete data** to **Copy Data (Wrong Data)** (same swap again)
- Connect **Copy Data (Wrong Data)**'s Success to **Notebook**
- Save and run the pipeline

**Observation Points:**

- Does every activity show green, with no errors at all?
- Open the **new_sales** table in your lakehouse - what does the bad data actually look like once it's landed?
- If nothing failed, how would you notice this in a real production pipeline?

**Discussion:**

**Fix & Verify:**

- Reconnect **Delete data** back to **Copy data**, and **Copy data** to **Notebook**
- Save and run the pipeline again to confirm it works

---
