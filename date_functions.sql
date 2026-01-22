--Date function

select hire_date from employees;

select sysdate from dual;

select current_date from dual;

select sessiontimezone, current_timestamp from dual;

select last_name, (sysdate-hire_date)/7 as "Week" from employees;


select months_between('01-SEP-05','11-JAN-04') from dual;

select months_between('02-FEB-07','27-APR-09') from dual;

select add_months(sysdate,-7) from dual;

select add_months(sysdate,2) from dual;

select next_day(current_date,'Wednesday') from dual;

select next_day(hire_date,'Sunday') as "Revised date" from employees
order by "Revised date";

select last_day(current_date) from dual;

select last_day('12-Nov-25') from dual;

select last_day('12-FEB-26') from dual;

select last_day('21-Dec-26') from dual;


select round(sysdate,'Month') from dual;

select round(to_date('20-DEC-25'),'Month') from dual;

select round(to_date('05-MAr-25'),'Month') from dual;

select round(to_date('16-DEC-25'),'Month') from dual;

select round(sysdate,'Year') from dual;

select round(to_date('16-May-25'),'Year') from dual;

select round(to_date('16-Mar-25'),'Year') from dual;

select round(to_date('16-Jan-25'),'Year') from dual;

select trunc(sysdate,'month') from dual;

select trunc(sysdate,'year') from dual;

select trunc(to_date('12-Nov-25'),'Year') from dual;

--round
-- dy/day : round to nearest sunday date (sunday,monday,tuesday,wednesday=current sunday -and- thursday,friday,saturday=next week sunday)
-- mm/mon/month : round months on the basis of date(dd) (dd>15 = next month -and- dd<=15 = current month)
-- rr/yy/yyyy/year : round year on the basis of month (month>june(06) = next year -and- month<=june(06) = current year)
select round(to_date('27-jan-25'),'dd') from dual;

select round(to_date('27-jan-25'),'dy') from dual;

select round(to_date('27-jan-25'),'day') from dual;

select round(to_date('27-jan-25'),'mm') from dual;

select round(to_date('27-jan-25'),'mon') from dual;

select round(to_date('27-jan-25'),'month') from dual;

select round(to_date('27-jan-25'),'year') from dual;

select round(to_date('27-jan-25'),'yy') from dual;

select round(to_date('27-jan-25'),'year') from dual;

--trunc
select trunc(to_date('27-jan-25'),'dd') from dual;

select trunc(to_date('27-jan-25'),'dy') from dual;

select trunc(to_date('27-jan-25'),'day') from dual;

select trunc(to_date('27-jan-25'),'mm') from dual;

select trunc(to_date('27-jan-25'),'mon') from dual;

select trunc(to_date('27-jan-25'),'month') from dual;

select trunc(to_date('27-jan-25'),'year') from dual;

select trunc(to_date('27-jan-25'),'yy') from dual;

select trunc(to_date('27-jan-25'),'year') from dual;





