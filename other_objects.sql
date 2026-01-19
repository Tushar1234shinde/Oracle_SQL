--SQL Other Object

--1. Table
--2. Sequence
--3. View
--4. Synonyms
--5. Index


--view
create view view_name
as
select * from employees
where department_id=50;

desc view_name;
select * from view_name;

drop  view view_name;

--sequence
create sequence seq2
start with 340
increment by 10
maxvalue 9990
nocycle
nocache;


select seq1.nextval from dual;

select * from departments;

insert into departments(department_id,department_name)
values (seq2.nextval,'Clerk');


--index
create index ind1
on departments(department_name);

select department_name from departments;

--synonyms
create synonym emp for employees;

select * from emp;
create synonym dep for departments;
select * from dep;
select * from departments;

-- Transaction Properties
--ACID properties
--A = atomicity
--C = Consistency
--I = Isolation
--D = Durability

--CRUD Operation
--C = Create / insert
--R = Read / Select
--U = Update
--D = Delete