# Technical Debt - The Inheritance

!!! abstract "S21: Identify and remediate technical debt, assess for updates and obsolescence as part of continuous improvement"

!!! abstract "K5: The inherent risks of data such as incomplete data, ethical data sources and how to ensure data quality"

## The Scenario

Dave built TechMart's pipeline monitor. Dave has left the company.

It works. It's yours now. It goes to production **on Friday**, and you have **8 points** of effort to spend before then.

---

## 1. Run it and read it

```bash
git clone https://github.com/QAADE5/legacy-bikezelo.git
cd legacy-bikezelo
pip install -r requirements.txt
python setup_db.py
python preload.py
```

Then open two terminals:

```bash
python simulate.py      # terminal 1
python app.py           # terminal 2
```

Open [http://localhost:5000](http://localhost:5000) and watch the dashboard for a minute.

!!! tip "If the install is slow"
    Start reading the code while `pip install` runs. Running the app is useful, but reading it is the main task.

Read the code in this order: `app.py`, `rules.py`, `simulate.py`, `README.md`.

- Watch the terminal running `simulate.py`. Do the bad rows it prints all show up red or amber on the dashboard?
- Write down anything that makes you think "why is it like that?"

---

## 2. Triage the register

Your trainer will share your group's copy of the **Technical Debt Register**.

For every row:

1. Open the file at the line(s) given and **check it's really there**
2. Fill in **Confirmed**, **Impact** and **Effort** (1 = under an hour, 2 = about half a day, 3 = a day or more)
3. If you don't think a row is debt at all, say so in **Why**

Not everything on the register is a problem. If you found something that isn't listed, add it to rows R19-R21, with a file and line.

---

## 3. Make the call

Give every row a **Decision**:

| Decision     | Means                                                  |
|--------------|--------------------------------------------------------|
| **Fix now**  | Must be fixed before Friday - costs points from your 8 |
| **Schedule** | Real debt, goes on the backlog for a later sprint      |
| **Accept**   | We choose to live with it - and write down why         |

Your **Fix now** items must fit inside 8 points. Check **Points left** at the bottom of the register.

Then fill in:

- Your **#1 fix-now item**
- The **one Accept** you think another group will challenge

---

## 4. Challenge round

Each group presents:

- Your **#1 fix-now** item - what it is, where it is (file/line), and why it beat everything else to your budget
- The **Accept** you expect to be challenged - and your reasoning

Then the next group challenges one of your decisions. Defend it or change your mind - both are fine, as long as you can say why.

---

## 5. Capture - Debt Decision Record

On your own, write a short record for **one** item from the register. This is evidence for your portfolio (S21).

```text
Debt Decision Record

Item:        (register ID and short title)
Where:       (file and line)
What it is:  (one or two sentences)
Evidence:    (what you saw in the code, or when you ran the app)
Impact:      (what happens if this ships as-is)
Decision:    Fix now / Schedule / Accept
Reasoning:   (why - including what you gave up to make this call)
Prevention:  (what control or process would have stopped this getting in)
```
