-- SHARPEN YOUR PENCIL 6.1


-- Q1. Display the average salary and number of employees working in department number 20.
SELECT AVG(salary), COUNT(*)
FROM employees
WHERE department_id = 20;

-- Q2. Display the number of employees assigned department id.
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

-- Q3. Display the last employee hired in department id 30.
SELECT MAX(hire_date)
FROM employees
WHERE department_id = 30;

-- Q4. Display the number of employees getting commission.
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;


-- SHARPEN YOUR PENCIL 6.2


-- Q1. Display department wise, job wise maximum salary of employees.
SELECT department_id, job_id, MAX(salary)
FROM employees
GROUP BY department_id, job_id;

-- Q2. List the jobs and the number of employees in each job. The result should be in the descending order of the number of jobs.
SELECT job_id, COUNT(*) 
FROM employees
GROUP BY job_id
ORDER BY COUNT(*) DESC;

-- Q3. List the job wise total salary, average salary, and minimum salary of employees.
SELECT job_id, SUM(salary), AVG(salary), MIN(salary)
FROM employees
GROUP BY job_id;


-- SHARPEN YOUR PENCIL 6.3 


-- Q1. Display number of employees department wise with departments having count of employees greater than 10.
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;

-- Q2. Display maximum count of employees in any department.
SELECT MAX(COUNT(*))
FROM employees
GROUP BY department_id;