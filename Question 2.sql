--- a.)	How many orders were shipped by Speedy Express in total? 54

SELECT COUNT(*)
FROM [Orders] Join [Shippers] ON Orders.ShipperID = Shippers.ShipperID 
Where ShipperName = 'Speedy Express'


---b.)	What is the last name of the employee with the most orders? Peacock, 40 orders

SELECT LastName, Count(*) 
FROM [Employees] JOIN [Orders] ON Employees.EmployeeID = Orders.EmployeeID
Group By LastName
Order By Count(*) desc


---c.)	What product was ordered the most by customers in Germany? Camembert Pierrot, Quantity – 40, Orders – 300, Total Ordered – 12,000
CREATE VIEW Products_Ordered AS
SELECT Orders.OrderID, Customers.Country, OrderDetails.Quantity, Products.ProductName
FROM Orders, OrderDetails
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE Country='Germany';

CREATE VIEW Product_Orders AS
SELECT ProductName, Quantity, COUNT(*) as 'Orders'
FROM Products_Ordered
GROUP BY ProductName;

SELECT ProductName, Quantity, Orders, (Quantity * Orders) AS TotalOrdered
FROM Product_Orders
ORDER BY TotalOrdered desc
LIMIT 1;
