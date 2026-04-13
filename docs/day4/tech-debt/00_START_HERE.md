# Technical Debt Audit Activity - Complete Package

This folder contains everything you need to run a 90-120 minute Technical Debt Audit workshop for Module 6

> S21: Identify and remediate technical debt, assess for updates and obsolescence as part of continuous improvement.

---

## What's Included

### For Your GitHub Repo

Upload these files to create the flawed codebase:

1. **extract_data.sql** - SQL extraction script (7 technical debt issues)
2. **transform_data.sql** - SQL transformation script (11 technical debt issues)
3. **pipeline.py** - Python orchestration script (15 technical debt issues)
4. **config.json** - Configuration file (4 technical debt issues - including CRITICAL security)
5. **requirements.txt** - Dependencies file (2 technical debt issues)
6. **README.md** - Outdated documentation (5 technical debt issues)

**Total: 44 distinct technical debt items** embedded across all files.

### For Learners

Provide these to guide the activity:

1. **TECHNICAL_DEBT_CHECKLIST.md** - Structured checklist to guide their audit
2. **TECHNICAL_DEBT_REGISTER_TEMPLATE.md** - Template they complete during the activity

### For You (Tutor)

**TUTOR_GUIDE.md** - Complete answer key with:

- All 44 technical debt items listed by file
- Category, impact, effort, and priority for each
- Expected learner findings
- Facilitation tips
- Discussion questions
- Summary statistics

---

## Setup Instructions

### 1. Create GitHub Repository

```bash
# In your ingwanelabs organisation
# Create new repo: techmart-technical-debt-audit
# Upload all the numbered files 1-6 above
```

### 2. Provide to Learners

Share the repo link: `https://github.com/ingwanelabs/techmart-2026`

Show them the:
- TECHNICAL_DEBT_CHECKLIST.md
- TECHNICAL_DEBT_REGISTER_TEMPLATE.md

---

## Activity Structure (90-120 mins)

### Part 1: Introduction (10 mins)

- What is technical debt?
- Types and impact
- Show them the repository

### Part 2: Guided Audit (45 mins)

- Teams work through the checklist
- Audit the codebase systematically
- Document findings in their register
- You circulate through breakout rooms

### Part 3: Prioritisation (20 mins)

- Teams use Impact/Effort matrix
- Identify top 3 priorities
- Plan remediation approach 

### Part 4: Share & Compare (15 mins)

- 2-3 teams screen-share findings
- Compare priorities
- Discuss differences

### Part 5: Workplace Reflection (10 mins)

- How does technical debt happen?
- What prevents fixing it?
- Who's responsible?

**Optional Extension (+30 mins):**
Teams actually remediate their number 1 priority item and demonstrate before/after.

---

## Scenario Context

**TechMart Sales Pipeline** - A daily data pipeline that:

- Extracts sales transactions from SQL Server
- Transforms and aggregates data
- Loads into reporting database
- Validates and cleans up old files

**The Problem:** This pipeline "works" but has accumulated significant technical debt over time. It needs an audit before being put into production.

**Learner Task:** Audit the codebase, identify technical debt, prioritise issues, and plan remediation.

---

## Learning Outcomes Covered

**S21:** Identify and remediate technical debt, assess for updates and obsolescence as part of continuous improvement.

**Supporting KSBs:**

- K28: Continuous improvement including how to capture good practice and lessons learned
- B3: Quality focus that promotes continuous improvement utilising peer review techniques

---

## File Mix Rationale

**60% SQL:**

- Very readable for learners with limited Python confidence
- Rich in spottable technical debt
- Authentic for data engineering work

**30% Python:**

- Provides variety and challenge
- Checklist makes it accessible
- Shows different debt patterns

**10% Config:**

- Introduces infrastructure dimension
- Critical security teaching moment
- Shows debt exists beyond code

---

## Key Teaching Points

1. **Security is non-negotiable** - exposed credentials = CRITICAL priority
2. **Technical debt is about conscious trade-offs** - not all debt is bad
3. **Impact vs Effort matters** - prioritisation is a skill
4. **Prevention is better than cure** - good practices avoid debt
5. **Documentation debt is real** - outdated docs can be harmful

---

## Expected Learner Performance

### Strong Learners (15-20 issues found)
- Will spot security issues immediately
- Will identify performance patterns
- May go deep on one file

### Average Learners (10-15 issues found)
- Should catch CRITICAL items with checklist support
- Will find hard-coded values
- May miss subtle performance issues

### Struggling Learners (6-10 issues found)
- Focus on obvious issues (hard-coded paths, SELECT *)
- May need prompting on prioritisation
- Benefit most from share & compare phase

**All learners should:**
- Identify exposed credentials as CRITICAL
- Understand Impact/Effort matrix
- Connect to workplace experiences

---

## Portfolio Application

This activity produces a portfolio-worthy deliverable:

- Completed Technical Debt Register
- Prioritised list with justification
- Remediation plans
- Workplace reflection

Learners can adapt this register format for their Module 4 Apply task (Task 4: Root cause analysis).

---

## Troubleshooting

**"I can't see any issues"**

- → Start with the checklist, work category by category
- → Look at pipeline.py line 8 - what do you notice?

**"Everything seems critical"**

- → Use the Impact/Effort matrix
- → Ask: "What happens if we don't fix this today?"

**"Is this really technical debt or just bad code?"**

- → Good question! Technical debt often IS bad code
- → The key: was it deliberate (speed) or accidental (lack of knowledge)?

**"Should we fix it or document it?"**

- → Depends on impact and effort
- → Sometimes acknowledging debt is enough

---

## Next Steps After Activity

1. **Debrief in main room** - what surprised you?
2. **Connect to Apply task** - Module 6 (root cause analysis)
3. **Workplace application** - audit something in your organisation
4. **Future modules** - M5/M6 will show prevention strategies

---

## Notes for Future Delivery

- Most groups take 35-40 mins for audit (not full 45)
- Security issues are usually found first
- SQL is more accessible than expected
- config.json sparks good security discussions
- Gallery review works better than peer swapping
- Workplace reflection is valuable - don't skip it

---

## Questions or Issues?

If you need to modify files or create variants:

- Maintain the 60/30/10 split
- Keep CRITICAL security issues (teaching moment)
- Ensure variety across categories
- Test that checklist catches your changes

**Recommended:** Keep this version intact and create new scenarios for future cohorts to prevent learners sharing answers.

