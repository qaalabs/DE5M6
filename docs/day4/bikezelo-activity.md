# Lab 4.1 ~ Clone, Setup and Run Bikezelo

!!! abstract "S18: Develop simple forecasts and monitoring tools to anticipate or respond immediately to outages and incidents."

Bikezelo is a lightweight pipeline monitoring dashboard writen for this module. It simulates a live data feed, validates incoming records against quality rules, and forecasts pipeline behaviour.

## Setup

### Step 1. In the VM Open the Terminal app.

- This will give you a Windows PowerShell Command prompt

### Step 2. Clone the repository

```bash
git clone https://github.com/ingwaneorg/bikezelo.git
```

### Step 3. Move into the project directory

```bash
cd bikezelo
```

### Step 4. Install Python dependencies

```bash
pip install -r requirements.txt
```

### 5. Set up the database:

```bash
python setup_db.py
```

---

## Running the program

You'll need two terminals, both inside the `bikezelo` directory.

### Step 1. In your existing terminal (Terminal 1), start the simulation:

```bash
python simulate.py
```

### Step 2. Open a second terminal, move into `bikezelo`, then start the app:

```bash
cd bikezelo
```
```bash
python app.py
```

### Step 3. Open a browser at `http://localhost:5000`

## What you should see

Rows arrive every 2 seconds in the live feed. 

Each row starts white (unvalidated), then turns green, amber, or red on the next validation sweep (every 10 seconds).

Roughly 1 in 8 rows is intentionally bad. 

Occasionally a spike fires - a burst of 4–8 consecutive bad rows. Watch the error rate and SLA indicator respond.

