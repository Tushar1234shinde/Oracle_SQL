--DDL (Data definition Language)

--create 
--alter
--drop
--truncate

--create
CREATE TABLE dept (
    dept_no NUMBER(2) PRIMARY KEY,
    d_name  VARCHAR2(14),
    loc     VARCHAR2(13)
);

SELECT        
    *
FROM
    dept;

DROP TABLE dept;

CREATE TABLE hire_date (
    id         NUMBER(2),
    hire_dates DATE DEFAULT sysdate
);

SELECT
    *
FROM
    hire_date;

INSERT INTO emp123 VALUES ( NULL,
                            'OM' );

INSERT INTO hire_date ( id ) VALUES ( 2 );

SELECT
    *
FROM
    employees;

CREATE TABLE emp123 (
    emp_id     NUMBER(3)
        CONSTRAINT emp1_emp123_id_pk PRIMARY KEY,
    first_name VARCHAR2(15)
);

SELECT
    *
FROM
    emp123;

DROP TABLE emp123;

CREATE TABLE emp123 (
    emp_id        NUMBER(3),
    last_name     VARCHAR2(15) NOT NULL,
    email         VARCHAR2(15),
    department_id NUMBER(3),
    CONSTRAINT emp123_emp_id_pk PRIMARY KEY ( emp_id ),
    CONSTRAINT emp123_email_uk UNIQUE ( email ),
    CONSTRAINT emp123_dep_id_fk FOREIGN KEY ( department_id )
        REFERENCES dept ( dept_no )
);

desc emp123;

--creating table with subquery
create table sub_emp
as
select employee_id "ID", first_name || ' '|| last_name as "Name", department_id from employees;

create table sub_emp1
as
select employee_id "ID", first_name || ' '|| last_name as "Name", department_id from employees
where department_id=50;

select * from sub_emp1;

