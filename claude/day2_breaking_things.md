# Day 2: Breaking Things 101
**Time:** 9:50-10:30 (40 minutes)  
**Learning Type:** Practice

---

## Overview
This hands-on session builds operational confidence by deliberately introducing failures into working data pipelines. Learners practice controlled troubleshooting while observing how Fabric responds to different types of failures. The systematic approach moves from simple to complex breaks, building diagnostic skills.

---

## Session Structure

### Phase 1: Establish Working Baseline (15 minutes)

#### Setup Instructions (3 minutes):
**Facilitator Introduction:**
- "We're going to deliberately break things today - this is how you learn to fix real problems"
- "Rule 1: We break one thing at a time so we know what caused each error"
- "Rule 2: We fix each break before moving to the next one"
- "Rule 3: We observe and discuss what Fabric tells us about each failure"

**Technical Setup:**
- Learners should have Lab 4 materials ready from yesterday
- If not available, have them quickly run Lab 4 again
- **Goal:** Everyone has a working pipeline before we start breaking

#### Baseline Verification (10 minutes):
**Individual Work:**
- Each learner runs their Lab 4 pipeline end-to-end
- Verify data flows through successfully
- Check that monitoring from yesterday's labs still shows activity

**Group Check-in (2 minutes):**
- "Hands up when your pipeline is working"
- Quick troubleshoot any learners having issues
- "Now we know what 'working' looks like - let's break it!"

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
- "Navigate to your source data file"
- "Rename it - add '_broken' to the filename"
- "Now try to run your pipeline"

**Facilitator Observation Points:**
- How quickly do learners spot the error?
- What does Fabric's error message say?
- Do they immediately know what to fix?

**Guided Discussion (2 minutes):**
- "What error message did you get?"
- "How helpful was that message for diagnosing the problem?"
- "In real life, what might cause files to disappear?"

**Fix & Verify (2 minutes):**
- "Rename the file back to original name"
- "Run pipeline again to confirm it works"

---

#### Break 2: Schema Mismatch (8 minutes total)

**Break Instructions (4 minutes):**
- "Open your source CSV file"
- "Delete one of the column headers (not the data, just the header)"
- "Save the file and run your pipeline"

**Facilitator Observation Points:**
- Does the error message clearly indicate schema issues?
- How long do learners take to identify the problem?
- Do they understand the difference between this and the file error?

**Guided Discussion (2 minutes):**
- "How was this error different from the file not found error?"
- "What would happen in real life if someone changed a source system's output format?"
- "How could monitoring help detect this faster?"

**Fix & Verify (2 minutes):**
- "Add the column header back"
- "Verify pipeline works again"

---

#### Break 3: Data Quality Issues (10 minutes total)

**Break Instructions (5 minutes):**
- "In your CSV, find a numeric column"
- "Change some numbers to text (like 'ERROR' or 'N/A')"
- "Save and run pipeline"

**Facilitator Observation Points:**
- Does Fabric handle data type mismatches gracefully?
- What happens to the bad data - does it get skipped or cause total failure?
- Do learners understand the difference between this and schema issues?

**Extended Discussion (3 minutes):**
- "Did the pipeline completely fail or partially succeed?"
- "What happened to the bad data?"
- "Which is worse: pipeline fails completely or bad data gets through?"
- "How would you detect this in a production system?"

**Fix & Verify (2 minutes):**
- "Fix the data values back to numbers"
- "Confirm everything works"

---

## Facilitation Guidelines

### Managing the Group:

**Keep Everyone Together:**
- Don't let fast learners rush ahead to the next break
- "Wait for everyone to see the error before we discuss"
- Use screen sharing if someone gets a particularly interesting error

**Encourage Observation:**
- "Read the error message out loud"
- "What's the first thing Fabric tells you?"
- "Where exactly did it point you to look?"

**Build Confidence:**
- "These are all fixable problems"
- "Getting good at reading error messages is a valuable skill"
- "Every data engineer has broken things like this"

### Discussion Facilitation:

**Key Questions for Each Break:**
- "What story is the error message telling you?"
- "How would you explain this to a non-technical stakeholder?"
- "What would you do differently if this happened at 2am?"

**Connect to Real World:**
- "What causes this type of failure in production?"
- "How could you prevent this?"
- "Who would you escalate this to?"

### Time Management:

**If Running Behind:**
- Skip the extended discussion on Break 3
- Focus on the "observe error message" part of each cycle
- Ensure everyone experiences at least 2 different break types

**If Running Ahead:**
- Add more data quality scenarios (empty files, completely wrong data format)
- Discuss performance issues: "What if the file was 100x larger?"
- Preview tomorrow: "These were technical breaks - tomorrow we'll look at data quality standards"

### Troubleshooting Tips:

**If someone can't recreate the break:**
- Have them screen share so group can see
- "Sometimes the error message is different - that's useful to know"
- Use it as learning: "Why might different setups show different errors?"

**If errors are unclear:**
- "Error messages aren't always helpful - what would you try next?"
- "How would you get more information about what went wrong?"

**If someone fixes too quickly:**
- "Great - can you show others how you diagnosed that?"
- "What clues did you use to know what to fix?"

---

## Learning Outcomes

### By the end of this session, learners should:

**Technical Skills:**
- Recognize common data pipeline failure patterns
- Read and interpret Fabric error messages
- Follow systematic troubleshooting approach

**Operational Mindset:**
- Understand that breaks are fixable with methodical approach
- Appreciate the importance of good error messages
- See the connection between breaks and monitoring alerts

**Confidence Building:**
- Feel comfortable deliberately breaking systems for learning
- Know they can recover from common failures
- Ready to handle incident response scenarios

---

## Transition to Next Session

### Bridge to Lab 11 Setup (1 minute):
- "You've now seen what different failures look like"
- "Next we'll set up alerts so we get notified immediately when these happen"
- "Then we'll research how major companies handle much bigger failures"
- "The goal is to detect problems faster and respond more effectively"

---

## Resources for Trainers

### Pre-Session Preparation:
- **Test all break scenarios** in your own environment
- **Document exact error messages** Fabric shows for each break type
- **Prepare backup files** in case learners accidentally corrupt their original data

### Common Challenges:

**"This feels destructive":**
- Reassure: "This is controlled learning - everything is fixable"
- "Real incidents are much scarier when you haven't practiced"

**"The error messages don't make sense":**
- "That's normal - part of operational skills is interpreting unclear messages"
- "What would you try first? Second? Third?"

**"This is too easy/obvious":**
- "Wait until you're debugging at 2am under pressure"
- "The goal is building systematic habits, not just finding obvious problems"

### Extension Activities:
- **Performance breaks:** Very large files, complex transformations
- **Dependency breaks:** What if the target database was unavailable?
- **Timing breaks:** What if source data arrives late?

### Connection to KSBs:
- **S8:** Identify and troubleshoot issues with data processing pipelines
- **K23:** How to undertake analysis and root cause investigation
- **B5:** Use initiative and innovation to problem solve and troubleshoot