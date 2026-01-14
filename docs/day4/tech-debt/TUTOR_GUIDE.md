# Tutor Guide - Technical Debt Audit Activity

## Overview
This codebase contains **intentional technical debt** for learners to discover during their audit. This document lists all embedded issues to help you facilitate the activity and validate learner findings.

---

## Extract_data.sql (7 issues)

### 1. Hard-coded Database Name (Line 5, 12, 20, 27, 35, 42, 49)
- **Category:** Configuration Management
- **Impact:** High - breaks in different environments
- **Effort:** Low - replace with parameters
- **Priority:** Critical
- Database name `sales.dbo` is hard-coded throughout

### 2. Hard-coded Date Range (Line 6, 13-14, 21-22, 28-29, 36-37, 43-44, 50-51)
- **Category:** Code Quality
- **Impact:** High - requires code change for each run
- **Effort:** Low - use parameters
- **Priority:** Critical
- Date range '2024-01-01' to '2024-02-01' is hard-coded in every query

### 3. SELECT * Overuse (Lines 5, 20, 27)
- **Category:** Performance
- **Impact:** Medium - unnecessary data transfer
- **Effort:** Low - specify columns
- **Priority:** High
- Multiple `SELECT *` statements pulling unnecessary columns

### 4. Repeated Subquery Pattern (Lines 13-14, 21-22, 28-29, 36-37, 43-44, 50-51)
- **Category:** Performance & Code Quality
- **Impact:** Medium - inefficient, hard to maintain
- **Effort:** Medium - refactor to CTE or temp table
- **Priority:** Medium
- Same subquery `SELECT customer_id FROM sales.dbo.transactions WHERE...` repeated 6 times

### 5. No Error Handling
- **Category:** Maintainability
- **Impact:** Medium - silent failures possible
- **Effort:** Medium - add TRY-CATCH blocks
- **Priority:** Medium
- No error handling anywhere in the file

### 6. Poor Table Aliases
- **Category:** Code Quality
- **Impact:** Low - readability issue
- **Effort:** Low - use meaningful aliases
- **Priority:** Low
- No aliases used, making queries verbose

### 7. Outdated Comment (Line 3)
- **Category:** Maintainability
- **Impact:** Low - misleading documentation
- **Effort:** Low - update date
- **Priority:** Low
- "Last updated: 2023-06-15" is outdated

---

## Transform_data.sql (11 issues)

### 1. Function on Column in WHERE (Line 13)
- **Category:** Performance
- **Impact:** High - prevents index usage
- **Effort:** Low - restructure condition
- **Priority:** Critical
- `WHERE YEAR(transaction_date) = 2024 AND MONTH(transaction_date) = 1`

### 2. Old-Style JOIN Syntax (Lines 18-19, 35-36, 57-58, 74-75)
- **Category:** Maintainability
- **Impact:** Medium - outdated, deprecated
- **Effort:** Low - convert to ANSI JOIN
- **Priority:** High
- Using comma-separated FROM clause: `FROM table1 t, table2 p WHERE t.id = p.id`

### 3. Hard-coded Date Range (Multiple lines)
- **Category:** Code Quality
- **Impact:** High - same as extract_data.sql
- **Effort:** Low
- **Priority:** Critical
- '2024-01-01' and similar dates hard-coded

### 4. Nested Subqueries (Lines 26-28, 35-38)
- **Category:** Performance
- **Impact:** Medium - could use CTEs
- **Effort:** Medium - refactor to CTE
- **Priority:** Medium
- Multiple correlated subqueries in SELECT clause

### 5. Duplicated CASE Logic (Lines 43-54)
- **Category:** Code Quality
- **Impact:** Medium - maintenance burden
- **Effort:** Medium - extract to function/view
- **Priority:** Medium
- Same CASE statement appears twice (lines 43-48 and 51-54)

### 6. Hard-coded Business Logic (Lines 44-47)
- **Category:** Configuration Management
- **Impact:** Medium - thresholds should be configurable
- **Effort:** Low - move to parameters
- **Priority:** Medium
- Loyalty tier thresholds (100, 500, 1000) hard-coded

