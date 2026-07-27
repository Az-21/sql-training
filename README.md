# SQL Training Exercises

A hands-on SQL exercise set covering beginner to advanced topics, built around a fictional company database.

## How to Use

1. Install [`uv`](https://docs.astral.sh/uv/) if you do not already have it

```powershell
winget install astral-sh.uv
```

2. Run `uv sync` to create the project environment and install DuckDB

```powershell
git clone https://github.com/Az-21/sql-training
cd sql-training
uv sync
```

3. Create your own working folder by copying `submissions/sample-user/` to `submissions/your-name/`
4. For example, if your name is Alex, copy it to `submissions/alex/`
5. Change into your copied folder and run the example script:

```powershell
# cd into root of repo
Copy-Item -Recurse ./submissions/sample-user ./submissions\alex
cd ./submissions/alex
uv run 01_beginner.py
```

6. Keep your SQL logic in `.sql` files
7. Use the `.py` files only to load and call those `.sql` files; avoid writing SQL directly inside `.py`
8. Work through the exercise files in order

## Files

| File                  | Level        | Topics                                               |
| --------------------- | ------------ | ---------------------------------------------------- |
| `00_setup.sql`        | Setup        | Creates tables and inserts sample data               |
| `01_beginner.sql`     | Beginner     | SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, LIKE, NULL |
| `02_intermediate.sql` | Intermediate | JOINs, GROUP BY, HAVING, Aggregates, Subqueries      |
| `03_advanced.sql`     | Advanced     | Window functions, CTEs, CASE, Date functions         |

## Database Schema

```
departments        employees               projects
-----------        ---------               --------
id                 id                      id
name               first_name              name
location           last_name               budget
                   email                   start_date
                   department_id    ->     departments.id
                   manager_id       ->     employees.id
                   salary
                   hire_date
                   job_title

employee_projects              sales
-----------------              -----
employee_id  ->   employees.id  employee_id   ->  employees.id
project_id   ->   projects.id   id
role                            amount
hours_logged                    sale_date
                                product
                                region
```

## Runtime

This repo now targets **DuckDB** through the project's `uv`-managed Python environment.
No separate SQL server is required, and the setup instructions in this repo assume DuckDB semantics.
