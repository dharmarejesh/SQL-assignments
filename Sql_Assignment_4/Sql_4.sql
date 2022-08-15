/*1.	Print the Total price of orders which have the products supplied by 
'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name*/

/*DONE IN ASSIGNMENT 2*/


/*------------------------------------------------------------------------------------------*/
/*Display the employee details whose joined at first*/
SELECT TOP 1 E.ID, E.FIRST_NAME + ' ' + E.SECOND_NAME AS FULL_NAME, D.DEPT_NAME, M.[NAME] AS MANAGER_NAME, E.DOJ
FROM EMPLOYEE E INNER JOIN DEPARTMENT D 
	 ON E.DEPT_ID = D.ID
	 INNER JOIN MANAGER M
	 ON E.MANAGER_ID = M.ID
ORDER BY DOJ;


/*------------------------------------------------------------------------------------------*/
/*Display the employee details whose joined at recently */
SELECT TOP 1 E.ID, E.FIRST_NAME + ' ' + E.SECOND_NAME AS FULL_NAME, D.DEPT_NAME, M.[NAME] AS MANAGER_NAME, E.DOJ
FROM EMPLOYEE E INNER JOIN DEPARTMENT D 
	 ON E.DEPT_ID = D.ID
	 INNER JOIN MANAGER M
	 ON E.MANAGER_ID = M.ID
ORDER BY DOJ DESC;



/*------------------------------------------------------------------------------------------*/
/*Write a query to get most expensive and least expensive Product list (name and unit price).*/
SELECT P.ProductName AS PRODUCT_NAME, P.UnitPrice AS UNIT_PRICE
FROM PRODUCT P
ORDER BY P.UnitPrice DESC;




/*------------------------------------------------------------------------------------------*/
/*Display the list of products that are out of stock*/
SELECT P.ProductName AS PRODUCT_OUT_OF_STOCK
FROM PRODUCT P
WHERE P.IsDiscontinued = 'TRUE'



/*------------------------------------------------------------------------------------------*/
/*Display the list of products whose unit in stock is less than unit on order */
ALTER TABLE PRODUCT
ADD ProductInStock INT

/*ALL VALUES INSERTED VIA GUI*/
SELECT DISTINCT P.ProductName AS PRODUCT_NAME
FROM PRODUCT P INNER JOIN ORDERITEM OI
	 ON P.ID = OI.ProductId
WHERE P.ProductInStock < (SELECT  SUM(O.Quantity)
						  FROM ORDERITEM O
						  WHERE O.ProductId = P.ID
						  )

						  
/*------------------------------------------------------------------------------------------*/
/*Display list of categories and suppliers who supply products within those categories*/
SELECT DISTINCT P.CATAGORY, S.SUPPLIER_NAME
FROM PRODUCT P
	 INNER JOIN SUPPLIER S
	 ON P.SUPPLIER_ID = S.ID




/*------------------------------------------------------------------------------------------*/
/*Display complete list of customers, the OrderID and date of any orders they have made*/
SELECT C.FirstName + ' ' + C.LastName AS FULL_NAME, O.ID AS ORDER_ID, O.OrderDate AS ORDER_DATE
FROM CUSTOMER C INNER JOIN [ORDER] O
	 ON C.ID = O.CustomerId



/*------------------------------------------------------------------------------------------*/
/*Write  query that determines the customer who has placed the maximum number of orders*/
SELECT TOP 1 C.FirstName , COUNT(O.CustomerId) AS NUMBER_OF_ORDERS
FROM CUSTOMER C INNER JOIN [ORDER] O
	 ON C.ID = O.CustomerId
GROUP BY C.FirstName
ORDER BY NUMBER_OF_ORDERS DESC;



/*------------------------------------------------------------------------------------------*/
/*Display the customerid whose name has substring ‘RA’*/
INSERT INTO CUSTOMER
VALUES 
		('RAHUL', 'DRAVIR', 'DELHI', 'INDIA', '7894589647', '1122330041'),
		('RUDRA', 'DEV SINGH', 'KOLKATA', 'INDIA', '8779964500', NULL);

SELECT C.ID AS CUSTOMER_ID
FROM CUSTOMER C
WHERE C.FirstName LIKE '%RA%';




/*------------------------------------------------------------------------------------------*/
/*Display the first word of all the company name*/
SELECT SUBSTRING(E.COMPANY, 1, CHARINDEX(' ', E.COMPANY)) 
FROM EMPLOYEE E;



SELECT *
FROM PRODUCT

SELECT *
FROM [ORDERITEM]