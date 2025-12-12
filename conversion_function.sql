-- Conversion Function



--1] Implicit Type Conversion

--number to char
select 'This is charachter ' || 10 from dual;

select 'This is charachter ' || 20  as "sdfgsufisgfisdgvbsdjkvbjksdvb" from dual;

select 'This is charachtesdfhsjkdvhjskhvr ' || 20  as "sdfgsufisgfisdgvbsdjkvbjksdvb" from dual;

--char to number
select '2' + 4 as "sgadsfgiuribgkjbvfdnvjk uvgiufhvkjnv" from dual;


--2] Explicit type casting

select to_char(current_date) from dual;

select to_char(current_date,'MON dd year') from dual;

select to_char(current_date,'MONTH') from dual;

select to_char(current_date,'dy-mm-yyyy') from dual;

select to_char(to_date('16-Jul-25'),'yyyy year - mm mon month / dy day dd') from dual;

select last_name, hire_date, to_char(hire_date,'fmDD MON YYYY') from employees;

select to_char(current_date,'yyyyspth') , to_char(current_date,'year')from dual;

select to_char(94747459,'$99,999,999.00') from dual;

select TO_CHAR(salary,'L99,999.0000') from employees;

select last_name, to_char(hire_date,'DD-Mon-YYYY')
from employees
where hire_date<to_date('01-Jan-14','DD-MON-RR') ;

select to_number(to_char(to_date('01-AUG-2014'),'mm'))+2 as result from employees;



