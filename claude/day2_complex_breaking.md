# Day 2: Advanced Breaking Scenarios
**Time:** 13:30-14:00 (30 minutes)  
**Learning Type:** Practice

---

## Overview
Building on the morning's simple breaks (file renames, schema changes), this session introduces more complex failure scenarios that mirror real-world production issues. Learners work individually to create and observe performance problems, data corruption, and resource constraint scenarios, developing skills for handling sophisticated operational challenges.

---

## Session Structure

### Introduction & Context (3 minutes)

#### Frame the Session:
- **Morning recap:** "This morning you broke pipelines with simple file and schema issues"
- **Afternoon goal:** "Now we'll explore more complex problems that happen in production environments"
- **Real-world connection:** "These are the types of issues that monitoring alerts help you detect early"

#### Learning Approach:
- **Individual exploration:** Each learner works on their own scenarios
- **Observation focus:** Watch how Fabric responds to different stress types
- **Systematic approach:** One scenario at a time, document what you observe

---

### Scenario 1: Performance Issues (8 minutes)

#### Setup (2 minutes):
**Context:** "Large files and complex processing can cause timeouts and resource issues"

**Breaking Method:**
- Find or create a **much larger dataset** than used in Lab 4
- Options:
  - Duplicate your existing file multiple times to create a large CSV
  - Use online sample datasets (sales data, sensor data, etc.)
  - Create synthetic data with repeated rows

**Target:** File should be significantly larger than morning's examples (aim for 10x+ size)

#### Execution & Observation (5 minutes):
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

#### Documentation (1 minute):
**Quick Notes:** Write down what you observed for later discussion

---

### Scenario 2: Data Corruption Scenarios (10 minutes)

#### Setup (2 minutes):
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

#### Execution & Observation (6 minutes):
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

#### Documentation (2 minutes):
**Record findings:** What happened with each corruption type?

---

### Scenario 3: Resource Constraints & Timing Issues (8 minutes)

#### Setup (2 minutes):
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

#### Execution & Observation (5 minutes):
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

#### Documentation (1 minute):
**Note observations:** System behavior under load

---

### Group Discussion & Reflection (7 minutes)

#### Experience Sharing (5 minutes):

**Structured Sharing Round:**
Each learner briefly shares (30-45 seconds):
- **"The most interesting thing I discovered was..."**
- **"The biggest surprise was..."**
- **"Something that would worry me in production..."**

**Facilitator Role:**
- **Listen for patterns** across different learners' experiences
- **Note system behaviors** that appeared consistently
- **Highlight unexpected findings** that merit group attention

#### Key Insights Discussion (2 minutes):

**Facilitator Questions:**
- "How were these failures different from this morning's simple breaks?"
- "Which type of failure would be hardest to detect in production?"
- "What would you want your monitoring to alert on based on what you saw?"

**Bridge to Next Session:**
- "These complex scenarios show why incident response isn't just about fixing - it's about communication and coordination"
- "Next we'll practice the human side of incident response"

---

## Facilitator Guidelines

### Monitoring Progress:

**Circulate During Scenarios:**
- **Check individual progress** without interrupting flow
- **Offer suggestions** if someone's approach isn't producing interesting results
- **Help troubleshoot** if someone gets genuinely stuck
- **Note interesting observations** for group discussion

**Time Management:**
- **Be flexible** - if everyone's deeply engaged in Scenario 1, extend it slightly
- **Have backup options** ready if a scenario doesn't work well
- **Keep overall 30-minute limit** to allow time for next session

### Supporting Individual Work:

**If someone can't create large files:**
- Suggest copying and pasting their existing data multiple times
- Point them to online sample datasets
- Help them modify existing data to create complexity

**If system performance is too good:**
- "That's a good finding - Fabric handles this well"
- "In your workplace, what would cause performance problems?"
- "What if this was 100x larger?"

**If nothing interesting happens:**
- "Sometimes systems are more robust than expected"
- "What would you try next to stress-test this system?"
- "How would you know if there were hidden problems?"

### Common Observations to Highlight:

**Performance Scenarios:**
- How well Fabric scales with larger data
- Whether timeouts occur or processing just slows
- Any cost implications of larger processing

**Data Corruption Scenarios:**
- How gracefully Fabric handles bad data
- Whether partial processing is better or worse than complete failure
- How business users would discover data quality issues

**Resource Constraint Scenarios:**
- How Fabric manages concurrent operations
- Whether there are visible resource limitations
- How the system recovers from overload

---

## Expected Learning Outcomes

### Technical Understanding:
- **System behavior** under different stress conditions
- **Error patterns** for complex vs. simple failures
- **Resource management** in cloud data platforms

### Operational Thinking:
- **Detection challenges** for subtle vs. obvious problems
- **Impact assessment** - which failures cause most business disruption
- **Monitoring requirements** for different failure types

### Preparation for Next Session:
- **Understanding complexity** of real incident response
- **Appreciation for coordination** needed beyond just technical fixes
- **Context for communication** challenges during incidents

---

## Resources for Trainers

### Pre-Session Preparation:
- **Test scenarios yourself** to understand likely outcomes
- **Identify good sample datasets** if learners need larger files
- **Know Fabric's resource limits** to guide expectations
- **Prepare backup activities** if technical scenarios don't work

### Troubleshooting Common Issues:

**"My system handles everything fine":**
- "That's valuable information - some systems are more robust"
- "What would it take to actually stress this system?"
- "How would you test limits in your workplace?"

**"Nothing is breaking despite my attempts":**
- "Focus on observation - what IS happening even if it's not breaking?"
- "How does the system communicate what it's doing?"
- "What would worry you if this was production data?"

**"I broke it too badly and can't fix it":**
- "That's a realistic scenario - sometimes fixes require help"
- "In real life, who would you escalate to?"
- "What information would you provide to get help?"

### Extension Ideas:
- **Security scenarios:** Invalid credentials, access problems
- **Network scenarios:** Slow connections, intermittent connectivity
- **Compliance scenarios:** Data that shouldn't be processed together

### Connection to KSBs:
- **S8:** Identify and troubleshoot issues with data processing pipelines
- **S18:** Develop simple forecasts and monitoring tools
- **K1:** Processes to monitor and optimize performance
- **B5:** Use initiative and innovation to problem solve and troubleshoot