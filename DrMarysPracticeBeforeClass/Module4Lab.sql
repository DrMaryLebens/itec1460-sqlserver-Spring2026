-- Query #1: Using a Join to retrieve data from two tables

SELECT C.CompanyName, O.OrderDate
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID;

-- Query #2: LEFT JOIN to show all customers, even those without any orders
SELECT c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Query 3: Using Built-in Functions
SELECT OrderID, ROUND( SUM( UnitPrice * Quantity * (1 - Discount) ), 2 ) AS TotalValue, 
COUNT(*) AS NumberOfItems
FROM [Order Details]
GROUP BY OrderID
ORDER BY TotalValue DESC;

--Query #4 - Group records to get the number of times each product is ordered, then filter using HAVING to only get products ordered more than 10 times

SELECT p.ProductID, p.ProductName, COUNT(od.OrderID) AS TimesOrdered
FROM Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(od.OrderID) > 10
ORDER BY TimesOrdered DESC;

--Query #5: User a subquery to get the average price of a product, then display product info for products where the price is above the average.

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (
  SELECT AVG(UnitPrice) FROM Products
)
ORDER BY UnitPrice;

