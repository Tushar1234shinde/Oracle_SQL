select * from employees;

select * from job_history;


--set operator

--union
select department_id from employees
union
select department_id from job_history
order by department_id;

select department_id,employee_id from employees
union
select department_id,employee_id from job_history
order by department_id;

--union all
select department_id from employees
union all
select department_id from job_history
order by department_id;

select department_id,employee_id from employees
union all
select department_id,employee_id from job_history
order by department_id;


--intersect

select job_id from employees
intersect
select job_id from job_history;

select job_id,department_id from employees
intersect
select job_id,department_id from job_history;

--minus

select job_id from job_history
minus
select job_id from employees;

select department_id from job_history
minus
select department_id from employees;

select job_id from employees
minus
select job_id from job_history;

select department_id from employees
minus
select department_id from job_history;

select employee_id, job_id, department_id, to_date(hire_date) as "alias 1"
from employees 
union
select employee_id, job_id, department_id, to_date(null) as "alias 2"
from job_history
order by "alias 1";


