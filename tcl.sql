--TCL statement (Transaction Control Language)

--commit
--rollback
--savepoint

select * from copy_emp;
commit;

delete from copy_emp
where department_id in (194,100);

savepoint a;

insert into copy_emp
values(207,'f_name','l_name','email','45679393939',sysdate, 'AC_MGR',15000,null,124,50);


update copy_emp
set employee_id=300
where employee_id=207;

savepoint b;

insert into copy_emp
values(207,'f_name','l_name','email','45679393939',sysdate, 'AC_MGR',15000,null,124,50);

rollback to savepoint b;

rollback to savepoint a;

rollback;

delete from copy_emp
where department_id in (50,60,70,80,90);

commit;
select * from copy_emp;

rollback;

drop table copy_emp;
create table copy_emp
as
select * from employees;