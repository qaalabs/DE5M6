# Bikezelo ~ Live Pipeline Monitor

Bikezelo is a lightweight pipeline monitoring dashboard. It simulates a live data feed, validates incoming records against quality rules, and forecasts pipeline behaviour.

## Setup

```bash
git clone https://github.com/ingwaneorg/bikezelo.git
cd bikezelo
pip install -r requirements.txt
```

## Running

Open two terminals.

**Terminal 1 — start the simulation:**
```bash
bash bin/simulate.sh
```

**Terminal 2 — start the app:**
```bash
python app.py
```

Open a browser at `http://localhost:5000`

---

## Activity

Open `rules.py` in VS Code. Work through each level below.

### Level A ~ Catch missing customer IDs

Uncomment the **Step 1** block in `rules.py`. Save the file.

Watch the dashboard — rows with a missing `customer_id` turn red on the next validation sweep.

### Level B ~ Catch negative order amounts

Uncomment the **Step 2** block. Save the file.

Watch the dashboard — rows with an `order_amount` outside the valid range turn red.

### Level C ~ Catch invalid status codes

Uncomment the **Step 3** block. Save the file.

Watch the dashboard — rows with a `PROCESSING` status (not in the valid set) turn red.

---

## What to notice

- Rules are declarative — you describe what *should* be true, not how to check it
- The dashboard updates automatically when you save a new rule
- The forecast panel shows projected rows and errors per hour based on current rate
