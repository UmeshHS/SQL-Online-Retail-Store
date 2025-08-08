# 🛍 Online Retail Store - SQL Project

## 📌 Project Overview
This project demonstrates the design and implementation of a **Retail Store Database** using SQL.  
It includes creating tables, inserting sample data, and running useful queries for **business insights**.

The project is useful for learning:
- Database design with relationships
- Data insertion and retrieval
- Aggregations and joins
- Query optimization basics

---

## 🗂 Database Structure
The database consists of **four main tables**:

1. **Customers** – Stores customer details  
   | Column      | Type         | Description            |
   |-------------|-------------|------------------------|
   | CustomerID  | INT (PK)    | Unique customer ID     |
   | FirstName   | VARCHAR(50) | Customer's first name  |
   | LastName    | VARCHAR(50) | Customer's last name   |
   | Email       | VARCHAR(100)| Customer's email       |
   | Phone       | VARCHAR(15) | Contact number         |
   | City        | VARCHAR(50) | City name              |
   | Country     | VARCHAR(50) | Country name           |

2. **Products** – Stores product details  
   | Column     | Type          | Description           |
   |------------|--------------|-----------------------|
   | ProductID  | INT (PK)     | Unique product ID     |
   | ProductName| VARCHAR(100) | Product name          |
   | Category   | VARCHAR(50)  | Product category      |
   | Price      | DECIMAL(10,2)| Product price         |
   | Stock      | INT          | Stock quantity        |

3. **Orders** – Stores order details  
   | Column     | Type          | Description           |
   |------------|--------------|-----------------------|
   | OrderID    | INT (PK)     | Unique order ID       |
   | CustomerID | INT (FK)     | Linked customer ID    |
   | OrderDate  | DATE         | Date of the order     |
   | TotalAmount| DECIMAL(10,2)| Total order amount    |

4. **OrderDetails** – Stores order-product relationship  
   | Column       | Type          | Description          |
   |--------------|--------------|----------------------|
   | OrderDetailID| INT (PK)     | Unique detail ID     |
   | OrderID      | INT (FK)     | Linked order ID      |
   | ProductID    | INT (FK)     | Linked product ID    |
   | Quantity     | INT          | Quantity purchased   |

---

## 📊 Sample Queries

### 1️⃣ Get all customers from India

SELECT * FROM Customers WHERE Country = 'India';
# SQL-Online-Retail-Store

2️⃣ List products with low stock (< 20)

SELECT ProductName, Stock FROM Products WHERE Stock < 20;
3️⃣ Calculate total spending by each customer

SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;
4️⃣ Find the top-selling product

SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 1;
