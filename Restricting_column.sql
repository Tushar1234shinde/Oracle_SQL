`--Chapter 3 Rstriction and Sorting
select * from employees;
--RESTRINCTING WITH COMPARITION OPERATOR(Where)
select employee_id, last_name , job_id,  department_id 
from employees ;


select employee_id, last_name , job_id,  department_id 
from employees 
where department_id=90;

select *
from employees
where first_name='Michael';

--RESTRICTION (BETWEEN, LIKE, NULL,IN)
select salary from employees where salary between 10000 and 20000;

select last_name from employees where employee_id between 150 and 175;

select employee_id, last_name, salary, phone_number, first_name 
from employees 
where employee_id in (123,146,135,170,203,111);

select first_name from employees
where first_name like '_oh%';

select last_name, manager_id, salary from employees where manager_id is null;

--RESTRINCTION WITH LOGICAL OPERATOR
select employee_id, salary, job_id, last_name 
from employees
where salary>=10000 and job_id like '%MAN%';

select employee_id, salary, job_id, last_name 
from employees
where salary>=10000 or job_id like '%MAN%';

select last_name, job_id from employees where job_id NOT in('IT_PROG','SA_REP','ST_CLERK');

--OPERATOR PRECEDENCE
SELECT LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID=60
OR DEPARTMENT_ID =80
AND SALARY>5000;

SELECT LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE (DEPARTMENT_ID=60
OR DEPARTMENT_ID =80)
AND SALARY>5000;


