/*Customer Details who is from Germany*/
INSERT INTO Customer
VALUES 
		('Rohan', 'Sharma', 'Berlin', 'Germany', '8796453210');

SELECT *
FROM Customer
WHERE Country = 'Germany';


/*DISPLAY FULL NAME OF EMPLOYEES*/
CREATE TABLE MANAGER
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[NAME] NVARCHAR(40)
);

CREATE TABLE DEPARTMENT
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	DEPT_NAME NVARCHAR(40)
);

CREATE TABLE EMPLOYEE
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	FIRST_NAME NVARCHAR(40),
	SECOND_NAME NVARCHAR(40),
	DEPT_ID INT,
	MANAGER_ID INT

	CONSTRAINT FK_DEPT_ID_EMPLOYEE
	FOREIGN KEY (DEPT_ID)
	REFERENCES DEPARTMENT(ID),

	CONSTRAINT FK_MANAGER_ID_EMPLOYEE
	FOREIGN KEY (MANAGER_ID)
	REFERENCES MANAGER(ID)
);

INSERT INTO MANAGER
VALUES
		('Akash Sharma'),
		('Varun Raj'),
		('Rishi Kumar');

INSERT INTO DEPARTMENT
VALUES 
		('IT'),
		('HR'),
		('PAYROLL');

INSERT INTO EMPLOYEE
VALUES
		('ISAN', 'BAIN', 1 , 2),
		('DIA', 'ROY', 2, 3),
		('RAMA', 'DAS', 3, 1)

SELECT E.FIRST_NAME + ' ' + E.SECOND_NAME AS FULL_NAME
FROM EMPLOYEE E;
 


/*-------------------------------------------------------*/
/*Display the full name*/ 
SELECT (FirstName + ' ' + LastName) AS FULL_NAME
FROM CUSTOMER


/*---------------------------------------------------------*/
/*Display the Customer Details who has fax*/
ALTER TABLE Customer
ADD Fax nvarchar(20);

UPDATE Customer
SET Fax = '1234567890'
WHERE FirstName = 'Ajay';

UPDATE Customer
SET Fax = '5647893210'
WHERE FirstName = 'Rohan';

SELECT *
FROM Customer
WHERE Fax IS NOT NULL;




/*------------------------------------------------------------------------*/
/*Customer Details whose name holds 2nd letter U*/
INSERT INTO Customer
VALUES ('Sunil', 'Gavaskar', 'Mumbai', 'India', '4567893215', '7894563698');

SELECT *
FROM Customer
WHERE FirstName LIKE '_U%';





/*--------------------------------------------------------------------------*/
/*ORDER Details where unit price is 10000-20000*/USE TRAINING
SELECT *
FROM [Order] a, OrderItem b
WHERE a.ID = b.OrderId AND (b.UnitPrice >= 10000 AND b.UnitPrice  <= 20000)




/*---------------------------------------------------------------------------*/
/*ARRANGE ORDER DETAILS BY SHIPPING DATE*/
ALTER TABLE [ORDER]
ADD ShippingDate DATE;

UPDATE [ORDER]
SET ShippingDate = '2022-07-15'
WHERE OrderDate = '2022-07-12 04:04:04.003'

UPDATE [ORDER]
SET ShippingDate = '2022-07-20'
WHERE OrderDate = '2022-07-17 09:09:09.010'

UPDATE [ORDER]
SET ShippingDate = '2022-07-21'
WHERE OrderDate = '2022-07-19 12:12:40.087'

UPDATE [ORDER]
SET ShippingDate = '2022-07-20'
WHERE OrderDate = '2022-07-18 10:10:10.010'

UPDATE [ORDER]
SET ShippingDate = '2022-07-21'
WHERE OrderDate = '2022-07-20 15:11:50.100'

SELECT *
FROM [ORDER]
WHERE ShippingDate IS NOT NULL
ORDER BY ShippingDate DESC;




/*----------------------------------------------------------------------*/
/*PRINT ORDER DETAILS SHIPPED BETWEEN 2 DATES*/
SELECT *
FROM [ORDER]
WHERE ShippingDate BETWEEN '2022-07-18' AND '2022-07-20';




/*----------------------------------------------------------------------*/
/*PRINT THE PRODUCTS SUPPLIED BY 'EXOTIC LIQUIDS'*/
CREATE TABLE SUPPLIER
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SUPPLIER_NAME NVARCHAR(40)
);

ALTER TABLE PRODUCT
ADD SUPPLIER_ID INT CONSTRAINT FK_SUPPLIER_PRODUCT FOREIGN KEY REFERENCES SUPPLIER(ID)

INSERT INTO SUPPLIER
VALUES
		('EXOTIC LIQUIDS'),
		('PANASONIC');

UPDATE Product
SET SUPPLIER_ID = 1
WHERE ProductName = 'SMART TV' OR ProductName = 'SMART PHONE'

SELECT P.ProductName AS PRODUCT_NAME, S.SUPPLIER_NAME
FROM Product P INNER JOIN SUPPLIER S ON P.SUPPLIER_ID = S.ID



/*----------------------------------------------------------------------------------*/
/*PRINT AVG QUANTITY ORDERED EVERY PRODUCT*/
SELECT AVG(Quantity) AS AVERAGE
FROM OrderItem


/*-----------------------------------------------------------------------------------*/
/*PRINT ALL EMPLOYEES WITH MANAGER NAME*/
SELECT E.FIRST_NAME + ' ' + E.SECOND_NAME AS FULL_NAME, M.[NAME] AS MANAGER_NAME
FROM EMPLOYEE E INNER JOIN MANAGER M ON E.DEPT_ID = M.ID




/*-----------------------------------------------------------------------------------*/
/*DISPLAY BILL OF A GIVEN ORDER ID*/
SELECT P.ProductName AS PRODUCT_NAME, O.TotalAmount*0.90 AS AFTER_DISCOUNT_PAYABLE
FROM PRODUCT P,ORDERITEM OI, [ORDER] O
WHERE O.ID = 154 AND OI.OrderId = 154 AND P.ID = OI.ProductId



/*PRINT TOTAL PRICE OF ORDERS WHICH HAVE THE PRODUCTS SUPPLIED BY 'EXOTIC LIQUIDS' IF 
THE PRICE IS > 40000 AND ALSO PRINT IT BY COMPANY'S NAME*/
CREATE TABLE SIPPING
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	SHIPPING_NAME NVARCHAR(40)
);

ALTER TABLE PRODUCT
ADD SHIPPING_ID INT;

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_SHIPPING_ID_PRODUCT
	FOREIGN KEY (SHIPPING_ID)
	REFERENCES SHIPPING(ID);

INSERT INTO SIPPING
VALUES
		('La come dabondance');

UPDATE Product
SET SHIPPING_ID = 1
WHERE PRODUCT.ID = 1000 OR PRODUCT.ID = 1003 OR PRODUCT.ID = 1004


SELECT DISTINCT P.ProductName, SUM(O.TotalAmount) AS TOTAL_PRICE
FROM SUPPLIER S INNER JOIN Product P 
	 ON S.ID = P.SUPPLIER_ID INNER JOIN OrderItem OI 
	 ON P.ID = OI.ProductId INNER JOIN [Order] O ON O.ID = OI.OrderId
WHERE O.TotalAmount > 30000
GROUP BY P.ProductName;




SELECT * FROM PRODUCT