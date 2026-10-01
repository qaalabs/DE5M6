## <mark>Warning vs failure ~ a governance decision</mark>

The dashboard has two rule types:

- `get_rules()` → rows turn **red** (fail)
- `get_warnings()` → rows turn **amber** (warn)

**Discussion:**

- Step 5 catches malformed timestamps — why is that a warning and not a failure?
- Who decides where the line is?
- What happens in your organisation when a rule is ambiguous?
