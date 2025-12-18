-- conditional expression
--1} Case expression
--2} Searched case expression
--3} Decode function

select last_name, job_id, salary
,case job_id when 'IT_PROG' then salary*1.10
when 'ST_CLERK' then 1.15*salary
when 'SA_REP' then 1.20*salary
else salary END as "REVISED SALARY"     
FROM  employees;


select last_name, salary ,
(case when salary<5000 then 'Low'
when salary<10000 then 'Medium'
when salary<20000 then 'Good' 
else 'Excellent' End )"Qualified Salary"
from employees;


select last_name, job_id, salary,
decode(job_id,'IT_PROG',1.10*salary,
'ST_CLERK',1.15*salary,
'SA_REP',1.20*salary,
salary) "Revised Salary"
from employees;

select trunc(salary/2000,0) from employees;

select last_name, salary, salary/2000,
decode( trunc(salary/2000,0),
0,0.00,
1,0.09,
2,0.20,
3,0.30,
4,0.40
,5,0.42,
6,0.44,
0.45) "Tax Rate"
from employees
where department_id=80;


