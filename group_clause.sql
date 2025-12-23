--group by clause

select department_id, max(salary) from employees
group by department_id;

select department_id, min(salary) from employees
group by department_id;

select avg(department_id) ,max(salary) from employees;

select department_id, job_id, sum(salary)
from employees
where salary>40
group by department_id, job_id
order by department_id,job_id desc;
--having
select department_id, avg(salary)
from employees
group by department_id
having avg(salary)>8000;

select department_id, max(salary)
from employees
group by department_id
having max(salary)>10000;

select job_id,sum(salary)payroll
from employees
where job_id not like '%rep%'
group by job_id
having sum(salary)<13000
order by sum(salary);


select count(avg(salary)) from employees
group by department_id;
