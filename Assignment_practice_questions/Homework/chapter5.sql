-- 1. List the commission received by all the salespeople.
   SELECT sName, NVL(comm,0) "Comm" FROM Salespeople;

-- 2. Display order number, amount and amount after discount. 
   Amount after discount to be displayed as expression amount – 0.1%.
   SELECT oNum, amount, amount - (0.1 * amount) FROM Orders;

-- 3. Display order number, amount and order date. Display the dates in a format 
   that appears as “17 June 1987”.
   SELECT oNum, amount, TO_CHAR(oDate, 'fmDD Month YYYY') oDate FROM Orders;

-- 4. On which days has the customer with id 2001 placed orders?
   SELECT TO_CHAR(oDate,'day') FROM Orders WHERE cnum = 2001;