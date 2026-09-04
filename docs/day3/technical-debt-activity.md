# Technical Debt Audit

!!! abstract "S21: Identify and remediate technical debt, assess for updates and obsolescence as part of continuous improvement"

!!! abstract "K5: The inherent risks of data such as incomplete data, ethical data sources and how to ensure data quality"

## The Scenario

You are a data engineer at **TechMart**. The sales pipeline has been running for a while and "works" - but before it goes into production it needs an audit. Your job is to find the technical debt.

The codebase is at: https://github.com/QAADE5/techmart-2026

> All credentials in this repo are fake. It is intentionally broken for training purposes.

---

## Your Task

**Part 1: Audit (~30 minutes)**

1. Open the [Technical Debt Checklist](https://github.com/QAADE5/techmart-2026/blob/main/docs/TECHNICAL_DEBT_CHECKLIST.md)
2. Work through the codebase systematically using the checklist
3. Record every issue you find in the shared template - one row per issue

**Part 2: Synthesise (~15 minutes)**

4. As a group, go through your register and agree on your single most significant issue through your lens
5. Agree on your priority fix and your reasoning
6. Prepare your report back (see below)

---

## Group Lenses

All groups audit all files. Each group reports back through a specialist perspective:

| Group   | Lens            | Your focus                                        |
|---------|-----------------|---------------------------------------------------|
| Group 1 | Security        | Security issues + configuration management        |
| Group 2 | Performance     | Database + application performance                |
| Group 3 | Code Quality    | Hard-coded values, duplication, naming, structure |
| Group 4 | Maintainability | Documentation, error handling, logging            |

---

## Report Back

Each group presents their top issue through their lens:

- **Issue** - what it is, and where (file/line)
- **Evidence** - why this counts as debt through your lens, not just "it's bad practice"
- **Impact** - what happens if this ships to production as-is
- **Fix** - what you'd change, and roughly how much work it is

After each group presents, the floor opens for questions from the other groups - could their lens see an angle on this issue that wasn't covered?

**Whole-class discussion once everyone's shared:**

- Did any group find something that surprised them?
- What would you fix first if this were your codebase?
