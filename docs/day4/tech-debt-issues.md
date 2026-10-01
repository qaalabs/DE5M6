# Tutor Guide - Technical Debt Audit Activity

## Overview
This codebase contains **intentional technical debt** for learners to discover during their audit. This document lists all embedded issues to help you facilitate the activity and validate learner findings.

Line numbers checked against `QAADE5/techmart-2026` on 2026-09-30. Code lives in `src/`.

!!! note "extract_data.sql is not in the repo"
    `pipeline.py` (line 26) and `config.json` (line 11) both reference `extract_data.sql`, but the file does not exist. If a group flags this, accept it as a valid finding (broken dependency / incomplete repo).

---

## transform_data.sql (11 issues)

### 1. Function on Column in WHERE (Line 17)
- **Category:** Performance
- **Impact:** High - prevents index usage
- **Effort:** Low - restructure condition
- **Priority:** Critical
- `WHERE YEAR(transaction_date) = 2024 AND MONTH(transaction_date) = 1`

### 2. Old-Style JOIN Syntax (Lines 25-26, 73-74, 97-98)
- **Category:** Maintainability
- **Impact:** Medium - outdated, easy to create accidental Cartesian products
- **Effort:** Low - convert to ANSI JOIN
- **Priority:** High
- Comma-separated FROM clause: `FROM sales.dbo.transactions t, sales.dbo.products p WHERE t.product_id = p.product_id`

### 3. Hard-coded Date Range (Lines 17, 27-28, 36-38, 56, 75-76, 89, 99-100)
- **Category:** Code Quality
- **Impact:** High - requires code change for each run
- **Effort:** Low - use parameters
- **Priority:** Critical
- '2024-01-01' / '2024-02-01' hard-coded in almost every query

### 4. Nested / Correlated Subqueries (Lines 36-38, 56)
- **Category:** Performance
- **Impact:** Medium - scans the transactions table once per subquery per row
- **Effort:** Medium - refactor to a JOIN + GROUP BY or CTE
- **Priority:** Medium
- Store performance runs three near-identical correlated subqueries (COUNT, SUM, AVG)

### 5. Duplicated CASE Logic (Lines 44-49 and 60-65)
- **Category:** Code Quality
- **Impact:** Medium - maintenance burden, easy to change one and not the other
- **Effort:** Medium - compute once in the subquery or a view
- **Priority:** Medium
- Same loyalty-tier CASE statement in SELECT and GROUP BY

### 6. Hard-coded Business Logic (Lines 45-47, repeated 61-63)
- **Category:** Configuration Management
- **Impact:** Medium - thresholds should be configurable
- **Effort:** Low - move to a lookup table or parameters
- **Priority:** Medium
- Loyalty tier thresholds (100, 500, 1000) hard-coded, twice

### 7. No Transaction Management (Line 80)
- **Category:** Maintainability
- **Impact:** High - data corruption risk, duplicate rows on re-run
- **Effort:** Medium - wrap in transaction, make idempotent
- **Priority:** High
- INSERT with no BEGIN TRANSACTION/COMMIT, no column list, and nothing stops the same month being inserted twice

### 8. No NULL Handling (Lines 13-15, 71-72, 83-87)
- **Category:** Data Quality
- **Impact:** Medium - incorrect aggregations
- **Effort:** Low - add COALESCE/ISNULL
- **Priority:** Medium
- SUM/AVG operations don't handle NULLs explicitly

### 9. Same Query Written Twice (Lines 11-18 and 80-90)
- **Category:** Performance
- **Impact:** Medium - daily summary computed twice per run, and the two versions filter dates differently
- **Effort:** Low - compute once
- **Priority:** Medium
- First version uses `YEAR()/MONTH()`, the INSERT version uses a date range

### 10. Hard-coded Database and Schema Names (Throughout, line 80)
- **Category:** Configuration Management
- **Impact:** High - environment coupling, can't point at test
- **Effort:** Low - parameterise
- **Priority:** High
- `sales.dbo` in every query, `reporting.dbo` on line 80

### 11. No Comments
- **Category:** Maintainability
- **Impact:** Low - understandability
- **Effort:** Low - add comments
- **Priority:** Low
- Only one-line section headers; no explanation of business rules (e.g. why these tiers)

---

## pipeline.py (17 issues)

### 1. Hard-coded Credentials (Line 14)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - exposed password
- **Effort:** Low - use environment variables / secrets store
- **Priority:** CRITICAL
- Plain text UID/PWD in the connection string, pointing at a **prod** server