### 7. No Transaction Management (Line 63)
- **Category:** Maintainability
- **Impact:** High - data corruption risk
- **Effort:** Medium - wrap in transaction
- **Priority:** High
- INSERT with no BEGIN TRANSACTION/COMMIT

### 8. No NULL Handling
- **Category:** Data Quality
- **Impact:** Medium - incorrect aggregations
- **Effort:** Low - add COALESCE/ISNULL
- **Priority:** Medium
- SUM/AVG operations don't handle NULLs explicitly

### 9. SELECT * in Subquery (Implied)
- **Category:** Performance
- **Impact:** Low - minor inefficiency
- **Effort:** Low
- **Priority:** Low

### 10. Hard-coded Schema Names
- **Category:** Configuration Management
- **Impact:** Medium - environment coupling
- **Effort:** Low - parameterize
- **Priority:** Medium
- `reporting.dbo` hard-coded (line 63)

### 11. No Comments
- **Category:** Maintainability
- **Impact:** Low - understandability
- **Effort:** Low - add comments
- **Priority:** Low
- Complex queries lack explanatory comments

---

## Pipeline.py (15 issues)

### 1. Hard-coded Credentials (Line 8)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - exposed password
- **Effort:** Low - use environment variables
- **Priority:** CRITICAL
- Plain text password in connection string

### 2. Hard-coded File Paths (Lines 21, 25, 40, 44, 87, 91)
- **Category:** Configuration Management
- **Impact:** High - Windows-specific, breaks portability
- **Effort:** Low - use config file or relative paths
- **Priority:** Critical
- `C:\Users\DataTeam\...` paths throughout

### 3. Poor Variable Names (Lines 14, 16, 22, 40, 52, 61)
- **Category:** Code Quality
- **Impact:** Medium - readability
- **Effort:** Low - rename
- **Priority:** Medium
- `c`, `f`, `q`, `r` - cryptic names

### 4. No Error Handling (Entire file)
- **Category:** Maintainability
- **Impact:** High - failures go unnoticed
- **Effort:** Medium - add try-except blocks
- **Priority:** High
- No try-except anywhere; database/file operations can fail silently

### 5. File Handling Not Safe (Lines 22-24, 40-42)
- **Category:** Maintainability
- **Impact:** Medium - resource leak
- **Effort:** Low - use context managers
- **Priority:** Medium
- Not using `with open()` - files not guaranteed to close

### 6. SQL Injection Risk (Line 32)
- **Category:** Security
- **Impact:** High - if queries ever parameterized
- **Effort:** Low - use parameterized queries
- **Priority:** High
- Direct execution of SQL from file (currently safe but bad practice)

