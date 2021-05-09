# Fall-2021-Data-Science-Intern-Challenge


Question 1: Given some sample data, write a program to answer the following: click here to access the required data set

On Shopify, we have exactly 100 sneaker shops, and each of these shops sells only one model of shoe. We want to do some analysis of the average order value (AOV). When we look at orders data over a 30 day window, we naively calculate an AOV of $3145.13. Given that we know these shops are selling sneakers, a relatively affordable item, something seems wrong with our analysis. 

a.	Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 
The calculation of $3145.13 was arrived by using the average() function on the order_amount column. However, I think the average order of $3145.13 for a customer is way too    high.  
b.	What metric would you report for this dataset? 
Another way of evaluating this data is using the sum() function on the order_amount column and total_items column and then dividing the sum of the order_amount by the sum of the total_items.
c.	What is its value? 
The new value would come out as $357.92.


Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

a.	How many orders were shipped by Speedy Express in total? 54
SELECT COUNT(*)
FROM [Orders] Join [Shippers] ON Orders.ShipperID = Shippers.ShipperID 
Where ShipperName = 'Speedy Express'
b.	What is the last name of the employee with the most orders? Peacock, 40 orders
SELECT LastName, Count(*) 
FROM [Employees] JOIN [Orders] ON Employees.EmployeeID = Orders.EmployeeID
Group By LastName
Order By Count(*) desc
c.	What product was ordered the most by customers in Germany? 
Camembert Pierrot, Quantity – 40, Orders – 300, Total Ordered – 12,000

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
