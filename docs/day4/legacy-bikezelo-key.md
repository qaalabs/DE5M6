# Technical Debt in legacy-bikezelo

Trainer reference. Repo: [QAADE5/legacy-bikezelo](https://github.com/QAADE5/legacy-bikezelo) - Day 3's `bikezelo` after "Dave" (a developer who has since left) added to it. Everything still runs.

Line numbers are for the current version of the repo. IDs S1-M3 match the register (`data/tech-debt-register.xlsx`).

---

## Security

| ID | Where | What | Why it's debt |
|----|-------|------|---------------|
| S1 | `app.py` 43, 337-346 | `/admin/reset` deletes every order. The token is hard-coded and passed in the URL. `TODO(dave): move to env var before go-live` | Anyone who can read the repo can wipe the data. The token in the URL ends up in logs and browser history. The TODO shows the debt was known and never paid |
| S2 | `app.py` 326-334 | Customer lookup builds SQL with an f-string | Real SQL injection: `/data/customer/x' OR '1'='1` returns every order. Fix is a `?` parameter |
| S3 | `app.py` 358 | `debug=True` on `0.0.0.0` | Debug mode exposes the Werkzeug debugger to anyone on the network, which allows code execution. Fine on a laptop, never in production |

## Performance

| ID | Where | What | Why it's debt |
|----|-------|------|---------------|
| P1 | `app.py` 77, 255-266 | Every 3-second poll reads the whole `orders` table, then filters in pandas | Cost grows with the table. Small today because the DB is capped at 500 rows - a good "accept, with a trigger to revisit" item |
| P2 | `app.py` 220, 309-310 | DB read twice per validation cycle. Comment: "passing df here broke the stats once, not sure why" | The root cause is line 220: `calculate_forecast()` changes the caller's DataFrame. The workaround hides a bug nobody understood. Fix is `df.copy()` |
| P3 | `app.py` 149-173 | A new Great Expectations context, data source and suites are built from scratch every 10 seconds | Repeated set-up work on every cycle. Done to avoid "already exists" errors rather than fixing the cause |

## Code Quality

| ID | Where | What | Why it's debt |
|----|-------|------|---------------|
| C1 | `app.py` 240-246, 301 | `do_stuff(r)` returns `t, p, w, e, x` | Names tell you nothing. Rename and return a dict |
| C2 | `app.py` 26-28, 203-215 | Unused `calculate_forecast_v1()` ("keep for now"), a commented-out function with a FIXME, three unused imports | Dead code. Git history is the backup - it doesn't need keeping "just in case" |
| C3 | `app.py` 156, 196 | `run_validation()` returns `{}` when there's no data, but a `(dict, error)` pair otherwise | Only works because the caller returns early on empty data. A crash waiting for the next refactor |

## Maintainability

| ID | Where | What | Why it's debt |
|----|-------|------|---------------|
| M1 | `app.py` 236-237 | `calculate_forecast()` catches every exception and returns zeros | The forecast shows 0 and nobody knows why. At minimum, log the exception |
| M2 | `tests/test_app.py` 66 | One test skipped ("flaky - fix later"). No tests for `run_validation()`, `rules.py` or the three newer endpoints | A skipped test is a test that doesn't exist. The validation logic - the core of the app - is untested |
| M3 | `README.md` 25, 89, 173 | Describes a `config.yaml` that doesn't exist, and `rules.py` "numbered steps" that are gone. Doesn't mention `/admin/reset`, `/export` or `/data/customer`. "Last reviewed: March 2024 - Dave M" | Docs that describe things that don't exist are worse than no docs |

---

## Also in the code (not on the register)

Groups may find these themselves.

| Where | What | Why it's debt |
|-------|------|---------------|
| `rules.py` 30-36 | Status rule commented out: "disabled 14/02 - too many red rows, ops team complained. dave" | **Visible when running** - PENDING / CANCELLED rows show green. The alarm was silenced instead of fixing the data. Better fix: make it a warning rule. Who approved turning it off? |
| `app.py` 44, 349-354 | `/export` writes to `C:\Users\dave.m\Desktop\exports\orders.csv` | Only works on Dave's machine - finance's Friday export fails everywhere else |
| `app.py` 45, 333; `simulate.py` 19; `rules.py` 34 | The list of valid statuses is typed out in four places. Comment: "keep in sync with simulate.py and rules.py!!" | One copy changes, the others drift. The "!!" comment is the tell |
| `app.py` 39, 47, 53-64; `setup_db.py` 8-24; `simulate.py` 17; `preload.py` 32 | `DB_PATH` and the QAPHA ping code copy-pasted across scripts | Duplication - one shared config module would fix it |
| `app.py` 48 | Comment says the SLA threshold "must match SLA_TARGET in templates/index.html" | Stale comment - the template now reads the value from the app |
| `requirements.txt` 1-6 | No versions pinned; `pytest` listed with the runtime dependencies | A different app on every install. Split out a `requirements-dev.txt` |

---

## Not debt (decoys)

These look bad but are deliberate. Good for testing judgement.

| Where | What | Why it's fine |
|-------|------|---------------|
| `setup_db.py` 28-33 | Deletes `data/orders.db` every time it runs | By design: synthetic data, rerunnable reset, the comment explains it. Would be serious debt if this touched real data |
| `app.py` 53-64 | `ping_qapha_sla_breach()` catches every exception and does nothing | Deliberate and commented: optional telemetry must never break the dashboard. Compare with M1 - same pattern, different verdict |
