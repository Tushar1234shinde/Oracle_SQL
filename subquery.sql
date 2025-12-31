--Subquery

select hire_date from employees where last_name='Davies';

select last_name, hire_date from employees where hire_date>'29-JAN-15';

select last_name, hire_date from employees where hire_date>
(select hire_date from employees where last_name='Davies'); 

select last_name, salary, job_id, department_id
from employees
where job_id=
(select job_id from employees where last_name='Abel')
and
salary>
(select salary from employees where last_name='Abel');

select last_name, salary, job_id from employees
where salary = 
(select min(salary) from employees);

select last_name, salary, job_id from employees
where salary = 
(select max(salary) from employees);

select department_id, min(salary)
 from employees 
 group by department_id;

select min(salary)
from employees 
where department_id=30;

select department_id, min(salary)
 from employees 
 group by department_id
 having min(salary)>
 (select min(salary)
from employees 
where department_id=30)
order by department_id;

select min(salary) from employees
group by department_id;

select employee_id, last_name from employees where salary=2500;

select last_name,job_id from employees
where job_id=
(select job_id from employees where last_name='Haas');