# Day 2: Breaking Things

---

## Overview
This hands-on session introduces failures into working data pipelines.
You will practice controlled troubleshooting while observing how MS Fabric responds to different types of failures.

---

## Part 1: Establish Working Baseline

### Setup Instructions

**Technical Setup:**

- Start the QA Platform Lab enviroment
- Redo [Lab 1 - Ingest Data](../labs/04-ingest-pipline.md) from yesterday
- Verify that the data flows through successfully

---

## Part 2: Systematic Breaking & Learning

### Break Cycle Process
For each break type, follow this 4-step cycle:

1. **Break**   - introduce the failure
2. **Observe** - run pipeline, note error messages
3. **Discuss** - what does the error tell us?
4. **Fix**     - restore to working state

---

### Break 1: File Not Found

**Break Instructions:**

- Navigate to your source data file
- Rename it - add '_broken' to the filename
- Now try to run your pipeline

**Observation Points:**

- How quickly can you see the error?
- What does Fabric's error message say?
- Does the error message help you identify the problem?
- Is it clear what needs to be fixed?

**Discussion:**

**Fix & Verify:**

- Rename the file back to original name
- Run pipeline again to confirm it works

---

### Break 2: Schema Mismatch

**Break Instructions:**

- Open your source CSV file
- Delete one of the column headers (not the data, just the header)
- Save the file and run your pipeline

**Observation Points:**

- Does the error message clearly indicate schema issues?
- How long does it take to identify the problem?
- Is the difference clear between this and the file error?

**Discussion:**

**Fix & Verify:**

- Add the column header back
- Verify pipeline works again

---

### Break 3: Data Quality Issues

**Break Instructions:**

- In your CSV, find a numeric column
- Change some numbers to text (like 'ERROR' or 'N/A')
- Save and run pipeline

**Observation Points:**
- Does Fabric handle data type mismatches gracefully?
- What happens to the bad data - does it get skipped or cause total failure?

**Discussion:**

**Fix & Verify:**
- Fix the data values back to numbers
- Confirm everything works

---
