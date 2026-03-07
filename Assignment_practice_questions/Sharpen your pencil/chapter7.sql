-- SHAPEN YOUR PENCIL 7.1


-- Q1. Display all employees in “Sales” and “Accounting” department. (Use natural join)
SELECT *
FROM employees
NATURAL JOIN departments
WHERE department_name IN ('Sales','Accounting');

-- Q2. Re-write the above query using JOIN .. ON clause.
SELECT *
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IN ('Sales','Accounting');

-- Q3. Find out the difference between the average salary earned by a person in department number 10 and the average salary earned by a person in department number 30.
SELECT 
(SELECT AVG(salary) FROM employees WHERE department_id = 10) -
(SELECT AVG(salary) FROM employees WHERE department_id = 30) AS salary_difference
FROM dual;

-- Q4. List employee and his manager’s details where the employee’s salary is greater than his manager’s salary.
SELECT e.last_name AS employee, m.last_name AS manager,
       e.salary AS emp_salary, m.salary AS mgr_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;



-- SHAPEN YOUR PENCIL 7.2


-- Q1. Display the name of all books and the date of issue. Also display the books that are not issued.
SELECT b.book_name, i.date_of_issue
FROM book b
LEFT JOIN issue i
ON b.book_id = i.book_id;