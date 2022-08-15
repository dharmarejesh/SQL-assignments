CREATE DATABASE TRAINING;

USE TRAINING

CREATE TABLE Customer
(
	ID INT IDENTITY(1,9) PRIMARY KEY,
	FirstName NVARCHAR(40) NOT NULL,
	LastName NVARCHAR(40),
	City NVARCHAR(40),
	Country NVARCHAR(40),
	Phone NVARCHAR(40)
);

CREATE TABLE [Order]
(
	ID INT IDENTITY(150,1) PRIMARY KEY,
	OrderDate DATETIME NOT NULL,
	OrderNumebr NVARCHAR(10),
	CustomerId INT,
	TotalAmount DECIMAL(12,2)

	CONSTRAINT FK_CUSTOMER_ID_ORDER
	FOREIGN KEY (CustomerId) 
	REFERENCES CUSTOMER(ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Product
(
	ID INT IDENTITY(1000, 1) PRIMARY KEY,
	ProductName NVARCHAR(50),
	UnitPrice DECIMAL(12,2),
	Package NVARCHAR(30),
	IsDiscontinued BIT
);

CREATE TABLE OrderItem
(
	ID INT IDENTITY(500,1) PRIMARY KEY,
	OrderId INT,
	ProductId INT,
	UnitPrice DECIMAL(12,2),
	Quantity INT

	CONSTRAINT FK_ORDER_ID_ORDER_ITEM
	FOREIGN KEY (OrderId)
	REFERENCES [Order](ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT FK_PRODUCT_ID_ORDER_ITEM
	FOREIGN KEY (ProductId)
	REFERENCES Product(ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE INDEX IndexCustomerName ON Customer(ID);
CREATE INDEX IndexOrderCustomerId ON [Order](CustomerId);
CREATE INDEX IndexOrderOrderDate ON [Order](OrderDate);
CREATE INDEX IndexProductSupplierId ON Product(ID);
CREATE INDEX IndexProductName ON Product(ProductName);
CREATE INDEX IndexOrderItemOrderId ON OrderItem(OrderId);
CREATE INDEX IndexOrderItemProductId ON OrderItem(ProductId);

INSERT INTO Customer
VALUES
		('Ajay', 'Jadeja', 'Mumbai', 'India', '9876543210'),
		('Josh', 'Butler', 'Taunton', 'England', '3544218756'),
		('Ishan', 'Kishan', 'Delhi', 'India', '9876432150'),
		('Anil', 'Kumble', 'Bangalore', 'India', '1564789022'),
		('Devid', 'Warner', 'Eastern Sydney', 'Australia', '7894563020');

INSERT INTO Product
VALUES 
		('Smart Phone', 19000, 'Small', 'False'),
		('CRT TV', 10000, 'Large', 'True'),
		('Led TV', 15000, 'Medium', 'False'),
		('Smart TV',30000, 'Medium', 'False'),
		('AC', 40000, 'Large', 'False');

INSERT INTO [Order]
VALUES
		('2022-07-20 15:11:50:099', 'Ord123456', 1 , 22000),
		('2022-07-19 12:12:40:088', 'Ord123467', 10 , 18000),
		('2022-07-18 10:10:10:010', 'Ord123479', 37 , 36100),
		('2022-07-17 09:09:09:009' , 'Ord123501', 28 , 50000),
		('2022-07-16 08:08:08:008', 'Ord123994', 1, 36100),
		('2022-07-15 07:07:07:007', 'Ord124400', 10 , 50000),
		('2022-07-14 06:06:06:006', 'Ord125650', 19 , 50000),
		('2022-07-13 05:05:05:005', 'Ord126005', 37 , 50000),
		('2022-07-12 04:04:04:004', 'Ord123334', 28 , 18000),
		('2022-07-11 03:03:03:003', 'Ord123975', 1 , 18000);


INSERT INTO OrderItem
VALUES 
		(150, 1000, 19000.00, 1),
		(151, 1000, 15000.00, 1),
		(152, 1000, 30000.00, 1),
		(153, 1000, 40000.00, 1),
		(154, 1000, 30000.00, 1),
		(155, 1000, 40000.00, 1),
		(156, 1000, 40000.00, 1),
		(157, 1000, 40000.00, 1),
		(158, 1000, 15000.00, 1),
		(159, 1000, 15000.00, 1);


/*DISPLAY ALL CUSTOMER DETAILS*/
SELECT *
FROM Customer;


/*Display Country whose name starts with A or I*/
SELECT COUNTRY
FROM CUSTOMER
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'I%';


/*Display whose name of customer whose third character is i*/
SELECT FirstName, LastName
FROM CUSTOMER
WHERE FirstName LIKE '__I%';


/*
SELECT * FROM CUSTOMER;
SELECT * FROM PRODUCT;
SELECT * FROM [ORDER];
SELECT * FROM ORDERITEM;

TRUNCATE TABLE [ORDER]
TRUNCATE TABLE CUSTOMER

DROP TABLE OrderItem
DROP TABLE [Order]
DROP TABLE Customer
DROP TABLE Product
*/