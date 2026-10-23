# Technical Debt ~ Dave's Release

!!! abstract "S21: Identify and remediate technical debt, assess for updates and obsolescence as part of continuous improvement"

!!! abstract "K28: Continuous improvement including how to: capture good practice and lessons learned."

## The Scenario

Yesterday you ran bikezelo - TechMart's pipeline monitor. TechMart's production copy has been looked after by **Dave**. Dave has left.

Everything Dave changed since February is in one release pull request. It goes to production **on Friday**. Nobody reviewed his work while he was here - so the review is yours.

**The PR:** [QAADE5/legacy-bikezelo #1 ~ Release for Friday go-live](https://github.com/QAADE5/legacy-bikezelo/pull/1)

---

## 1. Read the PR ~ on your own

- Start with the **Commits** tab - read Dave's commit messages in order. What was he under pressure to do?
- Then **Files changed** - this is every line Dave added or removed. Green is added, red is removed.
- Note anything that makes you think "why is it like that?"

You already know what the app does from yesterday, so you only need to read what Dave changed.

??? tip "Want to run Dave's version?"
    Optional - reading the PR is the task. Yesterday's install works for this too.

    ```bash
    git clone https://github.com/QAADE5/legacy-bikezelo.git
    cd legacy-bikezelo
    git checkout develop
    pip install -r requirements.txt
    python setup_db.py
    ```

    Then `python simulate.py` in one terminal and `python app.py` in another, and open [http://localhost:5000](http://localhost:5000).

---

## 2. Make the call ~ in your group

You can't fix everything before a release. Your job is to decide what gets fixed, and be able to say why.

Your group has one category and three of Dave's changes - find yours below. There is time to fix **one** of them before Friday.

=== "Security"

    | ID | Commit | What Dave changed |
    |------|--------|-------------------|
    | **S1** | `admin reset endpoint for demo day` | A new `/admin/reset` endpoint deletes every order. It checks a token passed in the URL |
    | **S2** | `customer lookup for support team` | A new `/data/customer/<id>` endpoint builds its SQL with an f-string from the URL |
    | **S3** | `debug on for remote demo` | The app now runs with `debug=True` on `0.0.0.0` - every network interface |

=== "Performance"

    | ID | Commit | What Dave changed |
    |------|--------|-------------------|
    | **P1** | `finance want full history - remove 500 row cap` | The orders table now keeps every order. The dashboard still reads the whole table every 3 seconds |
    | **P2** | `fix stats bug (reading df twice for now)` | Validation reads the database a second time. Comment: "passing df here broke the stats once, not sure why" |
    | **P3** | `finance export - needs to be live by Friday` | The export runs a separate `COUNT` query for every order |

=== "Code Quality"

    | ID | Commit | What Dave changed |
    |------|--------|-------------------|
    | **C1** | `tidy up` | The stats counting moved into `do_stuff(r)`, which returns `t, p, w, e, x` |
    | **C2** | `tidy up` | Three unused imports, an old `calculate_forecast_v1()` "kept for now", and a commented-out function marked FIXME |
    | **C3** | `add PENDING for finance` | The list of valid statuses is typed out separately in each file, with a comment to keep them in sync |

=== "Maintainability"

    | ID | Commit | What Dave changed |
    |------|--------|-------------------|
    | **M1** | `forecast crashing on empty data - return zeros` | `calculate_forecast()` now catches every exception and returns zeros |
    | **M2** | `skip flaky test` | One test is skipped ("flaky - fix later"). The three new endpoints have no tests |
    | **M3** | `add config.yaml support` | The README was last updated in March. Check what it says against the code |

Find each change in the PR, then agree three answers as a group:

1. **Fix now** - which one change gets fixed before Friday?
2. **If the other two ship** - what goes wrong first, and who notices?
3. **Why Dave did it** - what pressure was he under? The commit messages are your evidence.

Post your answers in the WebEx chat:

```text
Category:
Fix now:
If the other two ship:
Why Dave did it:
```

---

## 3. Challenge round

Each group has 2 minutes:

- Your **Fix now** change, and why it beat the other two
- What goes wrong if the other two ship

Then the next group challenges your call. Defend it or change your mind - both are fine, as long as you can say why.

---

## 4. Debt Decision Record ~ on your own

Write a short record for **one** of Dave's changes - your group's or another group's.

```text
Debt Decision Record

Item:        (ID and short title)
Where:       (file and line, and the commit)
What it is:  (one or two sentences)
Evidence:    (what you saw in the PR - code, comments, commit message)
Impact:      (what happens if this ships as-is - and who gets hurt)
Decision:    Fix now / Schedule / Accept
Reasoning:   (why - including what you gave up to make this call)
Prevention:  (what control or process would have stopped this getting in)
```
