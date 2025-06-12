# Day 2: Breaking Things 101

---

## Overview
This hands-on session builds operational confidence by deliberately introducing failures into working data pipelines. Learners practice controlled troubleshooting while observing how Fabric responds to different types of failures. The systematic approach moves from simple to complex breaks, building diagnostic skills.

---

## Session Structure

### Phase 1: Establish Working Baseline (15 minutes)

#### Setup Instructions (3 minutes):
**Facilitator Introduction:**

- We're going to deliberately break things today - this is how you learn to fix real problems
- Rule 1: We break one thing at a time so we know what caused each error
- Rule 2: We fix each break before moving to the next one
- Rule 3: We observe and discuss what Fabric tells us about each failure

**Technical Setup:**

- Start the QA Platform enviroment
- Run [labs/04-ingest-pipline.md] from yesterday
- **Goal:** Everyone has a working pipeline before we start breaking

#### Baseline Verification (10 minutes):
**Individual Work:**

- Each learner runs their Lab 4 pipeline end-to-end
- Verify data flows through successfully
- Check that monitoring from yesterday's labs still shows activity

**Group Check-in (2 minutes):**

- Hands up when your pipeline is working
- Quick troubleshoot any learners having issues
- Now we know what 'working' looks like - let's break it!

---

### Phase 2: Systematic Breaking & Learning (25 minutes)

#### Break Cycle Process:
For each break type, follow this 4-step cycle:

1. **Break** (2-3 minutes) - introduce the failure
2. **Observe** (2-3 minutes) - run pipeline, note error messages
3. **Discuss** (1-2 minutes) - what does the error tell us?
4. **Fix** (1-2 minutes) - restore to working state

---

#### Break 1: File Not Found (7 minutes total)

**Break Instructions (3 minutes):**

- Navigate to your source data file
- Rename it - add '_broken' to the filename
- Now try to run your pipeline

**Observation Points:**

- How quickly can you see the error?
- What does Fabric's error message say?
- Does the error message help you identify the problem?
- Is it clear what needs to be fixed?

**Discussion (2 minutes):**

**Fix & Verify (2 minutes):**

- Rename the file back to original name
- Run pipeline again to confirm it works

---

#### Break 2: Schema Mismatch (8 minutes total)

**Break Instructions (4 minutes):**

- Open your source CSV file
- Delete one of the column headers (not the data, just the header)
- Save the file and run your pipeline

**Observation Points:**

- Does the error message clearly indicate schema issues?
- How long does it take to identify the problem?
- Is the difference clear between this and the file error?

**Discussion (2 minutes):**

**Fix & Verify (2 minutes):**

- Add the column header back
- Verify pipeline works again

---

#### Break 3: Data Quality Issues (10 minutes total)

**Break Instructions (5 minutes):**

- In your CSV, find a numeric column
- Change some numbers to text (like 'ERROR' or 'N/A')
- Save and run pipeline

**Observation Points:**
- Does Fabric handle data type mismatches gracefully?
- What happens to the bad data - does it get skipped or cause total failure?

**Discussion (3 minutes):**

**Fix & Verify (2 minutes):**
- Fix the data values back to numbers
- Confirm everything works

---

