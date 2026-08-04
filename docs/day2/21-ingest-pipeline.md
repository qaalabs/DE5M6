# Lab 2.1 ~ Ingest Data with a Rerunnable Pipeline

A data lakehouse is a common analytical data store for cloud-scale analytics solutions. One of the core tasks of a data engineer is to implement and manage the ingestion of data from multiple operational data sources into the lakehouse.

In this lab you'll build a pipeline that you rerun several times today, against different versions of the source data, without ever having to change it. That only works because of two design choices: the notebook reads *every* file currently in the source folder rather than one specific file, and it writes with `overwrite` (not `append`) so a rerun always reflects the current state of that folder rather than piling more rows on top of what's already there.

!!! info "For this lab, you will access the QA Platform and sign in using the credentials provided."

!!! warning "You must use an incognito or private browser window to avoid conflicts with any work or personal Microsoft accounts you may already be signed in to."


## Step 1: Create a workspace

1. In the navigation pane on the left, select **Workspaces** (the icon looks similar to &#128455;).

2. Select **+ New workspace**, then create a workspace using the naming format below:

    - Start the name with `fab_workspace`
    - Add random numbers to make it unique (for example, `fab_workspace123`)
    - Leave all other options as the default values
    - Click **Apply**


## Step 2: Create a lakehouse

1. On the menu bar on the left, select **Create**. In the *New* page, under the *Data Engineering* section, select **Lakehouse**.

    - Name the lakehouse `fab_lakehouse`
    - Leave **Lakehouse schemas** selected.

    !!! tip "If the **Create** option is not pinned to the sidebar, you need to select the ellipsis (…) option first."


## Step 3: Upload the source file

1. In the **Explorer** pane of the lakehouse, click the **...** menu for the **Files** folder and select **New subfolder**.

    - Name the new subfolder: `new_data`
    - Click **Create**

2. Locate `sales.csv` - a small, clean batch of sales orders - in the `M6/day2/` folder on your Desktop.

    !!! note "If you cannot find the `M6` folder, you may need to re-run the `git clone` command."

3. In the **...** menu for the `new_data` folder, select **Upload** and **Upload files**, and upload `sales.csv`.


## Step 4: Create the notebook

1. At the top-right of the Lakehouse page, select the **Analyze data with** dropdown, then **Notebook** > **New notebook**.

2. Select the existing cell, and replace its contents with:

    ```python
    table_name = "sales"
    ```

3. Add a new code cell below it:

    ```python
    from pyspark.sql.functions import *

    # Read every CSV currently in the folder. As new files land here on
    # later reruns, this line does not need to change.
    df = spark.read.format("csv").option("header", "true").load("Files/new_data/*.csv")

    # UnitPrice arrives as text - cast it so it can be filtered numerically
    df = df.withColumn("UnitPrice", col("UnitPrice").cast("double"))

    # Add month and year columns
    df = df.withColumn("Year", year(col("OrderDate"))).withColumn("Month", month(col("OrderDate")))

    # Derive FirstName and LastName columns
    df = df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))

    # Filter and reorder columns
    df = df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "EmailAddress", "Item", "Quantity", "UnitPrice", "TaxAmount"]

    # Data quality check: a missing or negative UnitPrice is not valid
    before_count = df.count()
    df = df.filter(col("UnitPrice").isNotNull() & (col("UnitPrice") >= 0))
    dropped = before_count - df.count()
    print(f"Dropped {dropped} row(s) with a missing or negative UnitPrice")

    # Load the data into a table - overwrite (not append) so a rerun reflects
    # the current folder rather than adding to what's already there;
    # overwriteSchema so a change in the source columns doesn't fail the write
    df.write.format("delta").mode("overwrite").option("overwriteSchema", "true").saveAsTable(table_name)

    print(f"Saved {table_name}: {df.count()} row(s)")
    ```

4. Run all cells (**Run all**).

    !!! note
        Since this is the first time you've run any Spark code in this session, the Spark pool must be started - the first cell can take a minute or so to complete.

5. Once it finishes, use the ⚙️ **Settings** icon to name the notebook `Load Sales`.


## Step 5: Build the pipeline

1. In the navigation pane on the left, select your workspace name to return to the workspace view.

2. Select **New item**, search for **Pipeline**, and create one named `Ingest Sales Data`.

3. On the **Activities** tab, add a **Notebook** activity to the canvas.

4. Select it, and on the **Settings** tab, choose your `Load Sales` notebook.

5. On the **Home** tab, save the pipeline.


## Step 6: Run it, and check what happened

1. Use the :material-play: **Run** button to run the pipeline.

2. Go to the **Monitor** hub and confirm the run succeeded.

3. In your lakehouse, refresh **Tables** and open `sales` to view the data.

4. Note down the row count shown by the notebook's final `print` statement (or count the table). You'll compare against this later today.

| Run     | Input     | Row count |
|---------|-----------|-----------|
| Lab 2.1 | sales.csv |           |

You now have a working, rerunnable pipeline: read whatever's in `Files/new_data`, drop anything with a bad price, overwrite the table. You'll rerun this exact pipeline - unchanged - twice more today.
