-- SHAPEN YOUR PENCIL 9

-- Q1. Insert a new row in the employees table by passing values to the INSERT statement.

INSERT INTO employees
VALUES (300,'John','Doe','JDOE','john@example.com',
        '01-JAN-24','IT_PROG',5000,NULL,100,60);

-- Q2. Insert a new row in the employees table. Provide value for only not null columns and first_name, salary remaining columns should have null value.
INSERT INTO employees (employee_id, first_name, salary)
VALUES (301,'Sam',4000);

-- Q3. Update the job id of employee with id 103.
UPDATE employees
SET job_id = 'IT_PROG'
WHERE employee_id = 103;

-- Q4. Update the salary of all employees by 15% belonging to department number 80.
UPDATE employees
SET salary = salary * 1.15
WHERE department_id = 80;

-- Q5. Update the salary of all stock clerks by 10%.
UPDATE employees
SET salary = salary * 1.10
WHERE job_id = 'ST_CLERK';

-- Q6. Delete the details of ‘Julia’ from the table. Employee id of Julia is 125.
DELETE FROM employees
WHERE employee_id = 125;

-- Q7. Delete all rows from the table temp_emp.
DELETE FROM temp_emp;