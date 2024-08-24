CREATE DATABASE InventoryControl;
USE InventoryControl;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT NOT NULL
);

INSERT INTO Products (ProductName, Description, Price, QuantityInStock) VALUES
('Laptop', '14 inch laptop with 16GB RAM', 1200.00, 50),
('Desk Chair', 'Ergonomic desk chair with lumbar support', 150.00, 100),
('Printer', 'Wireless color printer with scanner', 250.00, 30),
('Notebook', '80-page spiral-bound notebook', 5.00, 200),
('Winter Jacket', 'Waterproof winter jacket', 75.00, 150);


CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Devices and gadgets'),
('Furniture', 'Home and office furniture'),
('Office Supplies', 'Stationery and office supplies'),
('Clothing', 'Apparel and accessories');


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);


CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    PRIMARY KEY (ProductID, CategoryID)
);


INSERT INTO ProductCategories (ProductID, CategoryID) VALUES
(1, 1), -- Laptop is in Electronics
(2, 2), -- Desk Chair is in Furniture
(3, 1), -- Printer is in Electronics
(4, 3), -- Notebook is in Office Supplies
(5, 4); -- Winter Jacket is in Clothing


CREATE TABLE ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    PRIMARY KEY (ProductID, SupplierID)
);

INSERT INTO ProductSuppliers (ProductID, SupplierID) VALUES
(1, 1), -- Laptop supplied by TechSupplier Inc.
(2, 2), -- Desk Chair supplied by FurnitureWorld
(3, 3), -- Printer supplied by OfficeDepot
(4, 3), -- Notebook supplied by OfficeDepot
(5, 4); -- Winter Jacket supplied by FashionHub


INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail, Phone, Address) VALUES
('TechSupplier Inc.', 'John Doe', 'john.doe@techsupplier.com', '555-1234', '123 Tech Street, Tech City'),
('FurnitureWorld', 'Jane Smith', 'jane.smith@furnitureworld.com', '555-5678', '456 Furniture Ave, Furnitown'),
('OfficeDepot', 'Alice Johnson', 'alice.johnson@officedepot.com', '555-8765', '789 Office Rd, Officeville'),
('FashionHub', 'Bob Brown', 'bob.brown@fashionhub.com', '555-4321', '101 Fashion Blvd, Style City');

