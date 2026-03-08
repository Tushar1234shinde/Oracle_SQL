1) What are DDL commands?
DDL (Data Definition Language) commands are used to define and modify database structure, such as CREATE, ALTER, DROP, and TRUNCATE.

2) Can you add a NOT NULL constraint to a column which already has NULL values?
No, you cannot add a NOT NULL constraint if the column already contains NULL values.

3) Can you decrease the size of the column by using ALTER TABLE syntax?
Yes, but only if the existing data fits within the new column size.

4) Can you change the data type of the column using ALTER TABLE syntax?
Yes, the data type of a column can be changed using the ALTER TABLE command.

5) What is the difference between table level constraint and column level constraint?
Column level constraints are defined for a single column, while table level constraints apply to multiple columns.

6) Can you create a composite key? How?
Yes, a composite key is created by combining two or more columns as a primary key.

7) Can a column with UNIQUE constraint in master table be referenced as foreign key in child table?
Yes, a column with a UNIQUE constraint can be referenced as a foreign key.

8) Can a foreign key column have NULL values?
Yes, a foreign key column can contain NULL values.