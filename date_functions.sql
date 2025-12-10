--Date function

select hire_date from employees;

select sysdate from dual;

select current_date from dual;

select sessiontimezone, current_timestamp from dual;

select last_name, (sysdate-hire_date)/7 as "Week" from employees;


