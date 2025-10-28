# 📊 Sales Performance Analytics Dashboard
**Virtual Internship Program — Bank Muamalat x Rakamin Academy**

This project aims to analyze sales performance using data from multiple relational tables and visualize key insights using Google BigQuery and Looker Studio.

---

## 🧠 Objectives
- To perform data cleaning and integration using SQL in Google BigQuery
- To create a master table for analysis
- To visualize sales insights using Looker Studio Dashboard

---

## 🗂 Dataset Description
There are 4 tables used in this project:
1. **Customers** (`CustomerID`, `CustomerEmail`, `CustomerCity`, ...)
2. **Products** (`ProdNumber`, `ProdName`, `Price`, `Category`)
3. **Orders** (`OrderID`, `Date`, `CustomerID`, `ProdNumber`, `Quantity`)
4. **ProductCategory** (`CategoryID`, `CategoryName`, `CategoryAbbreviation`)

---

## 🧩 ERD (Entity Relationship Diagram)
![ERD](ERD_BIanalyst.drawio.png)

---

## ⚙️ Data Processing in BigQuery
```sql
SELECT 
  o.Date AS order_date,
  pc.CategoryName AS category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (p.Price * o.Quantity) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city
FROM `finalproject-476410.master_sales.orders` AS o
JOIN `finalproject-476410.master_sales.customers` AS c
  ON o.CustomerID = c.CustomerID
JOIN `finalproject-476410.master_sales.products` AS p
  ON o.ProdNumber = p.ProdNumber
JOIN `finalproject-476410.master_sales.product_category` AS pc
  ON p.Category = pc.CategoryID
ORDER BY o.Date ASC;
