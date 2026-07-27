# SQL Training Exercises

A hands-on SQL exercise set covering beginner to advanced topics, built around a fictional company database.

## How to Use

1. Run `00_setup.sql` first to create all tables and load sample data
2. Work through the exercise files in order
3. Write your answers directly below each exercise comment

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

## Compatible With

Works with any standard SQL database: **PostgreSQL**, **MySQL**, **SQLite**, **SQL Server**.  
Minor syntax differences may apply for date functions and window functions on older versions.
