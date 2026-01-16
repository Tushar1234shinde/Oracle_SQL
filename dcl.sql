--DCL (Data Controlling Language)

--grant
--revoke


--privileges are of two types
--1. system privileges
--2. object privileges


--1. system privileges

--creating a new user
create user user_name identified by user_pass;

--granting privileges to user
grant create session, create table, 
create view, create sequence, create procedure
to user_name;

--creating a role (like manger)
create role role_name;

--granting privileges to role
grant create_table to role_name;

--passing privileges from role to user
--or
--assigning role to user
grant role_name to user_name;

--altering users pasword
alter user user_name identified by new_pass;



--2. object privileges

grant insert (department_id)
on departments
to user_name1,user_name2;

grant insert 
on departments
to role_name1,role_name2;

grant insert,update,delete 
on employees
to user_name;

grant select,insert
on departments
to role_name
with grant option;

grant select
on departments
to public;


--confirming granted privileges
select * from role_sys_privs;
select * from role_tab_privs;
select * from user_role_privs;
select * from user_sys_privs;
select * from user_tab_privs_made;
select * from user_tab_privs_recd;
select * from user_col_privs_made;
select * from user_col_privs_recd;

--revoking object

--basic syntax
--revoke privilege1,privilege2 | ALL
--on object
--from user1,user2 | role | public
--[cascade constraints];

revoke update,insert
on employees
from user_name;

revoke delete
on departments
from role_name;


--deleting user 
drop user user_name cascade;
