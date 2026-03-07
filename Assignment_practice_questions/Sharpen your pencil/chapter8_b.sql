-- SHARPEN YOUR PENCIL 8.1


-- Q1. Display the current and previous job details of all employees. Display each employee only once. (Using SET operator)
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

-- Q2. Display employee_ids and job_ids of employees who currently have a job title that they held before beginning their tenure with the company.
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- Q3. Display the employee_ids of those employees who have not changed their jobs even once.
SELECT employee_id
FROM employees
MINUS
SELECT employee_id
FROM job_history;