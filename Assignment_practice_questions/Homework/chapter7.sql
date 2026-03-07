-- 1. Display the order id, name of the customer and amount ordered.
   SELECT o.onum, c.cnum, o.amount
   FROM Orders o JOIN Customer c
   ON (o.cnum = c.cnum);

-- 2. Display the name of the salesperson and the order date.
   SELECT s.snum, o.odate
   FROM Orders o JOIN Salespeople s
   ON (o.snum = s.snum);

-- 3. Find salespeople with customers located in their own cities.
   SELECT s.sname, c.cname
   FROM Salespeople s JOIN Customer c
   ON (s.city = c.city);

-- 4. List all salespersons with the names of customers they are serving.
   SELECT s.sName, c.cName
   FROM Salespeople s JOIN Orders o
   ON (s.sNum = o.sNum)
   JOIN Customer c
   ON (c.cNum = o.cNum);

-- 5. List the sum of amount of orders per salesperson. Display the name of the salesperson also.
   SELECT s.sNum, s.sName, SUM(amount)
   FROM Salespeople s JOIN Orders o
   ON (s.sNum = o.sNum)
   GROUP BY s.sNum, s.sName;