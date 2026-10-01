# Technical Debt in legacy-bikezelo

Trainer reference. The release PR: [QAADE5/legacy-bikezelo #1](https://github.com/QAADE5/legacy-bikezelo/pull/1) - `develop` into `main`.

- `main` is a stripped-down bikezelo (the app learners ran on Day 3) with every rule switched on. This is "production".
- `develop` is 14 commits by "Dave M", February to September 2026. Each one has a plausible reason, most have a deadline, and nobody reviewed any of them.

Line numbers are for `develop`. IDs match the register (`data/tech-debt-register.xlsx`).

---

## Dave's commits

| # | Date | Commit | Item |
|---|------|--------|------|
| 1 | 14 Feb | `disable status rule - too many red rows, ops complaining` | Whole class |
| 2 | 3 Mar | `add config.yaml support` | M3 |
| 3 | 10 Mar | `remove config.yaml, hardcode for now - broke on Windows` | M3, C2 |
| 4 | 8 Apr | `admin reset endpoint for demo day` | S1 |
| 5 | 12 May | `customer lookup for support team` | S2 |
| 6 | 2 Jun | `finance export - needs to be live by Friday` | P3 |
| 7 | 9 Jun | `finance want full history - remove 500 row cap` | P1 |
| 8 | 7 Jul | `forecast crashing on empty data - return zeros` | M1 (and the cause of P2) |
| 9 | 14 Jul | `fix stats bug (reading df twice for now)` | P2 |
| 10 | 4 Aug | `skip flaky test` | M2 |
| 11 | 18 Aug | `tidy up` | C1, C2 |
| 12 | 25 Aug | `add PENDING for finance` | C3 |
| 13 | 8 Sep | `export audit line` | Decoy |
| 14 | 19 Sep | `debug on for remote demo` | S3 |

---

## Whole class - the status rule

| Where | What | Why it's debt |
|-------|------|---------------|
| `rules.py` 29-35 | Status rule commented out: "disabled 14/02 - too many red rows, ops team complained. dave" | PENDING, CANCELLED and UNKNOWN rows now go green. The alarm was silenced instead of the data being fixed. Better fix: make it a warning rule (Day 3's WARN-FAIL). Who approved turning it off? |

Not on any lens tab - every group sees it in the PR. Use it in TD-GOVERN. Commit 12 makes it worse: PENDING became valid in `app.py` and `simulate.py`, but the commented-out rule still doesn't list it, so switching the rule back on would turn every PENDING row red.

---

## Security

| ID | Where | What | Why it's debt | Fix |
|----|-------|------|---------------|-----|
| S1 | `app.py` 39, 333-344 | `/admin/reset` deletes every order. Hard-coded token, checked from the URL. `TODO(dave): move to env var before go-live` | Anyone who can read the repo can wipe production. Tokens in URLs end up in logs and browser history. The TODO shows the debt was known and never paid | Remove the endpoint (demo day is over). If it must stay: token from an environment variable, POST not GET |
| S2 | `app.py` 292-300 | Customer lookup builds SQL with an f-string | Real SQL injection: `/data/customer/x' OR '1'='1` returns every order. Dave used a `?` parameter correctly in the export (line 314) a month later | `conn.execute("SELECT * FROM orders WHERE customer_id = ? ORDER BY row_id", (customer_id,))` |
| S3 | `app.py` 348 | `debug=True` on `0.0.0.0` | Debug mode exposes the Werkzeug debugger to anyone on the network, which allows running code on the server. Fine for a demo on a laptop, never in production | `app.run(host="127.0.0.1", port=5000)`, or debug from an environment variable |

Most likely Fix now: **S2** (a one-line fix to a real exploit) or **S1**. S3 is a good challenge: one line to fix, so why not fix it too?

## Performance

| ID | Where | What | Why it's debt | Fix |
|----|-------|------|---------------|-----|
| P1 | `simulate.py` 70; `app.py` 51-60, 225-233 | 500-row cap removed. Every 3-second poll still reads the whole table, then filters in pandas | With the cap, reading everything was fine - accepted debt. Removing the cap made it real: the cost now grows every day. Debt that was safe to accept stopped being safe | Keep `orders` capped and put history in an archive table for finance, or only read new rows (`WHERE row_id > ?`) |
| P2 | `app.py` 271-274 | DB read twice per validation cycle. "passing df here broke the stats once, not sure why" | The comment is true. The real cause is line 180: `calculate_forecast()` overwrites the timestamp column of the caller's DataFrame, so validation sees reformatted timestamps and every row goes amber. The workaround hides a bug nobody understood | Fix the cause: don't write back into `df` in `calculate_forecast()` (or `df = df.copy()`), then pass `df` once |
| P3 | `app.py` 303-319 | One `COUNT` query per order in the export | N+1 queries: 500 orders = 501 queries, and with P1 the table has no limit | One query: `SELECT o.*, COUNT(*) OVER (PARTITION BY customer_id) AS customer_order_count FROM orders o` |

P1 and P3 compound: the export gets slower every day the cap is off. P2 is the best "dig deeper" item - the fix is in a different commit (8) from the symptom (9).

## Code Quality

| ID | Where | What | Why it's debt | Fix |
|----|-------|------|---------------|-----|
| C1 | `app.py` 211-217, 276 | `do_stuff(r)` returns `t, p, w, e, x` | Names tell you nothing, and five values returned in a fixed order is easy to unpack wrongly. Committed as "tidy up" - it made the code worse | Rename (`summarise_results`) and return a dict |
| C2 | `app.py` 19-21, 197-208 | Unused `yaml`, `json`, `time` imports; `calculate_forecast_v1()` "keep for now"; commented-out function with a FIXME | Dead code. Git history is the backup - it doesn't need keeping "just in case". `yaml` is left over from commit 3, and `pyyaml` is still in `requirements.txt` | Delete them |
| C3 | `app.py` 40; `simulate.py` 19; `rules.py` 33 | The list of valid statuses is typed out in three places. "keep in sync with simulate.py and rules.py!!" | They're already out of sync - `rules.py` doesn't have PENDING. The "!!" comment is the tell | One shared constant, imported everywhere |

## Maintainability

| ID | Where | What | Why it's debt | Fix |
|----|-------|------|---------------|-----|
| M1 | `app.py` 177-194 | `calculate_forecast()` catches every exception and returns zeros | The forecast shows 0 and nobody knows why. `main` handled the empty case without a try/except - this hides real errors, and it's where the P2 bug came in | Handle the empty case explicitly; at minimum `logger.exception(...)` |
| M2 | `tests/test_app.py` 66 | One test skipped ("flaky - fix later"). No tests for `/data/customer`, `/export` or `/admin/reset` | A skipped test is a test that doesn't exist. The three riskiest pieces of code have no tests - a test with `x' OR '1'='1` would have caught S2 | Un-skip and investigate; add endpoint tests |
| M3 | `README.md` 16-18, 37, 57, 90 | Describes `config.yaml` (gone since commit 3), a 500-row limit (gone since commit 7) and an active status rule (off since commit 1). No mention of the three new endpoints. "Last reviewed: March 2026 - Dave M" | Docs that describe things that aren't there are worse than no docs | Update it - and make README changes part of the definition of done |

---

## Also in the PR (not on the cards)

Groups may add these to "Found it ourselves".

| Where | What | Why it's debt |
|-------|------|---------------|
| `app.py` 41, 321 | Export writes to `C:\Users\dave.m\Desktop\exports\orders.csv` | Only works on Dave's laptop. On Windows it fails; on Linux it creates a file with that literal name in the project folder |
| `app.py` 35 | "config.yaml broke on the Windows laptops - hardcoded for now" | "For now" six months later. The config problem was never solved |
| `simulate.py` 8 | Docstring still says "DB is capped at 500 rows" | Stale comment, same as M3 |
| `requirements.txt` | `pyyaml` added in commit 2, never removed. Nothing is pinned | Unused dependency. Unpinned versions = a different app on every install. Use in TD-GOVERN for "updates and obsolescence" |
| `app.py` 311 | Export silently drops any order whose status isn't in `VALID_STATUSES` | Finance's numbers won't match the dashboard, and nothing says why |

---

## Not debt (decoy)

| Where | What | Why it's fine |
|-------|------|---------------|
| `app.py` 323-328 | Export audit line: `try` / `except OSError` that logs a warning and carries on. "never block the export for this" | Deliberate and commented. It catches one specific error, logs it, and protects something optional. Compare with M1 - same "catch and carry on" pattern, different verdict |

Also not debt: `setup_db.py` deleting the database on every run. That's in `main`, not the PR - by design, synthetic data, the comment explains it.

---

## Chains worth pointing out

- **Commit 8 causes commit 9.** The catch-all `try` went in alongside the line that overwrites the caller's data. A week later the stats broke, and the workaround (read the DB twice) went in instead of finding the cause. That's the "interest" on debt.
- **Commit 7 changes the verdict on existing code.** Reading the whole table every poll was fine with a 500-row cap. Removing the cap turned accepted debt into real debt, without touching `app.py`.
- **Commit 1 and commit 12.** The rule was turned off, then the status list changed. Nobody noticed the two disagree, because the rule wasn't running.
- **"tidy up" made things worse.** C1 and C2 are both from a commit with a reassuring message - the reason to review code rather than commit messages.
