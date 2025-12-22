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





