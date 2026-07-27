# SQL Training Exercises

A hands-on SQL exercise set covering beginner to advanced topics, built around a fictional company database.

## How to Use

1. Install [`uv`](https://docs.astral.sh/uv/) if you do not already have it

```powershell
winget install -e --id astral-sh.uv
```

2. Run `uv sync` to create the project environment and install DuckDB
3. Start Python with `uv run python`
4. Create the local DuckDB database and load the sample data:

```python
from pathlib import Path
import duckdb

con = duckdb.connect("training.duckdb")
con.execute(Path("00_setup.sql").read_text())
```

5. Work through the exercise files in order
6. Write your answers directly below each exercise comment
7. Run individual queries from the same Python session, for example:

```python
con.sql("""
SELECT first_name, last_name, job_title
FROM employees;
""").show()
```

If you want a fresh database each time, delete `training.duckdb` and rerun the setup snippet.

## Files

| File | Level | Topics |
|------|-------|--------|
| `00_setup.sql` | Setup | Creates tables and inserts sample data |
| `01_beginner.sql` | Beginner | SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, LIKE, NULL |
| `02_intermediate.sql` | Intermediate | JOINs, GROUP BY, HAVING, Aggregates, Subqueries |
| `03_advanced.sql` | Advanced | Window functions, CTEs, CASE, Date functions |

## Database Schema

```
departments        employees               projects
-----------        ---------               --------
id                 id                      id
name               first_name              name
location           last_name               budget
                   email                   start_date
                   department_id  ──►  departments.id
                   manager_id     ──►  employees.id
                   salary
                   hire_date
                   job_title

employee_projects              sales
-----------------              -----
employee_id  ──►  employees.id  employee_id  ──►  employees.id
project_id   ──►  projects.id   id
role                            amount
hours_logged                    sale_date
                                product
                                region
```

## Runtime

This repo now targets **DuckDB** through the project's `uv`-managed Python environment.
No separate SQL server is required, and the setup instructions in this repo assume DuckDB semantics.
