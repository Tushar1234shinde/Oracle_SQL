--Retrievel Of Data

--In this sql file we will be studing Data Retrieving Language(DRL)
--Also know as Data Query Language(DQL)

--Basic SELECT statements
--SELECT *|{[DISTINCT] column[alias],........}
--FROM table_name;

--1.SELECT identifies the column to be displayed
--2.FROM idetifies table containing those column


--{* | the meaning of * is -->all} 
select * from employees;
--This query is use to display all records from employees table

--You can also write query for specific column to display the records from particular column
select employee_id, salary from employees;
--This query will display all employee_id and salary present in employees table



--NOTE : THE SQL(STRUCTURED QUERY LANGUAGE) IS NOT CASE SENSITIVE LANGUAGE.



--Arithmatic Expression(+,-,/,*,%)
--We can use this expression on two data types
--1.A column with date data type.
--2.A column with number data type.

select last_name, salary, salary+200, salary-200, salary/20, salary*30 from employees;


--What is DUAL
--In Oracle, DUAL is a special one-row, one-column dummy table used when you need to run a query that does not require data from an actual table.
select * from dual;

--⭐ 1. Multiplication happens before Addition
SELECT 10 + 20 * 3 AS result FROM dual;
--Explanation:
--20 * 3 happens first → 60
--Then 10 + 60 → 70
--⭐ 2. Parentheses change precedence
SELECT (10 + 20) * 3 AS result FROM dual;
--Now 10 + 20 happens first → 30
--Then 30 * 3 → 90
--⭐ 3. Division before Subtraction
SELECT 50 - 10 / 2 AS result FROM dual;
--10 / 2 → 5
--Then 50 - 5 → 45
--⭐ 4. Mixed Operators
SELECT 5 + 10 * 2 - 8 / 4 AS result FROM dual;
--Order of execution:
--10 * 2 = 20
--8 / 4 = 2
--5 + 20 - 2 → 23
--⭐ 5. Using Parentheses to Control Order
SELECT (5 + 10) * (2 - 8) / 4 AS result FROM dual;
--5 + 10 = 15
--2 - 8 = -6
--15 * -6 / 4 → -22.5


--What is null value?
--A value that is unavailable, unassigned, unknown, or inapplicable
--It is Not same as ZERO or blank space

--We have commission_pct column from employees table, that contained most null values
select commission_pct from employees;

--Null value with arithmatic expression
--Arithmatic expressions containing a NULL value evaluate to NULL
select 12*commission_pct*salary from employees;

 
 -------------------------------------------------------------------------------------------------
-- Sharpen your pencil
 -------------------------------------------------------------------------------------------------
-- 1. DISPLAY ALL INFORMATION ABOUT THE employees
select * from employees;
--2. DISPLAY THE LAST_NAME OF EMPLOYEEES ALONG WITH THEIR SALARIES.
select last_name, salary from employees;
--3. LIST THE NAMES OF EMPLOYEES ALONG WITH THEIR SALARIES
select department_name from departments;
--4. DISPLAY EMPLOYEE_ID, FIRST_NAME, SALARY AND DEPARTMENT_ID OF ALL EMPLOYEES
select employee_id, first_name, salary, department_id from employees;
--5. LIST THE DIFFERENT JOBS OFFERED IN COMPANY
select job_title from jobs;



--Column Aliases

--AS keyword is optional
select salary*12 as ANNASAL from employees;
--Annasal is the temporary name of salary*12

select salary*12 as "Anual Salary" from employees;
--when you need more than one word in aliase, then use  " ".


--Concatenation Operator
--This operator is use to concat columns or values

select first_name || last_name from employees;

select 'Chota ' || 'Bheem' Cartoon from dual;


--Literal character string(' ')
--Literal can be combination of any thing (A-Z),(a-z),(0-9) & any special charater
select last_name || ' is a ' || job_id as "Employee Details" from employees;


--Alternative quote(q) operator
--With this (q) we can use quotation mark in literal 
select department_name || q'[ Department's Mgr Id: ]' || manager_id as "department and manager" from departments;


--Duplicate rows elimination with DISTINCT keyword
--you can remove duplicate records from data

select distinct department_id from employees;


--Displaying table structure
describe employees;

--OR

desc employees;
--this two commands will structure of a table 

--------------------------------------------------------------------------------
--Sharpen your pencil
--------------------------------------------------------------------------------
--1) Display the job IDs of employees (no duplicates). Rename column as “Designation”.
SELECT DISTINCT job_id AS "Designation"
FROM employees;

--2) Display last name & salary of employees as: Name – Salary (concatenated).
SELECT last_name || ' - ' || salary AS "Name - Salary"
FROM employees;

--3) List name, salary, and PF of all employees.
SELECT first_name || ' ' || last_name AS name,
       salary,
       salary * 0.10 AS "PF"
FROM employees;

--4) Check the structure of tables: Departments, Jobs, Employees.
DESCRIBE departments;
DESCRIBE jobs;
DESCRIBE employees;



