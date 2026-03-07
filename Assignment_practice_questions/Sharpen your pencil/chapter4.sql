-- SHARPEN YOUR PENCIL 4.1


-- Q1. Display the first and last name of the employees with initial letter capital. Also display the job in lower case.
SELECT INITCAP(first_name), INITCAP(last_name), LOWER(job_id)
FROM employees;

-- Q2. Display the last name of employees concatenated with designation of the employees. The output should be something like King – AD_PRES.
SELECT last_name || ' - ' || job_id
FROM employees;

-- Q3. Display those employee whose salary greater than 4 digits.
SELECT *
FROM employees
WHERE salary > 9999;

-- Q4. Display the name and salary of employees with salary left justified and padded with '*'.
SELECT last_name, LPAD(salary,10,'*')
FROM employees;

-- Q5. Display the last name of the employee and the length of the last name.
SELECT last_name, LENGTH(last_name)
FROM employees;


-- SHARPEN YOUR PENCIL 4.2


-- Q1. Calculate the remainder of a salary after it is divided by 5000 for all employees whose job title is sales representative.
SELECT last_name, MOD(salary, 5000)
FROM employees
WHERE job_id = 'SA_REP';

-- Q2. Find 7⁴ (7 raised to power 4).
SELECT POWER(7,4)
FROM dual;

-- Q3. Display the annual salary of employees including commission for all employees who are earning commission.
SELECT last_name, (salary*12) + (salary*12*commission_pct) AS annual_salary
FROM employees
WHERE commission_pct IS NOT NULL;


-- EXTRA 

-- Q1. Add to or subtract a number from a date for a resultant date value.
SELECT hire_date, hire_date + 10 AS new_date
FROM employees;
-- Q2. Subtract two dates to find the number of days between those dates.
SELECT SYSDATE - hire_date AS days_worked
FROM employees;
-- Q3. Add hours to a date by dividing the number of hours by 24.
SELECT SYSDATE + (5/24) AS new_time
FROM dual;


-- SHARPEN YOUR PENCIL 4.2


-- Q1. How many years ‘Bell’ is working with the organization?
SELECT last_name, ROUND((SYSDATE - hire_date)/365) AS years_worked
FROM employees
WHERE last_name = 'Bell';

-- Q2. List the employees with the date of joining and number of years he/she is working in the organization.
SELECT last_name, hire_date, ROUND((SYSDATE - hire_date)/365) AS years_worked
FROM employees;

-- Q3. Display how many months ‘Whalen’ is employed.
SELECT last_name, MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employees
WHERE last_name = 'Whalen';