-- SHARPEN YOUR PENCIL 10


-- Q1. State the difference between primary key and unique constraint.
| Primary Key                          | Unique Constraint                                       |
| ------------------------------------ | ------------------------------------------------------- |
| Does not allow NULL values           | Allows one NULL value                                   |
| Only one primary key per table       | Multiple unique constraints allowed                     |
| Automatically creates a unique index | Also creates a unique index but not the main identifier |

-- Q2. State true or false

a. Primary key based on single column cannot be defined at table level.
False

b. NOT NULL and UNIQUE constraint given on a single column behaves like a PRIMARY KEY.
True

c. NOT NULL cannot be defined at table level.
True

d. It is compulsory to give constraint name to the constraint.
False

-- Q3. Is it possible to have null value in a column defined with foreign key constraint?

Yes, a foreign key column can contain NULL values unless it is defined with NOT NULL constraint.

-- Q4. State true or false

a. Foreign key can refer unique key of the same table.
True

b. It is possible to delete child or dependent records as soon as parent record is deleted.
False

-- Q5. Create a table emp_history based on employee table such that only structure is copied and data is not copied.
CREATE TABLE emp_history
AS
SELECT *
FROM employees
WHERE 1=0;

-- Q6. Is constraint information copied when you try to create table based on another table?

No, constraints are not copied when a table is created using CREATE TABLE ... AS SELECT. Only structure and data (if selected) are copied.