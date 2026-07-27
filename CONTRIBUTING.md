# How to Submit Your Answers

## Step 1 — Fork the Repo

1. Go to the repo on GitHub
2. Click **Fork** (top right)
3. This creates your own copy of the repo

---

## Step 2 — Set Up the Database

This repo uses DuckDB through the local `uv` Python environment. You do not need PostgreSQL, MySQL, SQL Server, or a browser-based SQL sandbox.

1. Install [`uv`](https://docs.astral.sh/uv/)

```powershell
winget install -e --id astral-sh.uv
```

2. Run `uv sync` from the repo root
3. Start Python with `uv run python`
4. Load the schema and sample data:

```python
from pathlib import Path
import duckdb

con = duckdb.connect("training.duckdb")
con.execute(Path("00_setup.sql").read_text())
```

5. Optional sanity check:

```python
con.sql("SHOW TABLES").show()
```

---

## Step 3 — Solve the Exercises

Work through the files in order:

| File | Level |
|------|-------|
| `01_beginner.sql` | Beginner |
| `02_intermediate.sql` | Intermediate |
| `03_advanced.sql` | Advanced |

Write your query below each exercise comment and run it from the same DuckDB connection to see the results.

Example:

```python
con.sql("""
SELECT first_name, last_name
FROM employees
LIMIT 5;
""").show()
```

---

## Step 4 — Submit Your Answers

1. In your fork, create a folder: `submissions/your-name/`
2. For each exercise file, save your queries as a `.sql` file in that folder
   - e.g. `submissions/bob/01_beginner.sql`
3. Take a **screenshot** of the results for each exercise from your terminal or Python session and save them in the same folder
   - e.g. `submissions/bob/screenshots/01_ex01.png`
4. Commit and push to your fork
5. Open a **Pull Request** to the main repo

---

## Folder Structure Example

```
submissions/
  bob/
    01_beginner.sql
    02_intermediate.sql
    screenshots/
      01_ex01.png
      01_ex02.png
      ...
```

---

## Tips

- You don't have to finish everything in one go — submit a PR when you're done with each file
- If you need to reset the database, delete `training.duckdb`, start `uv run python` again, and rerun the setup snippet
- If a query isn't working, try breaking it into smaller parts
- Google is allowed — learning how to find answers is part of the job
