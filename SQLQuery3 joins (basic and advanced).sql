-- JOINS


/* Q1 - Find all orders along with the customer name.*/
SELECT
	o.OrderID,
	c.FirstName,
	c.LastName,
	o.Quantity,
	o.Sales
FROM Sales.Orders o
INNER JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID

/* Q2 - List customers who have placed at least one order.*/
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName,
	o.Quantity
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.Quantity >=1

/* Q3 - Display all customers and their orders (include customers with no orders).*/
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName,
	o.Quantity,
	o.Sales
FROM Sales.Customers c
FULL JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID ASC

/* Q4 - Fetch order details along with product names.*/
SELECT 
	p.ProductID,
	p.Product,
	o.Quantity,
	o.Sales
FROM Sales.Orders o
INNER JOIN Sales.Products p
ON o.ProductID = p.ProductID 

/* Q5 - Find total quantity ordered for each product.*/
SELECT
	p.Product,
	o.Quantity
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON o.ProductID = p.ProductID

/* Q6 - Find customers and the products they purchased..*/ 
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName,
	p.Product
FROM Sales.Orders o
INNER JOIN Sales.Products p
ON o.ProductID = p.ProductID
INNER JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID
