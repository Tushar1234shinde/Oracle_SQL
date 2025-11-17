--⭐ Introduction to Oracle SQL
--
--Oracle SQL (Structured Query Language) is Oracle’s powerful language used to store, manage, and retrieve data from Oracle Database.
--It follows the SQL standard but also provides many advanced features and extensions that make Oracle one of the most widely used database systems in the world.
--
--✅ What is Oracle SQL?
--
--Oracle SQL is a language used to:
--
--Create and manage databases
--
--Insert, update, delete, and retrieve data
--
--Define tables, views, indexes, sequences
--
--Control user permissions and security
--
--Work with transactions
--
--Use functions, joins, subqueries, constraints, etc.
--
--🔹 Why Oracle SQL is Important
--
--Used in enterprise applications
--
--Reliable, secure, and scalable
--
--Supports large amounts of data
--
--Comes with strong tools like SQL*Plus, SQL Developer, and Oracle APEX
--
--🔹 Core Components of Oracle SQL
--1. DDL – Data Definition Language
--
--Used to define and manage structures
--
--CREATE
--
--ALTER
--
--DROP
--
--TRUNCATE
--
--RENAME
--
--Example:

create table employees (
  emp_id number,
  emp_name varchar2(50)
);

--2. DML – Data Manipulation Language
--
--Used to manipulate data inside tables
--
--SELECT
--
--INSERT
--
--UPDATE
--
--DELETE
--
--Example:

select * from employees;

--3. DCL – Data Control Language
--
--Used for permissions and access
--
--GRANT
--
--REVOKE
--
--Example:

grant select on employees to user1;

--4. TCL – Transaction Control Language
--
--Used to control transactions
--
--COMMIT
--
--ROLLBACK
--
--SAVEPOINT
--
--Example:

commit;

--🔹 Oracle SQL Data Types
--
--Some common data types:
--
--NUMBER – numeric values
--
--VARCHAR2(size) – variable-length characters
--
--DATE – date and time
--
--CLOB – large text
--
--BLOB – binary objects
--
--🔹 Oracle SQL Tools
--
--You can use Oracle SQL in tools like:
--
--SQL*Plus
--
--Oracle SQL Developer
--
--Oracle APEX
--
--
--🔹 Sample Oracle SQL Queries
--Insert data:
insert into employees values (101, 'Gaurav');

--Select data:
select emp_id, emp_name from employees;

--Update data:
update employees set emp_name = 'Tushar' where emp_id = 101;

--Delete data:
delete from employees where emp_id = 101;

--🌟 Summary
--
--Oracle SQL is:
--
--A powerful and standard language for working with Oracle Databases
--
--Essential for developers, DBAs, analysts
--
--Used for creating and manipulating data efficiently
--
--Supported by strong tools and advanced features