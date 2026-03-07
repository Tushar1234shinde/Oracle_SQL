-- SHARPEN YOUR PENCIL 5.1  


-- Q1. List the commission received by all the employees.
SELECT last_name, salary * commission_pct AS commission
FROM employees;

-- Q2. Display name, total salary and annual salary. Total salary to be displayed including commission as well as annual salary should be calculated including commission.
SELECT last_name,
       salary + (salary * commission_pct) AS total_salary,
       (salary + (salary * commission_pct)) * 12 AS annual_salary
FROM employees;


-- SHARPEN YOUR PENCIL 5.2


-- Q1. List employee details as last name, job description using given criteria.
SELECT last_name,
       CASE job_id
            WHEN 'MK_MAN' THEN 'Marketing Manager'
            WHEN 'PU_MAN' THEN 'Purchasing Manager'
            WHEN 'HR_REP' THEN 'HR Representative'
            ELSE job_id
       END AS description
FROM employees;