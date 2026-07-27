-- ============================================================
-- SQL TRAINING - DATABASE SETUP
-- Run this file first to create all tables and sample data
-- ============================================================

-- DEPARTMENTS
CREATE TABLE departments (
    id          INT PRIMARY KEY,
    name        VARCHAR(100),
    location    VARCHAR(100)
);

INSERT INTO departments VALUES
(1, 'Engineering',  'New York'),
(2, 'Sales',        'Chicago'),
(3, 'HR',           'New York'),
(4, 'Marketing',    'Los Angeles'),
(5, 'Finance',      'Chicago');

-- EMPLOYEES
CREATE TABLE employees (
    id              INT PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    email           VARCHAR(100),
    department_id   INT REFERENCES departments(id),
    manager_id      INT REFERENCES employees(id),
    salary          DECIMAL(10,2),
    hire_date       DATE,
    job_title       VARCHAR(100)
);

INSERT INTO employees VALUES
(1,  'Alice',   'Smith',    'alice@company.com',   1, NULL, 120000, '2018-03-15', 'VP Engineering'),
(2,  'Bob',     'Jones',    'bob@company.com',     1, 1,    90000,  '2019-06-01', 'Senior Engineer'),
(3,  'Carol',   'White',    'carol@company.com',   1, 1,    85000,  '2020-01-10', 'Engineer'),
(4,  'David',   'Brown',    'david@company.com',   2, NULL, 110000, '2017-11-20', 'VP Sales'),
(5,  'Eva',     'Davis',    'eva@company.com',     2, 4,    75000,  '2021-04-05', 'Sales Rep'),
(6,  'Frank',   'Miller',   'frank@company.com',   2, 4,    72000,  '2021-07-15', 'Sales Rep'),
(7,  'Grace',   'Wilson',   'grace@company.com',   3, NULL, 95000,  '2016-09-30', 'HR Director'),
(8,  'Henry',   'Moore',    'henry@company.com',   3, 7,    65000,  '2022-02-14', 'HR Specialist'),
(9,  'Iris',    'Taylor',   'iris@company.com',    4, NULL, 105000, '2019-08-22', 'Marketing Director'),
(10, 'Jack',    'Anderson', 'jack@company.com',    4, 9,    70000,  '2023-01-03', 'Marketing Analyst'),
(11, 'Karen',   'Thomas',   'karen@company.com',   5, NULL, 115000, '2015-05-18', 'CFO'),
(12, 'Leo',     'Jackson',  'leo@company.com',     5, 11,   80000,  '2020-10-07', 'Financial Analyst'),
(13, 'Mia',     'Harris',   'mia@company.com',     1, 1,    88000,  '2020-03-25', 'Engineer'),
(14, 'Nathan',  'Martin',   'nathan@company.com',  2, 4,    68000,  '2022-09-12', 'Sales Rep'),
(15, 'Olivia',  'Garcia',   'olivia@company.com',  1, 1,    92000,  '2018-12-01', 'Senior Engineer');

-- PROJECTS
CREATE TABLE projects (
    id          INT PRIMARY KEY,
    name        VARCHAR(100),
    budget      DECIMAL(12,2),
    start_date  DATE,
    end_date    DATE,
    status      VARCHAR(20)   -- 'active', 'completed', 'on_hold'
);

INSERT INTO projects VALUES
(1, 'Website Redesign',   50000,  '2023-01-01', '2023-06-30', 'completed'),
(2, 'Mobile App v2',      120000, '2023-03-01', '2024-02-28', 'active'),
(3, 'Data Migration',     80000,  '2023-05-15', '2023-12-31', 'completed'),
(4, 'CRM Integration',    95000,  '2023-07-01', NULL,         'active'),
(5, 'Security Audit',     30000,  '2024-01-01', NULL,         'on_hold'),
(6, 'Analytics Dashboard',70000,  '2023-09-01', '2024-03-31', 'active');

-- EMPLOYEE_PROJECTS (many-to-many)
CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(id),
    project_id  INT REFERENCES projects(id),
    role        VARCHAR(50),
    hours_logged INT,
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO employee_projects VALUES
(1,  2, 'Sponsor',    10),
(2,  1, 'Lead',       200),
(2,  2, 'Lead',       350),
(3,  1, 'Developer',  180),
(3,  3, 'Developer',  220),
(13, 2, 'Developer',  300),
(15, 2, 'Developer',  275),
(15, 4, 'Lead',       150),
(4,  4, 'Sponsor',    20),
(5,  4, 'Analyst',    90),
(9,  6, 'Lead',       180),
(10, 6, 'Analyst',    210),
(12, 6, 'Analyst',    190),
(7,  5, 'Lead',       40),
(8,  5, 'Analyst',    35),
(11, 3, 'Sponsor',    15);

-- SALES
CREATE TABLE sales (
    id              INT PRIMARY KEY,
    employee_id     INT REFERENCES employees(id),
    amount          DECIMAL(10,2),
    sale_date       DATE,
    product         VARCHAR(100),
    region          VARCHAR(50)
);

INSERT INTO sales VALUES
(1,  5,  15000, '2023-01-15', 'Pro Plan',      'East'),
(2,  5,  22000, '2023-03-20', 'Enterprise',    'East'),
(3,  6,  18000, '2023-02-10', 'Pro Plan',      'West'),
(4,  6,  9500,  '2023-04-05', 'Starter Plan',  'West'),
(5,  14, 12000, '2023-05-18', 'Pro Plan',      'East'),
(6,  14, 27000, '2023-06-22', 'Enterprise',    'East'),
(7,  5,  8000,  '2023-07-09', 'Starter Plan',  'East'),
(8,  6,  31000, '2023-08-14', 'Enterprise',    'West'),
(9,  14, 19500, '2023-09-30', 'Pro Plan',      'East'),
(10, 5,  24000, '2023-10-11', 'Enterprise',    'East'),
(11, 6,  11000, '2023-11-05', 'Pro Plan',      'West'),
(12, 14, 7500,  '2023-12-20', 'Starter Plan',  'East');
