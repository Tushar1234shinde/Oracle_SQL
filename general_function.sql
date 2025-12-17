select nvl(commission_pct , 0)
from employees;

select nvl(null,1) from dual;

select last_name, salary , commission_pct, salary*nvl(commission_pct,0)+salary from employees;

select nvl2('AB',1,2) from dual;

select commission_pct, nvl2(commission_pct,'salary_comm','sal') from employees;
 
select nullif('hello','world') from dual;

select first_name, length(first_name) "col1",
last_name, length(last_name) "col2"
,nullif(length(first_name),length(last_name)) as result
from employees;

select coalesce(null,1,null,2,null) from dual;

select last_name, salary, commission_pct,
coalesce((salary+(commission_pct*salary)),(salary+2000)) as output
from employees;


select first_name from employees
where instr(first_name,'a')>0;