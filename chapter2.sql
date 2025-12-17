--Chapter 1 Retrival of data



select * from departments;

select * from employees;

select department_id, department_name from departments;

select job_id,email,salary from employees;
SeleCT * FrOm DePartmentS;

select employee_id
from employees;


select employee_id, salary,salary +300, salary * 12, salary-200, salary/10 from employees;

select * from dual;

select 3*2/4-3+12*(-3+3)/2 from dual;

select commission_pct+10 from employees;

--column alias

select * from employees;

select employee_id  emp from employees;

select last_name,last_name name,commission_pct, commission_pct comm from employees;

select employee_id, salary,salary +300 "Addition Expression", 
salary * 12 "Multiplication Expression", salary-200 "Substraction Expression", 
salary/10  "Division Expression"
from employees;

select first_name ||' '|| last_name as name from employees;

select last_name||q'[ isn't a ]'|| job_id as "Employees Details"from employees;

select distinct department_id from employees;

describe jobs;

desc employees;


