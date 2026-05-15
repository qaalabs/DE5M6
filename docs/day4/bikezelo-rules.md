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

## Step 4 ~ Catch suspiciously long customer IDs

Uncomment the `ExpectColumnValueLengthsToBeBetween` block.

A valid ID like `CUST1234` is 8 characters. Anything much longer suggests corrupted or injected data — those rows turn **red**.

## Step 5 ~ Write your own rule

Look at the available expectations listed in the `get_rules()` docstring. Pick one and add it yourself — for example, you could check that `customer_id` values are unique, or that `order_amount` is never zero.

```python
suite.add_expectation(
    gx.expectations.ExpectColumnValuesToBeUnique(column="customer_id")
)
```

Write the `suite.add_expectation(...)` call directly under the `# Step 5` comment (no uncommenting needed — just type it in).

## Step 6 ~ Add a warning for malformed timestamps

This one is in `get_warnings()`, not `get_rules()`. Uncomment the `ExpectColumnValuesToMatchRegex` block.

Rows with a timestamp that doesn't match `2026-03-05T23:54:31` format turn **amber** — suspicious but not rejected.

## What to notice

- Rules are declarative — you describe what *should* be true, not how to check it
- `get_failures()` → failures turn **red**; `get_warnings()` → warnings turn **amber**
- The same expectation type can be a hard failure or a soft warning depending on which function it lives in
