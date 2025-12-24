select * from employees natural join jobs;

select * from employees natural join job_history;

select * from job_history;

select employee_id, first_name, job_id, job_title, department_id
from employees natural join jobs;

select employee_id, first_name, job_id, job_title, department_id
from employees natural join jobs
where department_id not in (20,50);

select last_name,salary , department_name, location_id
from employees join departments
using(department_id);

select employee_id, first_name, job_id, job_title, department_id
from employees natural join jobs
where department_id  in (20,50);

select * from employees
where employee_id = (select employee_id from employees 
where department_id=20 
fetch first 1 row only)
or employee_id =
(select employee_id from employees 
where department_id=50 
fetch first 1 row only)
order by department_id;