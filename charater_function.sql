-- Single row function
--1] Character Function
--2] Number Function
--3] Date Function
--4] Conversion Function
--5] General Function


--1] Character Function
-- Character case-conversion function
select lower(first_name), upper(last_name), initcap(job_id) from employees;


--Character Manipulation Function
select concat(first_name,last_name) from employees;

select substr('Hello world',-2,1) from dual;

select length('helloworld') from dual;

select instr('Hello world','l') from dual;

select lpad(first_name,10,'*') from employees;

select rpad(first_name,10,'*') from employees;

select first_name, salary , rpad(salary, 10,'*') from employees;

select replace('Heloo worllld','worllld','sujal') from dual;

select trim('    Nikita  ') from dual;

select trim(trailing 'a' from 'Nikitaaaaa') from dual;

select trim(leading 'N' from 'Nikita') from dual;

select trim(both 'n' from 'nikitan') from dual;



