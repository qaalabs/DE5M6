# Data Quality Management Demo

This notebook demonstrates how data quality can be automated and managed using quality checks.

We'll use a simple customer orders dataset and apply three common quality checks:
1. **Not Null** - certain fields must always have values
2. **Value Range** - numeric values must fall within acceptable bounds
3. **Categorical Values** - text fields must contain only valid options


```python
# Install Great Expectations (run this once)
# !pip install great_expectations pandas
```


```python
import pandas as pd
import great_expectations as gx
```

## 1. Create Sample Customer Orders Data

This dataset contains some intentional quality issues for demonstration purposes.


```python
# Create sample customer orders with intentional quality issues
data = {
    'order_id': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012],
    'customer_id': ['C001', 'C002', None, 'C004', 'C005', 'C006', 'C007', None, 'C009', 'C010', 'C011', 'C012'],  # Missing values
    'order_amount': [45.50, 123.75, 89.00, -10.50, 234.00, 67.80, 450.00, 12.99, 156.70, 89.99, 2500.00, 45.00],  # Negative and very high values
    'status': ['pending', 'completed', 'completed', 'pending', 'cancelled', 'completed', 'shipped', 'pending', 'completed', 'cancelled', 'completed', 'pending']  # 'shipped' is not valid
}

df = pd.DataFrame(data)

# Display the data
print("Customer Orders Dataset:")
print(df)
print(f"\nTotal records: {len(df)}")
```

## 2. Set Up Great Expectations

We create a validation context and load our data for quality checking.


```python
# Create a Great Expectations context
context = gx.get_context()

# Create a data source and asset from our DataFrame
data_source = context.data_sources.add_pandas(name="orders_data")
data_asset = data_source.add_dataframe_asset(name="customer_orders")
batch_definition = data_asset.add_batch_definition_whole_dataframe("orders_batch")
batch = batch_definition.get_batch(batch_parameters={"dataframe": df})

print("Data loaded and ready for validation")
```

## 3. Define Data Quality Expectations

We'll create three key quality checks:

**Check 1: Customer ID must not be null**  
Every order must have a customer associated with it.

**Check 2: Order amount must be between £0 and £2000**  
Order values must be positive and within reasonable bounds.

**Check 3: Status must be one of: 'pending', 'completed', 'cancelled'**  
Only valid status values are allowed.


```python
# Create an expectation suite
suite = context.suites.add(gx.ExpectationSuite(name="orders_quality_suite"))

# Check 1: customer_id must not be null
suite.add_expectation(
    gx.expectations.ExpectColumnValuesToNotBeNull(column="customer_id")
)

# Check 2: order_amount must be between 0 and 2000
suite.add_expectation(
    gx.expectations.ExpectColumnValuesToBeBetween(
        column="order_amount",
        min_value=0,
        max_value=2000
    )
)

# Check 3: status must be one of the valid values
suite.add_expectation(
    gx.expectations.ExpectColumnValuesToBeInSet(
        column="status",
        value_set=['pending', 'completed', 'cancelled']
    )
)

print("Quality expectations defined successfully")
print(f"Total expectations: {len(suite.expectations)}")
```

## 4. Run Validation

Execute the quality checks against our dataset.


```python
# Create a validation definition
validation_definition = context.validation_definitions.add(
    gx.ValidationDefinition(
        name="orders_validation",
        data=batch_definition,
        suite=suite
    )
)

# Run the validation
validation_result = validation_definition.run(batch_parameters={"dataframe": df})

print("Validation complete!")
```

## 5. Review Results

Let's examine which quality checks passed and which failed.


```python
# Display overall success status
print("=" * 60)
print("VALIDATION RESULTS SUMMARY")
print("=" * 60)
print(f"Overall Status: {'PASSED' if validation_result.success else 'FAILED'}")
print(f"\nExpectations evaluated: {validation_result.statistics['evaluated_expectations']}")
print(f"Successful expectations: {validation_result.statistics['successful_expectations']}")
print(f"Failed expectations: {validation_result.statistics['unsuccessful_expectations']}")
print(f"Success rate: {validation_result.statistics['success_percent']:.1f}%")
print("\n" + "=" * 60)
```


```python
# Display detailed results for each expectation
print("\nDETAILED RESULTS:\n")

for result in validation_result.results:
    expectation_type = result.expectation_config.type
    column = result.expectation_config.kwargs.get('column', 'N/A')
    success = result.success
    
    status_symbol = "✓" if success else "✗"
    status_text = "PASSED" if success else "FAILED"
    
    print(f"{status_symbol} {status_text}: {expectation_type}")
    print(f"   Column: {column}")
    
    # Show specific details based on expectation type
    if not success:
        if expectation_type == "expect_column_values_to_not_be_null":
            unexpected_count = result.result.get('unexpected_count', 0)
            print(f"   Issue: {unexpected_count} null values found")
        elif expectation_type == "expect_column_values_to_be_between":
            unexpected_count = result.result.get('unexpected_count', 0)
            print(f"   Issue: {unexpected_count} values outside allowed range")
        elif expectation_type == "expect_column_values_to_be_in_set":
            unexpected_count = result.result.get('unexpected_count', 0)
            unexpected_values = result.result.get('partial_unexpected_list', [])
            print(f"   Issue: {unexpected_count} invalid values found: {unexpected_values}")
    
    print()
```

## Key Takeaways

This demo shows how data quality can be:
- **Automated** - checks run programmatically without manual inspection
- **Standardised** - same rules applied consistently across all data
- **Documented** - clear expectations that serve as data contracts
- **Measurable** - quantifiable pass/fail results

In production systems, these checks would typically:
- Run automatically as part of data pipelines
- Trigger alerts when validation fails
- Block bad data from entering downstream systems
- Generate reports for data stewards
