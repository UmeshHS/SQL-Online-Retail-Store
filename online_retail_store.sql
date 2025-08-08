-- Online Retail Store Database Project

-- 1. Create Database
CREATE DATABASE OnlineRetailStore;
USE OnlineRetailStore;

-- 2. Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 3. Insert Sample Data
INSERT INTO Customers (FirstName, LastName, Email, Phone, City, Country) VALUES
('John', 'Doe', 'john@example.com', '9876543210', 'New York', 'USA'),
('Jane', 'Smith', 'jane@example.com', '9123456780', 'London', 'UK'),
('Rahul', 'Sharma', 'rahul@example.com', '9988776655', 'Mumbai', 'India');

INSERT INTO Products (ProductName, Category, Price, Stock) VALUES
('Laptop', 'Electronics', 750.00, 10),
('Smartphone', 'Electronics', 500.00, 25),
('Headphones', 'Accessories', 50.00, 100);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-08-01', 1250.00),
(2, '2025-08-02', 500.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 2, 1);

-- 4. Example Queries

-- Find all customers from India
SELECT * FROM Customers WHERE Country = 'India';

-- List all products with stock less than 20
SELECT ProductName, Stock FROM Products WHERE Stock < 20;

-- Get total sales for each customer
SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- Get top-selling product
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 1;
