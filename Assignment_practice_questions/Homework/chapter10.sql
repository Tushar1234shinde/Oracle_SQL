-- 1. Difference between PRIMARY KEY and UNIQUE constraint

PRIMARY KEY:
- Uniquely identifies each record in a table.
- Does not allow NULL values.
- Only one primary key is allowed per table.

UNIQUE KEY:
- Ensures all values in a column are unique.
- Allows NULL values.
- Multiple UNIQUE constraints can exist in a table.


-- 2. State True or False

a) Primary key based on single column cannot be defined at table level.  
False

b) NOT NULL and UNIQUE constraint given on a single column behaves like a PRIMARY KEY.  
True

c) NOT NULL cannot be defined at table level.  
True

d) It is compulsory to give constraint name to the constraint.  
False

e) Foreign key can refer unique key of the same table.  
True

f) It is possible to delete child or dependent records as soon as parent record is deleted.  
False


-- 3. Is it possible to have NULL value in a column defined with foreign key constraint?

Yes, a foreign key column can contain NULL values.


-- 4. How can you add NOT NULL constraint after table creation?

ALTER TABLE table_name
MODIFY column_name datatype NOT NULL;