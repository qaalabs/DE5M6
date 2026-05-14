# Lab 4.2 ~ Uncomment the Rules

Open `rules.py` in VS Code. The file has numbered steps — uncomment each block and save. The next validation sweep picks up your changes automatically, no restart needed.

## Step 1 ~ Catch missing customer IDs

Uncomment the `ExpectColumnValuesToNotBeNull` block.

Rows with a missing `customer_id` turn **red** on the next sweep.

## Step 2 ~ Catch order amounts outside range

Uncomment the `ExpectColumnValuesToBeBetween` block.

Rows with a negative `order_amount` turn **red**. You can adjust the `min_value` and `max_value` if you want to experiment.

## Step 3 ~ Catch invalid status codes

Uncomment the `ExpectColumnValuesToBeInSet` block.

Rows with a status not in `["NEW", "PAID", "SHIPPED", "REFUNDED"]` turn **red**. Try adding or removing values from the set.

## What to notice

- Rules are declarative — you describe what *should* be true, not how to check it
- `get_rules()` produces red rows (failures), `get_warnings()` produces amber rows (warnings)
- Step 5 in `get_warnings()` catches malformed timestamps — uncomment it and watch the amber rows appear
