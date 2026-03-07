-- 1. Display the average amount and number of customers for salesperson with id as 1001.
   SELECT AVG(amount), COUNT(cnum) FROM Orders WHERE snum = 1001;

-- 2. Display the number of salespeople residing in ‘London’.
   SELECT COUNT(snum) FROM Salespeople WHERE city = 'London';

-- 3. When was the last order placed by each customer?
   SELECT cnum, MAX(odate) FROM Orders GROUP BY cnum;

-- 4. Display number of customers salesperson wise with orders having count of customers greater than 6.
   SELECT snum, COUNT(cnum) FROM Orders GROUP BY snum HAVING COUNT(cnum) > 6;

-- 5. Display maximum count of orders placed by any customer.
   SELECT MAX(COUNT(onum)) FROM Orders GROUP BY cnum;

-- 6. Count the number of non-NULL rating fields in the customer table.
   SELECT COUNT(rating) FROM Customer WHERE rating IS NOT NULL;