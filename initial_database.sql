CREATE DATABASE GroceryStoreSales;
GO
USE GroceryStoreSales;
GO

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Address VARCHAR(250),
    CityName VARCHAR(45) NOT NULL,
    Zipcode DECIMAL(5,0),
    CountryName VARCHAR(45) NOT NULL,
    CountryCode VARCHAR(2) NOT NULL,
    LastPurchasedDate DATE,
    RValue FLOAT,
    FValue FLOAT,
    MValue DECIMAL(10,4),
    RScore VARCHAR(1),
    FScore VARCHAR(1),
    MScore VARCHAR(1),
    RFMScore VARCHAR(3),
    Segment VARCHAR(50),
    SegmentIndex INT,
    Color VARCHAR(7),
    Description VARCHAR(250)
);

CREATE NONCLUSTERED INDEX IDX_Customer_CityName ON Customer(CityName);
CREATE NONCLUSTERED INDEX IDX_Customer_CountryName ON Customer(CountryName);
CREATE NONCLUSTERED INDEX IDX_Customer_CountryCode ON Customer(CountryCode);
CREATE NONCLUSTERED INDEX IDX_Customer_Segment ON Customer(Segment);


CREATE TABLE Product(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(45) NOT NULL,
    Price DECIMAL(10,4),
    CategoryID INT,
    Class VARCHAR(15), -- Classification of the product
    ModifyDate DATETIME,
    Resistant VARCHAR(15), --Product resistance category
    IsAllergic BIT, --denotes whether the item contains common allergens
    VitalityDays DECIMAL(3,0),
    CategoryName VARCHAR(45) NOT NULL
);

CREATE NONCLUSTERED INDEX IDX_Product_CategoryName ON Product(CategoryID);
CREATE NONCLUSTERED INDEX IDX_Product_ProductName ON Product(ProductName);
CREATE NONCLUSTERED INDEX IDX_Product_Class ON Product(Class);

CREATE TABLE Sales(
    SalesID INT NOT NULL,
    CustomerID INT NOT NULL,
    SalesDate DATE NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(20,4),
    Discount DECIMAL(4,2),
    TotalPrice DECIMAL(10,4),
    CONSTRAINT FK_Sales_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE CLUSTERED COLUMNSTORE INDEX IDXC_Sales ON Sales;
CREATE NONCLUSTERED INDEX IDX_Sales_CustomerID ON Sales(CustomerID);
CREATE NONCLUSTERED INDEX IDX_Sales_OrderDate ON Sales(SalesDate);
CREATE NONCLUSTERED INDEX IDX_Sales_ProductID ON Sales(ProductID);


