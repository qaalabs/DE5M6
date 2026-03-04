# Day 2: Breaking Things

## Overview

This hands-on session introduces failures into working data pipelines.
You will practice controlled troubleshooting while observing how MS Fabric responds to different types of failures.

## Part 1: Establish Working Baseline

### Setup Instructions

**Technical Setup:**

- This morning you did [Lab 2.1 - Ingest Pipeline Data](../labs/04-ingest-pipeline.md)
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

- Navigate to your source data URL
- Rename it - add `_broken` to the filename
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

Change your source URL to:

- https://raw.githubusercontent.com/qaalabs/files/main/msfabric/sales-wrong-header.csv

*This file has the wrong number of column headers*

Run your pipeline

**Observation Points:**

- Does the error message clearly indicate schema issues?
- How long does it take to identify the problem?
- Is the difference clear between this and the file error?

**Fix & Verify:**

- Change back to the original URL
- Verify pipeline works again

Run your pipeline and observe the errors.

---

### Break 3: Data Quality Issues

**Break Instructions:**

Change your source URL to:

- https://raw.githubusercontent.com/qaalabs/files/main/msfabric/sales-wrong-data.csv

*This file has incorrect data - like text in number columns and missing fields*

Save and run the pipeline.

**Observation Points:**

- Does Fabric handle data type mismatches gracefully?
- What happens to the bad data - does it get skipped or cause total failure?

**Fix & Verify:**

- Change back to the original URL
- Confirm everything works

