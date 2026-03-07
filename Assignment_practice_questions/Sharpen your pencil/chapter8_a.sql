SHAPEN YOUR PENCIL 7.1


-- Q1. List the employees belonging to the department of ‘MILLER’.
SELECT *
FROM employees
WHERE department_id =
      (SELECT department_id
       FROM employees
       WHERE last_name = 'MILLER');
-- Q2. List the employees who have salary greater than that of an employee with last name ‘Taylor’.
SELECT *
FROM employees
WHERE salary >
      (SELECT salary
       FROM employees
       WHERE last_name = 'Taylor');
-- Q3. List the employees who work in “Finance” department.
SELECT *
FROM employees
WHERE department_id =
      (SELECT department_id
       FROM departments
       WHERE department_name = 'Finance');
-- Q4. Display the departments having salary which is equal to the average salary of department number 50.
SELECT department_id
FROM employees
WHERE salary =
      (SELECT AVG(salary)
       FROM employees
       WHERE department_id = 50);


-- SHAPEN YOUR PENCIL 7.2


-- Q1. Display names of employees who are working in “Sales” or “Accounting” department.
SELECT last_name
FROM employees
WHERE department_id IN
      (SELECT department_id
       FROM departments
       WHERE department_name IN ('Sales','Accounting'));
-- Q2. Display the last name and salary of employees who are not ‘SA_REP’ and whose salary is less than any ‘SA_REP’.
SELECT last_name, salary
FROM employees
WHERE job_id <> 'SA_REP'
AND salary < ANY
    (SELECT salary
     FROM employees
     WHERE job_id = 'SA_REP');
-- Q3. Display the name of the person getting maximum salary.
SELECT last_name
FROM employees
WHERE salary =
      (SELECT MAX(salary)
       FROM employees);