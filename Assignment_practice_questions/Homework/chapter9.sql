-- SALESPEOPLE TABLE

-- INSERT
INSERT INTO Salespeople (snum, sName, city, comm)
VALUES (1005, 'Rahul', 'Mumbai', 0.12);

-- UPDATE (using primary key)
UPDATE Salespeople
SET city = 'Pune'
WHERE snum = 1005;

-- DELETE (using primary key)
DELETE FROM Salespeople
WHERE snum = 1005;



-- CUSTOMER TABLE

-- INSERT
INSERT INTO Customer (cNum, cName, city, rating)
VALUES (2006, 'Amit', 'Delhi', 300);

-- UPDATE (using primary key)
UPDATE Customer
SET city = 'Nagpur'
WHERE cNum = 2006;

-- DELETE (using primary key)
DELETE FROM Customer
WHERE cNum = 2006;



-- ORDERS TABLE

-- INSERT
INSERT INTO Orders (oNum, Amount, oDate, cNum, sNum)
VALUES (3006, 1500, '10-Mar-2014', 2006, 1005);

-- UPDATE (using primary key)
UPDATE Orders
SET Amount = 2000
WHERE oNum = 3006;

-- DELETE (using primary key)
DELETE FROM Orders
WHERE oNum = 3006;