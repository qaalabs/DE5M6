# Lab 3.3 ~ Clone, Setup and Run Bikezelo

!!! abstract "S18: Develop simple forecasts and monitoring tools to anticipate or respond immediately to outages and incidents."

!!! abstract "K27: The principles of descriptive, predictive and prescriptive analytics."

Bikezelo is TechMart's pipeline monitor - a lightweight dashboard written for this module. It simulates a live data feed, validates incoming records against quality rules, and forecasts pipeline behaviour.

## Setup

### Step 1. In the VM Open the Terminal app.

This will give you a Windows PowerShell Command prompt:

```
PS C:\User\Admin
```

Change directory:

```bash
cd Desktop
```

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
python -m pip install -r requirements.txt
```


### Step 5. Set up the database:

```bash
python setup_db.py
```

### Step 6: Preload seed data:

Run this setup to pre-load data to the database using the package `dlt`

```bash
python preload.py
```

---

### Open Visual Studio Code

We will use VS Code to edit the code. To start the program run:

```bash
code .
```

*Note: Include the `.` as in `code .` as this runs VS Code from your current folder.*

!!! success "VS Code should open. Close any popups. You should now see the project files on the left."

---

## Running the program

You'll need two terminals, both inside the `bikezelo` directory.

### Step 1. In your existing terminal (Terminal 1), start the simulation:

```bash
python simulate.py
```

### Step 2. <mark>Open a second terminal tab</mark> (Terminal 2), move into `bikezelo`, then start the app:

```text
cd Desktop\bikezelo
```

Then run:

```bash
python app.py
```

### Step 3. Open a browser at `http://localhost:5000`

!!! success "You should now see the bikezelo app running in your browser"

---

## Things to note:

Rows arrive every 2 seconds in the live feed. 

Each row starts white (unvalidated), then turns green, amber, or red on the next validation sweep (every 10 seconds).

Roughly 1 in 8 rows is intentionally "bad". 

Occasionally a spike fires - a burst of 4–8 consecutive bad rows. Watch the error rate and SLA indicator respond.

### Terminal windows

- Terminal 1 will show the data being streamed into the database
- Terminal 2 will show the webserver running the app. Any log messages from within the app will appear here.
