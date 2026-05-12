## <mark>Bikezelo ~ walkthrough</mark>

| File | What it does |
|------|-------------|
| `simulate.py` | Writes a new TechMart order record every 2 seconds — including bad rows |
| `app.py` | Flask app — serves the dashboard, runs validation every 10 seconds |
| `rules.py` | Great Expectations rules — **this is the file you edit** |
| `templates/index.html` | Dashboard — live feed + pipeline stats + forecast |

### Dashboard panels

- **Live feed** — rows arrive white, turn green (pass), amber (warning), or red (fail) after next validation sweep
- **Pipeline stats** — totals, error rate, SLA status, trend arrow
- **Forecast** — projected rows and errors per hour based on current rate
