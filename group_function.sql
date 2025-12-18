---Without Group Function

select salary from employees 
order by salary 
fetch first 1 rows only;

select salary from employees 
order by salary desc
fetch first 1 rows only;


-- With group function
select min(salary),max(salary) from employees;

--Group Function
--1 AVG
--2 Count
--3 Max
--4 Min
--5 Sum

select sum(salary)/107 from employees;

select avg(salary) from employees;

select count(salary) from employees;

select count(commission_pct) from employees;

select count(*) from employees;

select min(employee_id),max(employee_id),min(first_name),max(first_name),
min(hire_date), max(hire_date) from employees;

select avg(manager_id),sum(manager_id) from employees;

select avg(last_name), sum(last_name) from employees;

select * from employees;
select count(*) from employees where department_id=50;

select count(commission_pct) from employees where department_id=80;


select * from employees where commission_pct is not null;