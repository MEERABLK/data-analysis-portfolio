 
CREATE DATABASE Assignment_1;

use Assignment_1 ;

CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
ProductName VARCHAR(50),
Category VARCHAR(50),
SaleDate DATE,
SaleAmount DECIMAL(10, 2)
);INSERT INTO Sales (SaleID, ProductName, Category, SaleDate, SaleAmount)
VALUES
(1, 'Product A', 'Electronics', '2023-01-05', 1500.00),
(2, 'Product B', 'Clothing', '2023-01-08', 800.00),
(3, 'Product C', 'Electronics', '2023-01-10', 2200.00),
(4, 'Product D', 'Books', '2023-01-12', 300.00),
(5, 'Product E', 'Electronics', '2023-01-15', 1700.00),
(6, 'Product F', 'Clothing', '2023-01-18', 600.00),
(7, 'Product G', 'Books', '2023-01-20', 500.00),
(8, 'Product H', 'Electronics', '2023-01-22', 1900.00),
(9, 'Product I', 'Clothing', '2023-01-25', 1000.00),
(10, 'Product J', 'Books', '2023-01-28', 400.00),
(11, 'Product K', 'Electronics', '2023-01-30', 2500.00),
(12, 'Product L', 'Clothing', '2023-02-02', 700.00),
(13, 'Product M', 'Books', '2023-02-05', 600.00),
(14, 'Product N', 'Electronics', '2023-02-08', 1800.00),
(15, 'Product O', 'Clothing', '2023-02-10', 850.00),
(16, 'Product P', 'Books', '2023-02-12', 350.00),
(17, 'Product Q', 'Electronics', '2023-02-15', 2000.00),
(18, 'Product R', 'Clothing', '2023-02-18', 500.00),
(19, 'Product S', 'Books', '2023-02-20', 700.00),
(20, 'Product T', 'Electronics', '2023-02-22', 2100.00);


--1- Select the ProductName and SaleAmount columns.
SELECT ProductName,
SaleAmount
FROM  Sales;


--2- Select sales where the SaleAmount is greater than 1500.
SELECT * 
FROM Sales
WHERE SaleAmount > 1500;


--3- Select sales in the Electronics category.SELECT * FROM SalesWHERE Category = 'Electronics';--4- Select sales with a SaleAmount between 1000 and 2000.SELECT * FROM Sales WHERE SaleAmount BETWEEN 1000 AND 2000;--5- Select the total number of sales.SELECT COUNT(*)AS Total_SalesFROM Sales;--6- Select the total sales amount.SELECT SUM(SaleAmount) 
AS Total_SaleAmount 
FROM Sales;
--7- Select the average sale amount.SELECT AVG(SaleAmount)
AS Average_SaleAmount 
FROM Sales;


--8 Select the maximum sale amount.SELECT MAX(SaleAmount) 
AS Maximum_SaleAmount
From Sales 
ORDER BY Maximum_SaleAmount DESC;


--9- Select total sales amount for each category.
SELECT Category,
SUM(SaleAmount)
AS Total_SaleAmount 
FROM Sales 
GROUP BY Category;


--10- Select average sale amount for each category.SELECT Category, 
AVG(SaleAmount) 
AS Average_SaleAmount 
FROM Sales 
GROUP BY Category;


--11- Select top 5 sales with the highest sale amount.SELECT TOP (5) SaleAmount
AS Highest_SaleAmount
From Sales
ORDER BY Highest_SaleAmount DESC;


--12- Select top 3 sales in the Electronics category with the highest sale amount
SELECT TOP (3) SaleAmount 
From Sales WHERE Category = 'Electronics'
ORDER BY SaleAmount DESC;


--13- Select total sales amount for each product, ordered by total sales amount in descending order.SELECT ProductName,SUM(SaleAmount) AS Total_SaleAmount FROM SalesGROUP BY ProductName ORDER BY Total_SaleAmount DESC;--14- Select the average sale amount for each category, excluding sales with a sale amount less than 500
SELECT Category, 
AVG(SaleAmount) 
AS Average_SaleAmount 
FROM Sales 
GROUP BY Category 
HAVING AVG(SaleAmount) > 500;


--15- Select the total number of sales for each category, ordered by category.SELECT Category, count(*) AS Total_Sales FROM Sales GROUP BY Category ;--16- Select the average sale amount for each month, where the total sales amount exceeds 2000.SELECT MONTH(SaleDate)
AS Month,
AVG(SaleAmount)
AS Average_SaleAmount
FROM Sales
GROUP BY MONTH(SaleDate)
HAVING SUM(SaleAmount) > 2000;
--17- Select the top 3 categories with the highest total sales amount.SELECT TOP(3) Category,SUM(SaleAmount) AS Highest_SaleAmount FROM Sales GROUP BY Category ORDER BY Highest_SaleAmount DESC;--18 Select the average sale amount for each product, where the total sales amount exceeds 1000.SELECT ProductName, 
AVG(SaleAmount) 
AS Average_SaleAmount
FROM Sales 
GROUP BY ProductName 
HAVING SUM(SaleAmount) > 1000;


--19- Select the average sale amount for each product category, ordered by average sale amount.SELECT Category,
ProductName, 
AVG(SaleAmount) 
AS Average_SaleAmount 
FROM Sales 
GROUP BY Category,
ProductName 
ORDER BY AVG(SaleAmount);


/*20- Select the average sale amount for each product category, where the average sale amount is
greater than 500, ordered by average sale amount.*/
SELECT Category,
ProductName, 
AVG(SaleAmount) 
AS Average_SaleAmount
FROM Sales
GROUP BY Category, 
ProductName 
HAVING AVG(SaleAmount) > 500 
ORDER BY AVG(SaleAmount);


--21- Select the product categories with an average sale amount greater than 1000, and their total sales amount.
SELECT Category, 
AVG(SaleAmount) 
AS Average_SaleAmount, 
SUM(SaleAmount) 
AS Total_SaleAmount
FROM Sales 
GROUP BY Category
HAVING AVG(SaleAmount) > 1000;


--22- Select the months with more than 3 sales and their total sales amount.
SELECT MONTH(SaleDate) AS Month,
count(*) AS Total_Sales, SUM(SaleAmount) AS Total_SaleAmount FROM Sales
GROUP BY MONTH(SaleDate) HAVING count(*) > 3;


--23- Select the product categories where the maximum sale amount is greater than 2000.
SELECT Category,
MAX(SaleAmount) 
AS Maximum_SaleAmount 
FROM Sales 
GROUP BY Category
HAVING MAX(SaleAmount) > 2000;


--24- Select the product categories with an average sale amount less than 800 or more than 1500.
SELECT Category, 
AVG(SaleAmount) 
AS Average_SaleAmount 
FROM Sales 
GROUP BY Category
HAVING AVG(SaleAmount) < 800 
OR AVG(SaleAmount) > 1500;


--25- Select the product categories with more than 2 sales and an average sale amount greater than 500.SELECT Category,
count(*) 
AS Total_Sales, 
AVG(SaleAmount) 
AS Average_SaleAmount 
FROM Sales
GROUP BY Category
HAVING count(*) > 2 AND AVG(SaleAmount) > 500;