-- Exercise 1
-- Show each employee's full name along with their department name.
select 
    e.first_name,
    e.last_name,
    d.name
from employees e
join departments d
on e.id = d.id;

-- Exercise 2
-- Show each employee's full name and their manager's full name.
-- If an employee has no manager, still show their name (with NULL for manager).
select 
    e.first_name,
    e.last_name,
    e2.first_name,
    e2.last_name,
from employees e
left join employees e2
on e2.id = e.manager_id;

-- Exercise 4
-- Find the average salary per department.
-- Only show departments where the average salary is above 80,000.

select 
    d.id, d.name, avg(e. salary)
from employees e 
join departments d 
on e.department_id  = d.id 
group by d.id, d.name
having avg(e. salary)>80000;

-- Exercise 5
-- Find the highest and lowest salary in the company per job title.
select
    max(salary),
    min(salary),
    job_title
from employees
group by job_title;


-- ============================================================
-- Exercise 6
-- Show each project's name and the number of employees assigned to it.
-- Include projects that have no employees assigned.
-- ============================================================

SELECT
    p.name AS project_name,
    COUNT(ep.employee_id) AS employee_count
FROM projects p
LEFT JOIN employee_projects ep
    ON p.id = ep.project_id
GROUP BY p.id, p.name;

-- ============================================================
-- Exercise 7
-- Find all employees who are assigned to more than one project.
-- Show their name and the number of projects.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    COUNT(ep.project_id) AS project_count
FROM employees e
JOIN employee_projects ep
    ON e.id = ep.employee_id
GROUP BY e.id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1;

-- ============================================================
-- Exercise 8
-- Find the total sales amount per sales employee.
-- Show their full name and total sales, sorted by total sales descending.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    SUM(s.amount) AS total_sales
FROM employees e
JOIN sales s
    ON e.id = s.employee_id
GROUP BY e.id, e.first_name, e.last_name
ORDER BY total_sales DESC;

-- ============================================================
-- Exercise 9
-- Find all employees who earn more than the average salary
-- of their department.
-- Show their name, salary, and department name.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    e.salary,
    d.name AS department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.id
WHERE e.salary >
(
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- ============================================================
-- Exercise 10
-- List all employees who have NOT been assigned to any project.
-- ============================================================

SELECT
    e.first_name,
    e.last_name
FROM employees e
LEFT JOIN employee_projects ep
    ON e.id = ep.employee_id
WHERE ep.employee_id IS NULL;

-- ============================================================
-- Exercise 11
-- For each department, show the name of the highest-paid employee.
-- ============================================================

SELECT
    d.name AS department_name,
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.id
WHERE e.salary =
(
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- ============================================================
-- Exercise 12
-- Find all projects where the total hours logged by all employees exceeds 400.
-- Show project name and total hours.
-- ============================================================

SELECT
    p.name AS project_name,
    SUM(ep.hours_logged) AS total_hours
FROM projects p
JOIN employee_projects ep
    ON p.id = ep.project_id
GROUP BY p.id, p.name
HAVING SUM(ep.hours_logged) > 400;

-- ============================================================
-- Exercise 13
-- Show each employee's full name, their department name,
-- and their manager's full name.
-- If no manager, show 'No Manager'.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    COALESCE(
        m.first_name || ' ' || m.last_name,
        'No Manager'
    ) AS manager_name
FROM employees e
JOIN departments d
    ON e.department_id = d.id
LEFT JOIN employees m
    ON e.manager_id = m.id;

-- ============================================================
-- Exercise 14
-- Find the total sales per product.
-- Show product name and total amount,
-- sorted by total amount descending.
-- ============================================================

SELECT
    product,
    SUM(amount) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC;

-- ============================================================
-- Exercise 15
-- Find all employees who share the same job title.
-- Show the job title and the names of employees who have it.
-- Exclude job titles held by only one person.
-- ============================================================

SELECT
    job_title,
    first_name,
    last_name
FROM employees
WHERE job_title IN
(
    SELECT job_title
    FROM employees
    GROUP BY job_title
    HAVING COUNT(*) > 1
)
ORDER BY job_title;

-- ============================================================
-- Exercise 16
-- For each department, show the number of employees hired after 2020.
-- ============================================================

SELECT
    d.name AS department_name,
    COUNT(e.id) AS employee_count
FROM departments d
JOIN employees e
    ON d.id = e.department_id
WHERE e.hire_date > '2020-12-31'
GROUP BY d.name;

-- ============================================================
-- Exercise 17
-- Find the employee who has logged the most total hours
-- across all projects.
-- Show their name and total hours.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    SUM(ep.hours_logged) AS total_hours
FROM employees e
JOIN employee_projects ep
    ON e.id = ep.employee_id
GROUP BY e.id, e.first_name, e.last_name
ORDER BY total_hours DESC
LIMIT 1;

-- ============================================================
-- Exercise 18
-- Show each region's total sales and the number of sales transactions.
-- ============================================================

SELECT
    region,
    SUM(amount) AS total_sales,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY region;

-- ============================================================
-- Exercise 19
-- Find all employees who are both a manager
-- and are assigned to at least one project.
-- Show their name, department, and number of direct reports.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    COUNT(r.id) AS direct_reports
FROM employees e
JOIN departments d
    ON e.department_id = d.id
JOIN employees r
    ON e.id = r.manager_id
JOIN employee_projects ep
    ON e.id = ep.employee_id
GROUP BY e.id, e.first_name, e.last_name, d.name;

-- ============================================================
-- Exercise 20
-- List each project with its total budget vs total hours logged.
-- Show: project name, budget, total_hours, and cost_per_hour.
-- ============================================================

SELECT
    p.name AS project_name,
    p.budget,
    SUM(ep.hours_logged) AS total_hours,
    ROUND(
        p.budget / SUM(ep.hours_logged),
        2
    ) AS cost_per_hour
FROM projects p
JOIN employee_projects ep
    ON p.id = ep.project_id
GROUP BY p.id, p.name, p.budget;

-- ============================================================
-- Exercise 21
-- Find the top-selling product in each region.
-- Show: region, product, and total sales amount.
-- ============================================================

WITH product_sales AS (
    SELECT
        region,
        product,
        SUM(amount) AS total_sales
    FROM sales
    GROUP BY region, product
)
SELECT *
FROM product_sales ps
WHERE total_sales =
(
    SELECT MAX(ps2.total_sales)
    FROM product_sales ps2
    WHERE ps2.region = ps.region
);

-- ============================================================
-- Exercise 22
-- Show all employees who joined in the same year
-- as at least one other employee from a different department.
-- Show their name, department name, and hire year.
-- ============================================================

SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    EXTRACT(YEAR FROM e.hire_date) AS hire_year
FROM employees e
JOIN departments d
    ON e.department_id = d.id
WHERE EXISTS
(
    SELECT 1
    FROM employees e2
    WHERE EXTRACT(YEAR FROM e2.hire_date) =
          EXTRACT(YEAR FROM e.hire_date)
      AND e2.department_id <> e.department_id
      AND e2.id <> e.id
);