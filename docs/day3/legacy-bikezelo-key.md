# Trainer Key - legacy-bikezelo Technical Debt Register

Repo: https://github.com/QAADE5/legacy-bikezelo - this is Day 4's `bikezelo` with debt added. Everything still runs.

Register: `data/tech-debt-register.xlsx` - upload to Google Sheets, one copy per group. This key is **not** in the sheet, so learners can't unhide it.

- 18 rows: **16 real debt, 2 decoys (R06, R13)**
- Budget: **8 points**. The four security/data items (R01-R04) cost 5 on their own, so every group has to trade off the other 3
- Effort: 1 = under an hour, 2 = half a day, 3 = a day or more

---

## Suggested calls

| ID  | Category        | Impact | Effort | Suggested call | Key point |
|-----|-----------------|--------|--------|----------------|-----------|
| R01 | Security        | High   | 1      | Fix now   | Anyone who can read the repo can wipe prod. Token in URL ends up in logs and browser history. `TODO(dave)` = debt that was known and never paid |
| R02 | Security        | High   | 1      | Fix now   | Real SQL injection: `/data/customer/x' OR '1'='1` returns every order. Fix is a `?` parameter |
| R03 | Security        | High   | 1      | Fix now   | Werkzeug debugger on `0.0.0.0` = remote code execution from anyone on the network. Fine on a laptop, never in prod |
| R04 | Data quality    | High   | 2      | Fix now   | Visible when running: PENDING/CANCELLED rows show **green**. Silencing the alarm, not fixing the data. Better fix: move it to a warning rule. Who approved turning it off? |
| R05 | Configuration   | Medium | 1      | Fix now or Schedule | Only works on Dave's machine. Fails with a 500 anywhere else - finance's Friday export is already broken |
| R06 | **Decoy**       | -      | -      | Accept    | By design: synthetic data, rerunnable reset, comment explains it. Would be serious debt if this touched real data |
| R07 | Performance     | Low    | 2      | Accept    | DB is capped at 500 rows, so cost is tiny today. Good Accept - but write down the trigger ("revisit if the cap is removed") |
| R08 | Code quality    | Medium | 1      | Schedule  | Root cause: `calculate_forecast()` changes the caller's DataFrame (line 216). Workaround hides a bug nobody understood. Fix = `df.copy()` |
| R09 | Maintainability | Medium | 2      | Schedule  | Four copies of the list; the comment "keep in sync!!" is the tell. One changes, the others drift |
| R10 | Maintainability | Medium | 3      | Schedule  | Copy-paste across 4 scripts. A shared `config.py` - bigger job, not before Friday |
| R11 | Code quality    | Medium | 1      | Schedule  | Only works because the caller returns early on empty data. A latent crash waiting for someone to refactor |
| R12 | Maintainability | Medium | 1      | Schedule  | Forecast shows 0 and nobody knows why. At minimum, log the exception |
| R13 | **Decoy**       | -      | -      | Accept    | Same pattern as R12 but deliberate and commented: optional telemetry must never break the dashboard. Good contrast with R12 |
| R14 | Code quality    | Low    | 1      | Schedule  | Quick win. Git history is the backup - dead code doesn't need to be kept "just in case" |
| R15 | Code quality    | Low    | 1      | Schedule  | Quick win. Rename and return a dict |
| R16 | Testing         | Medium | 3      | Schedule  | A skipped test is a test that doesn't exist. Nothing tests the validation logic - the core of the app |
| R17 | Dependencies    | Medium | 1      | Schedule  | Unpinned = a different app on every install. Split `requirements-dev.txt` for pytest |
| R18 | Documentation   | Medium | 2      | Schedule  | Docs that describe a `config.yaml` that doesn't exist are worse than no docs. New endpoints (R01, R02, R05) are undocumented |

---

## Watch for

- **Groups not opening the code** - "Confirmed? Y" on every row within 5 minutes means they didn't check. Ask them to show you R08 line 216
- **Everything is Fix now** - point at "Points left" going negative
- **No Accepts** - push back: "is R07 really worth 2 of your 8 points before Friday?"
- **Decoys marked Fix now** - don't correct in the room; save R06/R13 for the challenge round

## Good challenges for the challenge round

- "You accepted R07 - what would make you change your mind?"
- "R12 and R13 are the same code pattern. Why did you treat them differently?" (or why the same?)
- "R04 - who should have been allowed to turn that rule off?" (leads into Governance)
- "You spent points on R05 - is finance's export more important than R16's missing tests?"

## Links to Governance (15:20)

Which of these would an automated gate have blocked before Friday?

- **Would be blocked automatically:** R02 (SAST/linting catches f-string SQL), R03 (config scan), R14 (linter for unused imports), R16 (a coverage threshold), R17 (dependency scanning)
- **Needs a person:** R04 (a business rule turned off - needs an approver), R06/R13 (judgement: is this debt at all?), R18 (docs review)
