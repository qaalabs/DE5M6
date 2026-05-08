## <mark>Bikezelo ~ walkthrough</mark>

| File | What it does |
|------|-------------|
| `simulate.sh` | Writes a new order record every 2 seconds — including bad rows |
| `app.py` | Flask app — serves the dashboard, runs validation every 30 seconds |
| `rules.py` | Great Expectations rules — **this is the file you edit** |
| `index.html` | Dashboard — live feed + pipeline stats + forecast |

### Dashboard panels

- **Live feed** — rows arrive white, turn green (pass) or red (fail) after next sweep
- **Pipeline stats** — totals, error rate, forecast of rows and errors per hour
