-- 1. Display all information about Customers.
   Select * from Customers;

-- 2. Display the names of sales people along with their commission.
   select sname, comm from Salespeople;

-- 3. Display order number, amount and order date from Order table.
   select onum, amount, odate from Orders;

-- 4. List the different cities to which the customers belong to.
   select distinct city from Customer;

-- 5. Display cities to which sales people belong to. [Do not include duplicate ones]. Display the column name as “Cities”.
   select distinct city as "Cities" from Salesperson;
