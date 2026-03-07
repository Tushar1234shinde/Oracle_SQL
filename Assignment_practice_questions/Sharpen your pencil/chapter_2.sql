-- SHARPEN YOUR PENCIL 2.1



--1] Display all information about the employees.

-- SELECT * is used to retrieve all columns from a table.

-- Query:

SELECT * 
FROM employees;

--2] Display the last names of employees along with their salaries.

-- Specific columns can be retrieved by listing their names after SELECT.

-- Query:

SELECT last_name, salary 
FROM employees;

--3] List the names of all departments in the organization.

-- To fetch data from another table, use SELECT with the required column name.

-- Query:

SELECT department_name 
FROM departments;

--4] Display employee id, first name, salary and department id of all employees.

-- Multiple columns can be selected by separating them with commas.

-- Query:

SELECT employee_id, first_name, salary, department_id 
FROM employees;

--5] List the different jobs offered in the company.

-- DISTINCT is used to remove duplicate values from the result.

-- Query:

SELECT DISTINCT job_id 
FROM employees;



-- SHARPEN YOUR PENCIL 2.2


-- Q1. Display the job ids of employees (Do not include duplicate ones).

-- Rename the column as “Designation”.

SELECT DISTINCT job_id AS "Designation"
FROM employees;

-- Q2. Display the last name and salary of employees as

-- “The salary of Whalen is 4400.”
-- Rename the column as “Name – Salary”.

SELECT 'The salary of ' || last_name || ' is ' || salary 
       AS "Name – Salary"
FROM employees;

-- Q3. List name, salary and PF of all employees.

-- PF is calculated as 10% of salary. Rename the column as “PF”.

SELECT last_name, salary, salary * 0.10 AS "PF"
FROM employees;

-- Q4(a). Check the structure of Departments table.
DESC departments;

-- Q4(b). Check the structure of Jobs table.
DESC jobs;

-- Q4(c). Check the structure of Employees table.
DESC employees;