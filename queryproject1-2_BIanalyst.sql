-- 1️⃣ Customer
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT CustomerID ) AS unique_rows,
  SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_count
FROM `finalproject-476410.master_sales.customers`;

-- 2️⃣ Products
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT ProdNumber) AS unique_rows,
  SUM(CASE WHEN ProdNumber IS NULL THEN 1 ELSE 0 END) AS null_count
FROM `finalproject-476410.master_sales.products`;

-- 3️⃣ Orders
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT OrderID ) AS unique_rows,
  SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS null_count
FROM `finalproject-476410.master_sales.orders`;

-- 4️⃣ Product Category
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT CategoryID ) AS unique_rows,
  SUM(CASE WHEN CategoryID IS NULL THEN 1 ELSE 0 END) AS null_count
FROM `finalproject-476410.master_sales.product_category`;

SELECT 
  c.CustomerID,
  c.FirstName,
  c.LastName,
  c.CustomerEmail,
  c.CustomerCity,
  o.OrderID,
  o.Date AS OrderDate,
  o.Quantity AS OrderQty,
  p.ProdNumber,
  p.ProdName AS ProductName,
  p.Price AS ProductPrice,
  pc.CategoryID,
  pc.CategoryName
FROM `finalproject-476410.master_sales.orders` AS o
JOIN `finalproject-476410.master_sales.customers` AS c
  ON o.CustomerID = c.CustomerID
JOIN `finalproject-476410.master_sales.products` AS p
  ON o.ProdNumber = p.ProdNumber
JOIN `finalproject-476410.master_sales.product_category` AS pc
  ON p.Category = pc.CategoryID
LIMIT 20;


