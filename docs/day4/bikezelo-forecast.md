# Lab 4.3 ~ How Does Bikezelo Forecast?

This lab is an investigation — read the code and answer the questions below.

## Part 1 ~ Find the forecast logic

Open `app.py` and find the `calculate_forecast` function.

- What two numbers does it return?
- What data does it use to calculate them?
- What assumptions does it make?
- What would make the forecast wrong?

## Part 2 ~ Find the SLA threshold

Open `templates/index.html` and search for `SLA_TARGET`.

- What is the default value?
- What happens on the dashboard when the error rate exceeds it?
- Change the value and save — does the dashboard respond?

## Part 3 ~ Think about your own systems

- How would you set an SLA threshold for a pipeline at your workplace?
- Who would decide the number — and what would it be based on?
