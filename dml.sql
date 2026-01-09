--DML STATEMENT (Data Manipulation Language)

--insert
--update
--delete


select * from  departments;

--insert
insert into departments 
values(280,'public relation',100,1700);

insert into departments (department_id,department_name)
values (290,'Cleark');

insert into departments (department_id,department_name,manager_id, location_id)
values (300,'Cleark',null,null);

--constraint violated
insert into departments (department_id,department_name,manager_id, location_id)
values (310,'Cleark',0,0); 

insert into departments 
values ('Cleark',null,330,null);

--sequence alter
insert into departments (department_name,manager_id,department_id, location_id)
values ('Character',100,330,1700);

--update
update departments
set department_name='Public Relation'
where department_id=280;

--create  copy_emp
create table copy_emp
as
select * from employees;

select * from copy_emp;

select * from copy_emp
where employee_id=113;

update copy_emp
set department_id=50
where employee_id=113;

update copy_emp
set department_id=50;


--delete
delete departments
where department_id=280;

select * from copy_emp where employee_id=113;

select * from copy_emp;

delete copy_emp
where employee_id=113;

delete copy_emp
where employee_id in (199,200,201);

delete copy_emp;
