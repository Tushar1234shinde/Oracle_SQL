-- SHARPEN YOUR PENCIL 3.1


-- Q1. List the employees belonging to the department number 20.
SELECT *
FROM employees
WHERE department_id = 20;

-- Q2. List the last name and salary of the employees whose salaries are more than 3000.
SELECT last_name, salary
FROM employees
WHERE salary > 3000;

-- Q3. List the employee id and last name of the employees whose job is Sales Representative (job_id is SA_REP).
SELECT employee_id, last_name
FROM employees
WHERE job_id = 'SA_REP';

-- Q4. List all employee names and hiredate who have been hired before year 1990.
SELECT last_name, hire_date
FROM employees
WHERE hire_date < TO_DATE('01-JAN-1990','DD-MON-YYYY');


-- SHARPEN YOUR PENCIL 3.2


-- Q1. List the last name and salary of all employees whose salary is in the range of 2000 to 4000.
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 4000;

-- Q2. List last name of employees who have joined before 30th June 2001 and after December 2001.
SELECT last_name
FROM employees
WHERE hire_date < TO_DATE('30-JUN-2001','DD-MON-YYYY')
   OR hire_date > TO_DATE('31-DEC-2001','DD-MON-YYYY');

-- Q3. List the first name of the employees whose employee numbers are 109, 101, 119, 114, 118.
SELECT first_name
FROM employees
WHERE employee_id IN (109, 101, 119, 114, 118);

-- Q4. List the employees not belonging to department numbers 30 and 50.
SELECT *
FROM employees
WHERE department_id NOT IN (30, 50);


-- SHARPEN YOUR PENCIL 3.3


-- Q1. List the employees whose first name starts with an ‘S’.
SELECT *
FROM employees
WHERE first_name LIKE 'S%';

-- Q2. List the employees having third character in last name as ‘R’.
SELECT *
FROM employees
WHERE last_name LIKE '__R%';

-- Q3. List the first name and last name of employees whose first names have exactly five characters.
SELECT first_name, last_name
FROM employees
WHERE LENGTH(first_name) = 5;

-- Q4. List the employee names who do not get any commission.
SELECT first_name, last_name
FROM employees
WHERE commission_pct IS NULL;

-- Q5. List the first name and job of the employees who do not report to anybody.
SELECT first_name, job_id
FROM employees
WHERE manager_id IS NULL;


-- SHARPEN YOUR PENCIL 3.4


-- Q1. List the employees with designation as ‘SA_REP’ (sales representative) and salary greater than 8000.
SELECT *
FROM employees
WHERE job_id = 'SA_REP'
AND salary > 8000;

-- Q2. List the employees whose salary is in the range of 3000 and 5000.
SELECT *
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

-- Q3. List the employees with designation ‘SA_REP’ as well as ‘SA_MAN’ (Sales Manager).
SELECT *
FROM employees
WHERE job_id IN ('SA_REP', 'SA_MAN');


-- SHARPEN YOUR PENCIL 3.5


-- Q1. List the employee details in the ascending order of their annual salary.
SELECT *
FROM employees
ORDER BY salary * 12 ASC;

-- Q2. List the details of employees in the department wise ascending order and in the descending order of salary.
SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;

-- Q3. Display the last names and salary of employees from department number 80 in descending order of salary.
SELECT last_name, salary
FROM employees
WHERE department_id = 80
ORDER BY salary DESC;

-- Q4. Write the same query using relative position of columns.
SELECT last_name, salary
FROM employees
WHERE department_id = 80
ORDER BY 2 DESC;