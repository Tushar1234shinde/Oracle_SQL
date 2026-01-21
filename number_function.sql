--Number function

--round function
select round(98.9), round(97.3) from dual;

select round(355.2776,2), round(476478.3485,-4) from dual;


--trunc function
select trunc(78.9), trunc(48.1) from dual;

select trunc(3759.2384904,5), trunc(26385.4769,-3) from dual;


--ceil function 
--ceil can accept only one argument and round can accept two argument

select ceil(98.9), ceil(97.3) from dual;


--floor
--floor can accept only one argument and trunc can accept two argument

select floor(78.9), floor(48.1) from dual;


--mod function
select mod(7,2), mod(87,5) from dual;


--number method
select round (99.9)from dual;
select round (99.5) from dual;
select round (99.4)from dual;
--here it takes roundup of total before decimal
--trunc
select trunc (99.99)from dual;
select trunc (99.998909) from dual;
select trunc (67.9090,2) from dual;

--round and trunc
select round (46783.5), trunc(7829.78) from dual;--(9090,3) second argument
select round (23.23), trunc(49.78) from dual;
select round (456789.333, 1), trunc (6578.930,2) from dual;-- positive number with number would be used to select number from right side of decimal and make other removed and selected ones will be dislayed
select round (789.234,-2), trunc(4783.123,-3) from dual;
select round (789.234,-3), trunc(4783.123,-4) from dual;
select round (789.234,-4), trunc(4783.123,-4) from dual;

--ceil
select ceil(99.4) from dual;--round up higher number in all condition
select ceil(3486895.8489859,-3) from dual;--you saw error 
--because it so not accept second argument's(__,__) only single (__)

--floor
select floor(12.3) from dual;
select floor(14.02) from dual;--it gives us smaller value as even it has higher no.in it
--key point:- 1.it should always have something inits to give some change in output otherwise it remains constant

--ceil & floor
select ceil(3486895.849), floor (464383.4) from dual;



--mod {it is modulus}
select mod(12,6)from dual;-- it always give remainder as output.
select mod (127,3) from dual; 
select mod (12*2,3)from dual;

--NEW QUESTION SERIES
--1.
select job_id, ROUND(salary/5000) from employees where job_id = 'SA_REP';

--2.
SELECT ROUND(power(7,4)) FROM dual;

--3.
select (salary*12)+commission_pct*12 as "anual salary" from employees where commission_pct is not null;
select * from employees;
