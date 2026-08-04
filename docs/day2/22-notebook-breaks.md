# Lab 2.2 ~ Break the Notebook

!!! info "This lab continues from Lab 2.1. Your pipeline, notebook, and `sales.csv` should still be in place."

Two quick, fully reversible breaks - neither one needs a new file, just the notebook you already built.

### Break Cycle Process

For each break, follow this 4-step cycle:

1. **Break**   - introduce the failure
2. **Observe** - run it, note error messages
3. **Discuss** - what does the error tell us?
4. **Fix**     - restore to working state

---

## Break 1: Notebook Error

The simplest break - no file changes needed, just the notebook itself.

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

## Break 2: File Not Found

**Break Instructions:**

- In `Files/new_data`, delete `sales.csv` so the folder is empty
- Run the **Load Sales** notebook

**Observation Points:**

- Which cell fails - the read, or something later?
- What does the error message say?
- Does it tell you the folder is empty, or just that nothing matched?

**Discussion:**

**Fix & Verify:**

- Upload the original `sales.csv` back into `Files/new_data`
- Run the notebook again to confirm it works

---

!!! abstract "S8: Identify and troubleshoot issues with data processing pipelines."

!!! abstract "K23: How to undertake analysis and root cause investigation."
