-- 1. Display name of the customers with initial letter capital. Also display the city in upper case.

-- 2. Display the order date with amount right justified and padded with '#'.

-- 3. Display the last name of the sales person and the length of the name.

-- 4. Display the order id, amount and order date with amount rounded off to 4 decimal places.

-- 5. Display customer ids of all customers who booked orders on October 3, 2014.


-- Solution

Select initcap(cname), upper(city) from Customer;

Select odate, rpad(amount,10,'#') from Orders;

Select sname, length(sname) from Salesperson;

Select onum, round(amount,4), odate from Orders;

Select cnum from Orders where odate = '03-Oct-2014';