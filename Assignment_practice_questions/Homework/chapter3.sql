-- 1. List the customer name, city and rating of all customers.
   SELECT cName, city, rating FROM Customer;

-- 2. Find all the customers in "Houston" with rating above 200.
   SELECT cName FROM Customer
   WHERE city LIKE 'Houston' AND rating > 200;

-- 3. List all the salespeople with commission less than 3%.
   SELECT sName FROM Salespeople
   WHERE comm < .03;

-- 4. List the details of customers in alphabetical order of name and in the descending order of rating.
   SELECT cName FROM Customer
   ORDER BY cName, rating DESC;

-- 5. List the orders not processed by salesperson with id 100 and 101.
   SELECT oNum FROM Orders
   WHERE sNum NOT IN (100, 101);

-- 6. List the orders with order date before 10th Feb 2013 and after 10th Feb 2011.
   SELECT oNum FROM Orders
   WHERE oDate BETWEEN '10-Feb-2011' AND '10-Feb-2013';