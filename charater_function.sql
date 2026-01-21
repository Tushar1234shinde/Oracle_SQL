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

select trim(both 'n' from 'nitin') from dual;

--QUESTION'S
--1.
select INITCAP(first_name) , INITCAP(last_name) ,LOWER (job_id)
from employees 
order by LOWER (job_id);

select first_name , last_name ,LOWER (job_id)
from employees 
order by LOWER (job_id);
--2.
select last_name || '-' || job_id from employees;
--or
select CONCAT(CONCAT (last_name, '-'), job_id) from employees;
--3.
select * from employees where length(salary) > 4;
--4.
select * from employees;
select first_name ,rpad(salary, 10, '*') from employees ;
select first_name,salary from employees order by rpad(salary, 10,'*') ;--icorrect answer cause it took rpad as column thus it is looking for it.
--5.
select last_name, length(last_name) from employees;


--replace metod
select replace ('hello seed', 'seed', 'SEED') from dual;

select replace ('SEED' ,'E','e') from dual;
--trim method leading/ltrim {from begginig} , both{from both beggining and ending}, trailing/ rtrim(from ending)
select trim (leading 's' from 'seed') from dual;
select trim (trailing 'd' from 'seed' ) from dual;
select trim (both 'n' from 'noon')from dual;
select trim(rtrim('  hello  ')) from dual;
select trim ();




