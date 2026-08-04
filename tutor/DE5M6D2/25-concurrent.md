## 🧪 <mark>Lab 2.5 ~ Competing for Capacity</mark>

Continues from Lab 2.4 - pipeline and all three sales files should still be in place. This one isn't about the data, it's about capacity: the environment runs on a small F2 capacity, and every Spark session (interactive or pipeline-triggered) has to fit within it.

### Part 1: Trigger the same pipeline multiple times

- Run the pipeline, then trigger it again without waiting - and again
- Watch **Monitor**: do the extra runs start immediately, queue, or get rejected?

### Part 2: Hold a Spark session open, then run the pipeline

- Open a new notebook, run one trivial cell (e.g. `spark.range(10).show()`), leave it open - this holds capacity for ~20 minutes even after the cell finishes
- While that session is alive, run the **Ingest Sales Data** pipeline
- Does it start straight away, queue, or fail? Check **Monitor** for both the notebook session and the pipeline run

---

### Overview

Deliberately left open - there's no asserted answer in the lab, learners find out live. Discussion: on a small capacity like this, is an idle notebook session a hidden cost worth actively managing? How would you notice (and prevent) a scheduled production pipeline getting starved by someone's forgotten notebook session?
