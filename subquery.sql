--Subquery


--single row subquery
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


--multi row subquery
select salary from employees where job_id = 'IT_PROG';

select employee_id, job_id, salary, last_name
from employees
where salary<any 
(select salary from employees where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, job_id, salary, last_name
from employees
where salary<all 
(select salary from employees where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, job_id, salary, last_name
from employees
where salary in 
(select salary from employees where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';



--multi column subquery
select first_name, department_id, salary
from employees
where (salary, department_id) in
(select min(salary), department_id
from employees 
group by department_id)
order by department_id;

--correlated subquery
select last_name, salary, department_id
from employees outer_table
where salary>(select avg(salary) from employees inner_table
where inner_table.department_id=outer_table.department_id)
order by department_id;



--exist operator

select employee_id, last_name, department_id, job_id
from employees outer
where exists (select null
from employees
where manager_id=outer.employee_id);