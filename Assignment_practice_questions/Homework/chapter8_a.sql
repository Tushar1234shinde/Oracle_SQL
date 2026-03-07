-- 1. Display the names of the customers served by salesperson 'Jeff'.
   SELECT c.cName
   FROM Customer c
   JOIN Orders o ON c.cNum = o.cNum
   JOIN Salespeople s ON s.sNum = o.sNum
   WHERE s.sName = 'Jeff';


-- 2. Display the names of the salesperson who have served orders between 10-3-2014 and 10-8-2014.
   SELECT DISTINCT s.sName
   FROM Salespeople s
   JOIN Orders o ON s.sNum = o.sNum
   WHERE o.oDate BETWEEN '10-Mar-2014' AND '10-Aug-2014';


-- 3. Display the order number with the highest order amount.
   SELECT oNum
   FROM Orders
   WHERE amount = (SELECT MAX(amount) FROM Orders);


-- 4. Which customers have the second highest rating?
   SELECT cName
   FROM Customer
   WHERE rating = (
       SELECT MAX(rating)
       FROM Customer
       WHERE rating < (SELECT MAX(rating) FROM Customer)
   );