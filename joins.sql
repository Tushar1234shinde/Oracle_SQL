--JOINS
--1. natural join
--2. using clause
--3. on clause
--4. self join
--5. non-equi join
--6. outer joins
--    i. left outer join
--    ii. right outer join
--    iii. full outer join
--7. cross join



--natural join
SELECT
    *
FROM
         employees
    NATURAL JOIN jobs;

SELECT
    *
FROM
         employees
    NATURAL JOIN job_history;

SELECT
    *
FROM
    job_history;

SELECT
    employee_id,
    first_name,
    job_id,
    job_title,
    department_id
FROM
         employees
    NATURAL JOIN jobs;

SELECT
    employee_id,
    first_name,
    job_id,
    job_title,
    department_id
FROM
         employees
    NATURAL JOIN jobs
WHERE
    department_id IN ( 20, 50 );

SELECT
    employee_id,
    first_name,
    job_id,
    job_title,
    department_id
FROM
         employees
    NATURAL JOIN jobs
WHERE
    department_id NOT IN ( 20, 50 );

--using clause
SELECT
    last_name,
    salary,
    department_name,
    location_id
FROM
         employees
    JOIN departments USING ( department_id );

--subquery
SELECT
    *
FROM
    employees
WHERE
    employee_id = (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            department_id = 20
        FETCH FIRST 1 ROW ONLY
    )
    OR employee_id = (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            department_id = 50
        FETCH FIRST 1 ROW ONLY
    )
ORDER BY
    department_id;

--on clause
SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id );
 
--four way join with on clause
SELECT
    employee_id,
    department_name,
    city,
    country_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id )
    JOIN locations   l ON ( l.location_id = d.location_id )
    JOIN countries   c ON ( l.country_id = c.country_id );
select * from countries;
--three way join with using clause
SELECT
    employee_id,
    department_name,
    city
FROM
         employees e
    JOIN departments d USING ( department_id )
    JOIN locations   l USING ( location_id );

SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id )
WHERE
    e.manager_id = 149;

SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id )
                          AND e.manager_id = 149;
 
-- self join
SELECT
    e.last_name emp,
    m.last_name mgr
FROM
         employees e
    JOIN employees m ON ( e.manager_id = m.employee_id )
WHERE
    e.last_name = 'Abel';
    
--non-equi join
-- Create the JOB_GRADES table
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(2),
    LOWEST_SAL NUMBER(8,2),
    HIGHEST_SAL NUMBER(8,2)
);

-- Insert values into JOB_GRADES
INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('A', 1000, 2999);

INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('B', 3000, 5999);

INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('C', 6000, 9999);

INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('D', 10000, 14999);

INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('E', 15000, 24999);

INSERT INTO JOB_GRADES (GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL)
VALUES ('F', 25000, 40000);

-- Save changes
COMMIT;