### 2. Hard-coded File Paths (Lines 26, 35, 47, 88)
- **Category:** Configuration Management
- **Impact:** High - Windows-specific, breaks portability
- **Effort:** Low - use config file or relative paths
- **Priority:** Critical
- `C:\Users\DataTeam\...` paths throughout

### 3. Poor Variable Names (Lines 22, 26, 44, 47, 53, 64, 76, 106-112)
- **Category:** Code Quality
- **Impact:** Medium - readability
- **Effort:** Low - rename
- **Priority:** Medium
- `c`, `f`, `q`, `r`, `result1/2/3` - cryptic names

### 4. No Error Handling (Entire file)
- **Category:** Maintainability
- **Impact:** High - failures go unnoticed, connections left open
- **Effort:** Medium - add try-except blocks
- **Priority:** High
- No try-except anywhere; database/file operations can fail silently

### 5. File Handling Not Safe (Lines 26-28, 47-49)
- **Category:** Maintainability
- **Impact:** Medium - resource leak
- **Effort:** Low - use context managers
- **Priority:** Medium
- Not using `with open()` - files not guaranteed to close

### 6. Unsafe SQL Execution (Lines 30, 51-55)
- **Category:** Security
- **Impact:** High - anything in the SQL file runs against prod
- **Effort:** Low - parameterised queries, controlled SQL
- **Priority:** High
- Raw SQL read from a file and executed; naive `split(';')` breaks on any `;` inside a string

