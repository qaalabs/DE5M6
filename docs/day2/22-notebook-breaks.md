# Lab 2.2 ~ Break the Notebook

!!! info "This lab continues from Lab 2.1. Your pipeline, notebook, and `sales.csv` should still be in place."

## Setup

1. Open the **Load Sales** notebook and change the first cell to:

    ```python
    lab_name = "de5m6-lab22"
    ```

    !!! note
        Fabric notebooks save automatically - you don't need to explicitly save after editing this cell.

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
- In the last cell, add a new line of invalid code, for example:

    ```python
    this_is_not_a_real_variable
    ```

- Run just that cell

**Observation Points:**

- What kind of error does Spark give you?
- Does the error message point you to the exact line that's wrong?
- How is this different from a file-level error?
- Check **Monitor** - does this failure show up there? Would you have noticed it if you weren't sitting here watching it happen?

**Discussion:**

**Fix & Verify:**

- Delete the line you added
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
- Check **Monitor** - does this failure show up there? Would you have noticed it if you weren't sitting here watching it happen?

**Discussion:**

**Fix & Verify:**

- Upload the original `sales.csv` back into `Files/new_data`
- Run the notebook again to confirm it works

---

## Relevant KSBs for this exercise

!!! abstract "S8: Identify and troubleshoot issues with data processing pipelines."

!!! abstract "K23: How to undertake analysis and root cause investigation."
