# Lab 3.1 ~ Medallion Quality Audit

## The Scenario

You are a data engineer at **TechMart**. Overnight, a colleague's notebook ran the sales pipeline - raw orders in, bronze, silver, and gold layers out. It finished without errors.

This morning it's your job to check whether "finished without errors" actually means "the data is trustworthy." You are not building anything - you are **auditing a pipeline that already ran**.

!!! note "Do not edit or re-run the cells below"
    The code and its output are exactly what your colleague's notebook produced. Read them as a monitoring log, not as an exercise to complete.

---

## The pipeline run

### Cell 1 - Load bronze

```python
import pandas as pd
import glob

columns = ['SalesOrderNumber', 'SalesOrderLineNumber', 'OrderDate', 'CustomerName',
           'Email', 'Item', 'Quantity', 'UnitPrice', 'Tax']

files = glob.glob('/data/bronze/*.csv')
df = pd.concat([pd.read_csv(f, header=None, names=columns) for f in files], ignore_index=True)

print(f'Bronze: {len(files)} files loaded - {files}')
print(f'Bronze: {len(df)} rows')
```

```text
Bronze: 2 files loaded - ['2019.csv', '2020.csv']
Bronze: 6412 rows
```

### Cell 2 - Clean

```python
df['OrderDate'] = pd.to_datetime(df['OrderDate'], errors='coerce')
df['Quantity'] = pd.to_numeric(df['Quantity'], errors='coerce')
df['UnitPrice'] = pd.to_numeric(df['UnitPrice'], errors='coerce')
df['Tax'] = pd.to_numeric(df['Tax'], errors='coerce')
df['CustomerName'] = df['CustomerName'].fillna('Unknown')
df = df.drop_duplicates()

print(f'Silver: {len(df)} rows')
```

```text
Silver: 6398 rows
```

### Cell 3 - Validate before saving

```python
assert df['SalesOrderNumber'].isnull().sum() == 0, "SalesOrderNumber should have no nulls"
assert pd.api.types.is_datetime64_any_dtype(df['OrderDate']), "OrderDate should be a valid date"
assert (df['Quantity'] > 0).all(), "all quantities should be positive"
assert (df['UnitPrice'] > 0).all(), "all unit prices should be positive"
assert df.duplicated().sum() == 0, "no duplicate rows should remain"

print('All validation checks passed')
print(df['UnitPrice'].describe())
```

```text
All validation checks passed

count     6398.00
mean        84.31
std        607.02
min          4.99
max      50000.00
Name: UnitPrice, dtype: float64
```

### Cell 4 - Write sales_silver

```python
df.to_parquet('/data/silver/sales_silver.parquet')

print('Saved: sales_silver')
```

```text
Saved: sales_silver
```

### Cell 5 - Build gold

```python
import duckdb

summary = duckdb.query("""
    SELECT YEAR(OrderDate) AS Year,
           ROUND(SUM(Quantity * (UnitPrice + Tax)), 2) AS TotalSales
    FROM df
    GROUP BY YEAR(OrderDate)
    ORDER BY YEAR(OrderDate)
""").to_df()

summary.to_parquet('/data/gold/sales_gold.parquet')
print(summary)
```

```text
   Year  TotalSales
0  2019   412998.55
1  2020   598104.20
```

---

## Your task

1. Work through the run above layer by layer - bronze, silver, gold.
2. For each layer, find the evidence in the output that something is off, and name the DMBOK dimension it falls under.
3. Record your findings in the shared doc using the table below.
4. Decide what you'd do about each issue - fix upstream, alert, quarantine, block the gold refresh?

| Layer  | Evidence in the output | DMBOK dimension | Recommended action |
|--------|-------------------------|------------------|---------------------|
| Bronze |                          |                  |                     |
| Silver |                          |                  |                     |
| Gold   |                          |                  |                     |

!!! tip "The validation cell says 'All validation checks passed'"
    Passing validation is not the same as being correct. Look at what the checks actually assert - and what they don't.

Bring your findings to the discussion straight after this lab - it picks up exactly where this audit leaves off.