### 7. Unused Import (Line 3)
- **Category:** Code Quality
- **Impact:** Low - minor
- **Effort:** Low - remove
- **Priority:** Low
- `import json` but never used (config.json isn't actually loaded!)

### 8. Magic Numbers (Line 48, 91)
- **Category:** Code Quality
- **Impact:** Low - unclear meaning
- **Effort:** Low - use named constants
- **Priority:** Low
- `604800` (seconds in 7 days) not explained

### 9. Config File Not Used
- **Category:** Configuration Management
- **Impact:** High - defeats purpose of config
- **Effort:** Low - actually load and use config.json
- **Priority:** High
- config.json exists but isn't loaded or used anywhere

### 10. No Logging
- **Category:** Maintainability
- **Impact:** Medium - debugging difficulties
- **Effort:** Medium - implement proper logging
- **Priority:** Medium
- Using print() instead of logging module

### 11. No Validation (Lines 52-54)
- **Category:** Data Quality
- **Impact:** Medium - silent data issues
- **Effort:** Low - add assertions/validation
- **Priority:** Medium
- Validation checks but doesn't stop pipeline on failure

### 12. Misleading Function Returns (Lines 18, 37, 55)
- **Category:** Code Quality
- **Impact:** Low - unused return values
- **Effort:** Low - remove or use returns
- **Priority:** Low
- Functions return `True` but values never checked

### 13. Incomplete Function (Lines 59-61)
- **Category:** Maintainability
- **Impact:** Low - TODO not addressed
- **Effort:** N/A - depends on requirements
- **Priority:** Low
- `send_notification()` is a stub with TODO

### 14. Unclear Function Purpose (Line 82)
- **Category:** Code Quality
- **Impact:** Low - documentation
- **Effort:** Low - add docstrings
- **Priority:** Low
- No docstrings explaining what functions do

### 15. Fragile String Concatenation (Line 89)
- **Category:** Code Quality
- **Impact:** Medium - path handling
- **Effort:** Low - use os.path.join()
- **Priority:** Medium
- Manual string concatenation for paths instead of os.path.join()

---

## Config.json (4 issues)

### 1. Exposed Database Credentials (Lines 4-5)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - credentials in version control
- **Effort:** Low - use environment variables
- **Priority:** CRITICAL
- Plain text username and password

### 2. Exposed SMTP Credentials (Lines 18-19)
- **Category:** Security - CRITICAL
- **Impact:** CRITICAL - credentials exposed
- **Effort:** Low - use secrets management
- **Priority:** CRITICAL
- SMTP password in plain text

### 3. Environment-Specific Paths (Lines 7-9)
- **Category:** Configuration Management
- **Impact:** High - not portable
- **Effort:** Low - use relative paths
- **Priority:** High
- Hard-coded Windows paths

### 4. No Environment Separation
- **Category:** Configuration Management
- **Impact:** Medium - dev/prod not separated
- **Effort:** Medium - create env-specific configs
- **Priority:** Medium
- Single config for all environments (note "prod-db" in line 3)

---

## Requirements.txt (2 issues)

### 1. Outdated Dependencies (All lines)
- **Category:** Security & Maintainability
- **Impact:** High - known vulnerabilities
- **Effort:** Medium - test with updated versions
- **Priority:** High
- All packages are 2+ years old (from 2021)
- pandas 1.3.0 → current is 2.x
- requests 2.26.0 has known CVEs

### 2. Unused Dependency (Lines 4-6)
- **Category:** Code Quality
- **Impact:** Low - bloat
- **Effort:** Low - remove unused
- **Priority:** Low
- sqlalchemy, python-dotenv, requests aren't used in pipeline.py

---

## README.md (5 issues)

### 1. Outdated (Line 18)
- **Category:** Maintainability
- **Impact:** Medium - misleading
- **Effort:** Low - update date
- **Priority:** Medium
- "Last updated: June 2023"

### 2. Incomplete Setup Instructions
- **Category:** Maintainability
- **Impact:** Medium - hard to onboard
- **Effort:** Medium - document properly
- **Priority:** Medium
- No database setup, no config instructions, no credentials setup

### 3. No Prerequisites Section
- **Category:** Maintainability
- **Impact:** Medium - unclear requirements
- **Effort:** Low - add section
- **Priority:** Low
- Missing Python version, SQL Server requirements, etc.

### 4. No Configuration Documentation
- **Category:** Maintainability
- **Impact:** High - config.json exists but not mentioned
- **Effort:** Low - document
- **Priority:** High
- No mention of config.json or how to configure

### 5. Vague Error Guidance
- **Category:** Maintainability
- **Impact:** Low - unhelpful
- **Effort:** Medium - create troubleshooting guide
- **Priority:** Low
- "Check logs if something fails" - but there are no logs!

---

## Summary Statistics

**Total Issues:** 44 distinct technical debt items

**By Category:**
- Security: 4 CRITICAL issues
- Configuration Management: 12 issues
- Performance: 7 issues
- Code Quality: 12 issues
- Maintainability: 9 issues

**By Priority:**
- CRITICAL: 7 issues
- High: 11 issues
- Medium: 18 issues
- Low: 8 issues

**By File:**
- extract_data.sql: 7 issues
- transform_data.sql: 11 issues
- pipeline.py: 15 issues
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

1. **Exposed credentials** (pipeline.py line 8, config.json) - CRITICAL security
2. **Hard-coded database/schema names** - breaks in different environments
3. **Hard-coded date ranges** - requires code changes for each run
4. **No error handling** - silent failures
5. **Function on column in WHERE** - major performance issue
