--Que1
--Query to select first name, last name and job title of all employees
SELECT first_name, last_name, job_title
FROM employees;

--Que2
--Query to select all employees who work in department 1
SELECT *
FROM employees
WHERE department_id = 1;

--Que3
--Query to select all employees with salary greater than 90,000 and show their full name and salary sorted by salary highest to lowest
select first_name, last_name, salary
from employees
where salary > 90000 order by salary desc;

--Que4
--Query to select the 5 most recently hired employees and show their name and hire_date
select first_name, last_name, hire_date
from employees
order by hire_date desc
limit 5;

--Que5
--Query to select all unique job titles in the company
select distinct job_title
from employees;

--Que6
--Query to find all employees whose last name starts with the letter 'M'
select *
from employees
where last_name like 'M%';

--Que7
--Query to find all employees who do NOT have a manager (manager_id is NULL)
select *
from employees
where manager_id is null;

--Que8
--Query to select all projects that are currently 'active' and show the project name, budget
select name, budget, start_date
from projects
where status = 'active';


--Que9
--Query to select all sales where the amount is between 10,000 and 25,000 and sort by amount ascending
select *
from sales
where amount between 10000 and 25000
order by amount asc  ;


--Que10
--Query to count the total number of employees in the company
select count(*)
from employees;


--Que11
--Query to select all employees hired in the year 2020 and show their full name and hire_date
select first_name, last_name, hire_date
from employees
where hire_date between '2020-01-01' and '2020-12-31';

--Que12
--Query to select all sales made in the east region and show the sale_id, amount, and sale_date
select id as sale_id, amount, sale_date
from sales
where region = 'East';

--Que13
--Query to select all employees whose salary is not between 70,000 and 90,000 
select *
from employees
where salary not between 70000 and 90000;

--Que14
--Query to select all projects that have an end_date (i.e. end_date is not NULL) and show project name and end_date, sorted by end_date ascending
select name, end_date
from projects
where end_date is not null
order by end_date asc;


--Que15
--Query to select all employees whose first name contains the letter 'a' (case-insensitive)
select *
from employees
where lower(first_name) like '%a%';

--que16
--Query to show the total salary of all employees in the company
select sum(salary) as total_salary
from employees;

--Que17
--Query to select all employees by department id in ascending order and salary in descending order
select *
from employees
order by department_id asc, salary desc;

--Que18
--Query to select all sales for the product 'Enterprise' and show employee_id, amount, and sale_date
select employee_id, amount, sale_date
from sales
where product = 'Enterprise';

--Que19
--Query to show maximum, minimum and average salary of all employees in the company
select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary
from employees;

--Que20
--Query to select all employees deparment located in 'New York'
select *
from departments
where location = 'New York';

