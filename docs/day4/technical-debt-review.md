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

!!! tip "Want to run Dave's version?"
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

## 2. Review your lens ~ in your group

Your trainer will share your group's copy of the **Technical Debt Register**. Your group owns one lens - use the tab with your lens name.

| Lens            | Your focus                                        |
|-----------------|---------------------------------------------------|
| Security        | Who could misuse this?                            |
| Performance     | What gets slower as the data grows?               |
| Code Quality    | What will the next person get wrong?              |
| Maintainability | What will go wrong without anyone noticing?       |

Your tab has **3 cards** - three of Dave's changes. For each one:

1. Find it in the PR - the **Commit** column tells you where to look
2. Fill in **Impact** and **Effort**
3. Give it a **Decision**:

| Decision     | Means                                                  |
|--------------|--------------------------------------------------------|
| **Fix now**  | Must be fixed before Friday                            |
| **Schedule** | Real debt - it goes on the backlog for a later sprint  |
| **Accept**   | We choose to live with it - and write down why         |

There's only time to fix **one** card before Friday. Exactly one card is **Fix now**.

Then **write the fix** - the lines of code you'd change for your Fix now card. You don't need to run it.

Found something in the PR that isn't on your cards? Add it to the **Found it ourselves** rows.

---

## 3. Challenge round

Each group presents:

- Your **Fix now** card - what it is, where it is (file and line), and your fix
- Why it beat your other two cards

Then the next group challenges your decision. Defend it or change your mind - both are fine, as long as you can say why.

---

## 4. Debt Decision Record ~ on your own

Write a short record for **one** card - yours or another group's. This is evidence for your portfolio (S21).

If you choose **K28 / S21** for this afternoon's presentation, this is your starting point.

```text
Debt Decision Record

Item:        (card ID and short title)
Where:       (file and line, and the commit)
What it is:  (one or two sentences)
Evidence:    (what you saw in the PR - code, comments, commit message)
Impact:      (what happens if this ships as-is - and who gets hurt)
Decision:    Fix now / Schedule / Accept
Reasoning:   (why - including what you gave up to make this call)
Prevention:  (what control or process would have stopped this getting in)
```
