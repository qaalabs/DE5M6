# Lab 4.1 ~ Clone, Setup and Run Bikezelo

Bikezelo is a lightweight pipeline monitoring dashboard. It simulates a live data feed, validates incoming records against quality rules, and forecasts pipeline behaviour.

## Setup

```bash
git clone https://github.com/ingwaneorg/bikezelo.git
cd bikezelo
pip install -r requirements.txt
python setup_db.py
```

## Running

Open two terminals.

**Terminal 1 — start the simulation:**
```bash
python simulate.py
```

**Terminal 2 — start the app:**
```bash
python app.py
```

Open a browser at `http://localhost:5000`

## What you should see

Rows arrive every 2 seconds in the live feed. Each row starts white (unvalidated), then turns green, amber, or red on the next validation sweep (every 10 seconds).

Roughly 1 in 8 rows is intentionally bad. Occasionally a spike fires — a burst of 4–8 consecutive bad rows. Watch the error rate and SLA indicator respond.
