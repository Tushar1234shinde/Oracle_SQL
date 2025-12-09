select * from employees;

-- substitute variable

Select employee_id, last_name , salary, department_id
from employees
where last_name=&name;


select employee_id, last_name, job_id, &col_name
from employees
where &condition
order by &col;


select first_name, &&col_name,  &col1,&Com2 from employees
where &&condition;


define a=200;

select * from &&table_name
where employee_id=&a;

undefine a;

set verify on;

set verify off;

