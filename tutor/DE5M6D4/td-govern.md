## <mark>Would a pipeline have caught it? ~ discussion</mark>

*draw on 2-3 people*

- Show `rules.py` 29-35: "disabled 14/02 - too many red rows, ops team complained. dave"
- "Who should have been allowed to turn that rule off?" *(links to yesterday's WARN-FAIL and WORK-RULES)*
- Better fix: make it a warning rule, not delete it. And PENDING (commit 12) isn't in its list - switching it back on would turn every PENDING row red
- "Which of Dave's changes would a pipeline gate or a reviewer have blocked?" *(links to Lab 3.2 deployment pipelines)* - automatic: S2, S3, the skipped test, unused imports. Needs a person: the status rule, P1, the decoy
- Updates and obsolescence: `requirements.txt` - nothing pinned, `pyyaml` added and never removed. "What would you pin? How do you find out a version is end-of-life?"
- Close: "Where does your workplace draw that line?"
