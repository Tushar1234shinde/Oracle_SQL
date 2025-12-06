

-- substitute variable

Select employee_id, last_name , salary, department_id
from employees
where last_name=&name;


select employee_id, last_name, job_id, &col_name
from employees
where &condition
order by &col;