### 7. Unused Import (Line 8)
- **Category:** Code Quality
- **Impact:** Low - minor
- **Effort:** Low - remove
- **Priority:** Low
- `import json` but never used (config.json isn't actually loaded!)

### 8. Magic Numbers (Line 95)
- **Category:** Code Quality
- **Impact:** Low - unclear meaning
- **Effort:** Low - use named constants / config
- **Priority:** Low
- `604800` (seconds in 7 days) - and `cleanup_days: 7` in config.json is ignored

### 9. Config File Not Used
- **Category:** Configuration Management
- **Impact:** High - defeats purpose of config
- **Effort:** Low - actually load and use config.json
- **Priority:** High
- config.json exists but isn't loaded; `batch_size`, `timeout`, `retry_count` all ignored

### 10. No Logging
- **Category:** Maintainability
- **Impact:** Medium - debugging difficulties
- **Effort:** Medium - implement proper logging
- **Priority:** Medium
- Using print() instead of the logging module

### 11. Validation Doesn't Stop Anything (Lines 71-72)
- **Category:** Data Quality
- **Impact:** Medium - silent data issues
- **Effort:** Low - fail or alert on bad data
- **Priority:** Medium
- NULL revenue only prints a WARNING; pipeline carries on

### 12. Misleading Function Returns (Lines 40, 61, 81, 106-112)
- **Category:** Code Quality
- **Impact:** Low - false sense of success
- **Effort:** Low - remove or check returns
- **Priority:** Low
- Functions always return `True`; `result1/2/3` never checked

### 13. Incomplete Function (Lines 83-85, 118)
- **Category:** Maintainability
- **Impact:** Low - TODO not addressed
- **Effort:** N/A - depends on requirements
- **Priority:** Low
- `send_notification()` is a stub with TODO, and always reports "completed successfully"

### 14. No Docstrings
- **Category:** Code Quality
- **Impact:** Low - documentation
- **Effort:** Low - add docstrings
- **Priority:** Low
- No function explains what it does

### 15. Fragile String Concatenation (Line 92)
- **Category:** Code Quality
- **Impact:** Medium - path handling
- **Effort:** Low - use os.path.join() / pathlib
- **Priority:** Medium
- `file_path = output_dir + f`

### 16. Whole Result Set Loaded into Memory (Line 31)
- **Category:** Performance
- **Impact:** Medium - fails as data grows
- **Effort:** Medium - fetch in batches (`batch_size` is already in config)
- **Priority:** Medium
- `cursor.fetchall()` then a DataFrame of everything

### 17. New Connection per Stage, Commit per Statement (Lines 22, 44, 56, 64)
- **Category:** Performance
- **Impact:** Low - overhead, and partial commits if one statement fails
- **Effort:** Low - reuse connection, commit once
- **Priority:** Low

---

## config.json (4 issues)

### 1. Exposed Database Credentials (Lines 6-7)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - credentials in version control
- **Effort:** Low - use environment variables
- **Priority:** CRITICAL
- Plain text username and password

### 2. Exposed SMTP Credentials (Lines 24-25)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - credentials exposed
- **Effort:** Low - use secrets management
- **Priority:** CRITICAL
- SMTP password in plain text

### 3. Environment-Specific Paths (Lines 11-13)
- **Category:** Configuration Management
- **Impact:** High - not portable
- **Effort:** Low - use relative paths
- **Priority:** High
- Hard-coded Windows paths

### 4. No Environment Separation (Line 4 vs pipeline.py line 14)
- **Category:** Configuration Management
- **Impact:** Medium - dev/prod not separated
- **Effort:** Medium - create env-specific configs
- **Priority:** Medium
- Single config for all environments - and it names a different server to the one hard-coded in pipeline.py

---

## requirements.txt (2 issues)

### 1. Outdated / Unpinned Dependencies (Lines 4-9)
- **Category:** Security & Maintainability
- **Impact:** High - known vulnerabilities, unreproducible installs
- **Effort:** Medium - test with updated versions
- **Priority:** High
- numpy 1.18.5, pyodbc 4.0.30, requests 2.26.0 (known CVEs); `pandas>=1.1` and `python-dotenv` unpinned

### 2. Unused Dependencies (Lines 6-9)
- **Category:** Code Quality
- **Impact:** Low - bloat
- **Effort:** Low - remove unused
- **Priority:** Low
- numpy, sqlalchemy, python-dotenv, requests aren't imported by pipeline.py (line 2 of the file admits it)

---

## README.md (5 issues)

### 1. Outdated (Line 33)
- **Category:** Maintainability
- **Impact:** Medium - misleading
- **Effort:** Low - update date
- **Priority:** Medium
- "Last updated: June 2023"

### 2. Incomplete / Wrong Setup Instructions (Lines 13-25)
- **Category:** Maintainability
- **Impact:** Medium - hard to onboard
- **Effort:** Medium - document properly
- **Priority:** Medium
- No database setup, no credentials setup; `pip install -r requirements.txt` and `python pipeline.py` fail from the repo root (files are in `src/`)

### 3. No Prerequisites Section
- **Category:** Maintainability
- **Impact:** Medium - unclear requirements
- **Effort:** Low - add section
- **Priority:** Low
- Missing Python version, ODBC driver, SQL Server requirements

### 4. No Configuration Documentation
- **Category:** Maintainability
- **Impact:** High - config.json exists but not mentioned
- **Effort:** Low - document
- **Priority:** High
- No mention of config.json or how to configure

### 5. Vague Error Guidance (Line 31)
- **Category:** Maintainability
- **Impact:** Low - unhelpful
- **Effort:** Medium - create troubleshooting guide
- **Priority:** Low
- "Check logs if something fails" - but there are no logs!

---

## Summary Statistics

**Total Issues:** 39 distinct technical debt items

**By Category:**
- Security: 5
- Configuration Management: 6
- Performance: 5
- Code Quality: 9
- Maintainability: 12
- Data Quality: 2

**By Priority:**
- CRITICAL: 6 issues
- High: 9 issues
- Medium: 14 issues
- Low: 10 issues

**By File:**
- transform_data.sql: 11 issues
- pipeline.py: 17 issues
- config.json: 4 issues
- requirements.txt: 2 issues
- README.md: 5 issues

---

## Facilitation Notes

### Expected Learner Findings
- **Strong learners** might find 15-20 issues
- **Average learners** should find 10-15 issues
- **All learners** should spot the CRITICAL security issues (exposed credentials)

### Key Teaching Points
1. **Security first** - credentials in code/config is always critical
2. **Impact vs Effort** - not everything needs fixing immediately
3. **Technical debt is normal** - the key is managing it consciously
4. **Documentation matters** - outdated docs can be worse than no docs

### Good Discussion Questions
- "Why do you think these issues accumulated?"
- "What would you fix first and why?"
- "How could this have been prevented?"
- "What processes would help catch these earlier?"

### Watch For
- Learners getting overwhelmed - remind them they don't need to find *everything*
- Focus on security issues - make sure everyone spots the credentials
- Over-prioritisation - everything can't be critical
- Under-prioritisation of security - even "working" code with exposed credentials is critical

---

## Answer Key - Top Priority Items

Most teams should identify these as their top 3-5 priorities:

1. **Exposed credentials** (pipeline.py line 14, config.json lines 6-7 and 24-25) - CRITICAL security
2. **Hard-coded database/schema names** (transform_data.sql throughout) - breaks in different environments
3. **Hard-coded date ranges** (transform_data.sql) - requires code changes for each run
4. **No error handling** (pipeline.py) - silent failures
5. **Function on column in WHERE** (transform_data.sql line 17) - major performance issue
