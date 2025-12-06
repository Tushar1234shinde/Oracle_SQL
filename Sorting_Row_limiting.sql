---Sorting 

select last_name, job_id, department_id, hire_date 
from employees
order by department_id;

select employee_id, last_name, salary, 12*salary "Annasal"
from employees
order by "Annasal";

select last_name, job_id, department_id, hire_date 
from employees
order by 2;

select last_name, department_id, salary
from employees 
order by department_id, salary desc;

--row limiting clause

select employee_id, last_name from employees 
order by employee_id
fetch next 70 rows only;

select employee_id, last_name from employees 
order by employee_id
fetch first 10 percent rows only;

select employee_id , first_name from employees
order by employee_id
offset 7 rows;

select employee_id , first_name from employees
order by employee_id
offset 5 rows 
fetch next 5 row only;

select employee_id, last_name, department_id from employees 
order by department_id
fetch next 45 rows with ties;















