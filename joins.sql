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

select e.employee_id, e.last_name, e.department_id,
d.department_id, d.department_name
 from employees e join departments d
 on(e.department_id=d.department_id);
 
 select employee_id, department_name, city
 from employees e join departments d
 on(e.department_id=d.department_id)
 join locations l
 on(l.location_id=d.location_id);
 
  select employee_id, department_name, city
 from employees e join departments d
 using(department_id)
 join locations l
 using(location_id);
 
 select e.employee_id, e.last_name, e.department_id,
d.department_id, d.department_name
 from employees e join departments d
 on(e.department_id=d.department_id)
 where e.manager_id=149;
 
 select e.employee_id, e.last_name, e.department_id,
d.department_id, d.department_name
 from employees e join departments d
 on(e.department_id=d.department_id)
 and e.manager_id=149;
 
 
 select e.last_name emp, m.last_name mgr
 from employees e join employees m
 on(e.manager_id=m.employee_id)
 where e.last_name = 'Abel';
 
 