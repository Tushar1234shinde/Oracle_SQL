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