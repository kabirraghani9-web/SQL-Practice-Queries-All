/* Q1 - Extract the YEAR from OrderDate from Sales.Orders.*/
SELECT
	YEAR (o.OrderDate) year_date
FROM Sales.Orders o

/* Q2 -  Extract the MONTH number from OrderDate.*/
SELECT
	MONTH (o.OrderDate) month_date
FROM Sales.Orders o

/* Q3 - Extract the DAY number from OrderDate.*/
SELECT
	DAY(o.OrderDate) day_nr
FROM Sales.Orders o 

/* Q4 - Show OrderID and OrderDate along with Month Name using DATENAME.*/
SELECT
	o.OrderID,
	o.OrderDate,
	DATENAME (month, o.OrderDate) month_name
FROM Sales.Orders o

/* Q5 - Count total orders placed in each month.*/
SELECT
	COUNT (*) total_orders,
	DATENAME (month, o.OrderDate) month_name
FROM Sales.Orders o
GROUP BY DATENAME (month, o.OrderDate), MONTH(o.OrderDate)

/* Q6 - Count total orders placed on each weekday (Monday, Tuesday, etc.)*/
SELECT 
    COUNT(*) AS total_orders,
    DATENAME(weekday, o.OrderDate) AS day_name
FROM Sales.Orders o
GROUP BY 
    DATENAME(weekday, o.OrderDate),
    DATEPART(weekday, o.OrderDate)
ORDER BY 
    DATEPART(weekday, o.OrderDate)

/* Q7 - Find total sales per month.*/
SELECT
	DATENAME (month, o.OrderDate) Month_name,
	SUM(o.Sales) Total_sales
FROM Sales.Orders o
GROUP BY DATENAME (month, o.OrderDate), MONTH(o.OrderDate)

/* Q8 - Find average sales per month.*/
SELECT
	DATENAME(month, o.OrderDate) month_name,
	AVG(o.Sales) avg_sales
FROM Sales.Orders o
GROUP BY DATENAME(month, o.OrderDate)

/* Q9 - Find total orders placed in January*/
SELECT 
	DATENAME(month, o.OrderDate) month_name,
	SUM (o.Sales) total_sales
FROM Sales.Orders o
WHERE DATENAME(month, o.OrderDate) = 'January'
GROUP BY DATENAME(month, o.OrderDate)

/* Q10 - Show all orders placed on Mondays.*/
SELECT *
FROM Sales.Orders o
WHERE DATENAME(weekday, o.OrderDate) = 'Monday';

/* Q11 -  Find total sales per weekday.*/
SELECT
	DATENAME(weekday, o.OrderDate) weekday_name,
	SUM(o.Sales) total_sales
FROM Sales.Orders o
GROUP BY DATENAME(weekday, o.OrderDate)

/* Q12 - Find number of orders per day of month (1–31).*/
SELECT
	COUNT(*) orders,
	DAY(o.OrderDate) all_days
FROM Sales.Orders o
GROUP BY DAY(o.OrderDate)

/* Q13 -  Find highest sales value recorded in each month.*/
SELECT
    DATENAME(month, o.OrderDate) AS month_name,
    MAX(o.Sales) AS maximum_sales
FROM Sales.Orders o
GROUP BY 
DATENAME(month, o.OrderDate),
MONTH(o.OrderDate)
ORDER BY 
MONTH(o.OrderDate)

/* Q14 - Find lowest sales value recorded in each month.*/
SELECT
    YEAR(o.OrderDate)  AS order_year,
    DATENAME(month, o.OrderDate) AS month_name,
    MONTH(o.OrderDate) AS month_no,
    Min(o.Sales) AS max_sales
FROM Sales.Orders o
GROUP BY
YEAR(o.OrderDate),
MONTH(o.OrderDate),
DATENAME(month, o.OrderDate)
ORDER BY
    order_year,
    month_no

/* Q15 - Find first order date in each month.*/
SELECT 
	DATENAME (month, o.OrderDate) month_name,
	MIN (o.OrderDate) earliest_date
FROM Sales.Orders o
GROUP BY DATENAME (month, o.OrderDate), MONTH (o.OrderDate)
ORDER BY MONTH(o.OrderDate)

/* Q16 - Find last order date in each month.*/
SELECT
	DATENAME(month, o.OrderDate) month_name,
	MAX(o.OrderDate) last_order_date
FROM Sales.Orders o
GROUP BY DATENAME(month, o.OrderDate), MONTH(o.OrderDate)
ORDER BY MONTH(o.OrderDate)

/* Q17 - Find customers who placed orders in January AND February (Date logic).*/
-- doubt 
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName
FROM Sales.Orders o
INNER JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID
WHERE MONTH (o.OrderDate) = 'January' AND 
      MONTH(o.OrderDate) =  'February'

/* Q18 - Find total sales in first quarter (Jan–Mar).*/
SELECT
	SUM(o.Sales) total_sales,
	DATENAME (month, o.OrderDate) month_name
FROM Sales.Orders o
WHERE MONTH (o.OrderDate) IN (1, 2, 3)
GROUP BY DATENAME (month, o.OrderDate), MONTH(o.OrderDate)
-- ALTERNATIVE FOR Q18
SELECT SUM(o.Sales) AS total_sales_q1
FROM Sales.Orders o
WHERE MONTH(o.OrderDate) IN (1, 2, 3)

/* Q19 - Find total sales in last quarter (Oct–Dec).*/
SELECT
	SUM(o.Sales) as total_sales
FROM Sales.Orders o
WHERE MONTH(o.OrderDate) IN (10, 11, 12)

