## 🧪 <mark>Lab 3.1</mark> ~ Medallion Architecture

<span style="background-color: orange;">Give learners the link:</span> 
https://qaalabs.github.io/DE5M6/labs/31-medallion/

### Data source

- Files are in `M6/day3/` in the learner repo clone (`https://github.com/QAADE5/M6`) - same clone used for Day 2's `day2/` files.

### Activities

- Create a workspace and lakehouse
- Upload data to the bronze layer - confirm all 3 files landed
- Transform and validate data, load to the silver Delta table
- Explore the silver layer using the SQL endpoint
- Transform data for the gold layer, with a reconciliation check
- Explore the gold layer using the SQL endpoint

---

### Quality dimensions -> layer mapping (answer key for lab Step 8)

Use to steer the group discussion, not to read out - the lab only gives them Completeness and Validity as worked examples.

| Dimension | Layer | Where |
|-----------|-------|-------|
| Completeness | Bronze | manifest check - all 3 expected files present |
| Completeness | Silver | Cell 3 - `SalesOrderNumber` has no nulls |
| Validity | Silver | Cell 2 type coercion + Cell 3 - `OrderDate` is a real date |
| Accuracy | Silver | Cell 3 - `Quantity` / `UnitPrice` are positive |
| Uniqueness | Silver | Cell 3 - no duplicate rows remain |
| Consistency | Gold | Cell 2 - reconciliation check against the silver-derived total |

**Timeliness** isn't exercised anywhere in this lab - flag it if a group tries to force-fit it in.
