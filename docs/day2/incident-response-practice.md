# Day 2: Advanced Breaking Scenarios

---

## Overview
Building on the previous exercise simple breaks (file renames, schema changes), this session suggests more complex failure scenarios that mirror real-world production issues. Work individually to create and observe performance problems, data corruption, and resource constraint scenarios, developing skills for handling sophisticated operational challenges.

---

## Session Structure

### Scenario 1: Performance Issues

#### Setup:
**Context:** "Large files and complex processing can cause timeouts and resource issues"

**Breaking Method:**

- Find or create a **much larger dataset** than used in Lab 4
- Options:
  - Duplicate your existing file multiple times to create a large CSV
  - Use online sample datasets (sales data, sensor data, etc.)
  - Create synthetic data with repeated rows

**Target:** File should be significantly larger than morning's examples (aim for 10x+ size)

#### Execution & Observation:
**Break Process:**

1. **Replace your pipeline's source** with the large file
2. **Run the pipeline** and monitor performance
3. **Observe behavior:** Does it slow down? Timeout? Complete successfully?
4. **Check resource usage** if visible in Fabric interface

**Key Observation Points:**

- How long does processing take compared to small files?
- Does Fabric show any warnings or performance indicators?
- Are there any timeout errors or resource constraint messages?
- How does the monitoring from Lab 11 respond to slower processing?

#### Documentation
**Quick Notes:** Write down what you observed for later discussion

---

### Scenario 2: Data Corruption Scenarios

#### Setup:
**Context:** "Real data often contains mixed quality - some good records, some problematic ones"

**Breaking Method Options** (choose 1-2 to try):

**Option A: Mixed Data Types**

- In a numeric column, replace some values with text ("ERROR", "NULL", "N/A")
- Leave other values as valid numbers
- See if Fabric processes partially or fails completely

**Option B: Encoding Issues**

- Add special characters or emojis to text fields
- Try different character encodings if possible
- See how Fabric handles non-standard characters

**Option C: Incomplete Records**

- Delete some values in the middle of rows (creating gaps)
- Remove entire columns from some rows
- Create inconsistent row lengths

#### Execution & Observation:
**Break Process:**

1. **Choose one corruption type** and modify your data file
2. **Run the pipeline** and carefully observe results
3. **Check output data** - did bad records get processed, skipped, or cause failure?
4. **Try a second corruption type** if time allows

**Key Observation Points:**

- Does the pipeline fail completely or continue with warnings?
- How does Fabric handle the corrupted data?
- What error messages or warnings appear?
- Can you identify which specific records caused problems?
- How would a business user know there was an issue?

#### Documentation:
**Record findings:** What happened with each corruption type?

---

### Scenario 3: Resource Constraints & Timing Issues

#### Setup:
**Context:** "Production systems often have multiple processes competing for resources"

**Breaking Method Options:**

**Option A: Multiple Simultaneous Pipelines**

- Create duplicate copies of your pipeline
- Run multiple instances at the same time
- See how Fabric handles concurrent resource usage

**Option B: Complex Transformations**

- Add complex calculations or data transformations to your pipeline
- Create joins between multiple large datasets if possible
- See if processing becomes resource-intensive

**Option C: Rapid Successive Runs**

- Run the same pipeline repeatedly in quick succession
- Don't wait for completion before starting the next run
- Observe queuing, conflicts, or resource competition

#### Execution & Observation:
**Break Process:**

1. **Choose one resource constraint scenario**
2. **Execute your chosen approach**
3. **Monitor system behavior** and any queue/resource indicators
4. **Try to overwhelm the system** (within reasonable limits)

**Key Observation Points:**

- How does Fabric manage multiple concurrent operations?
- Are there visible queue indicators or resource monitors?
- Do operations slow down, queue up, or fail?
- How long before the system recovers to normal performance?

#### Documentation:
**Note observations:** System behavior under load

---
