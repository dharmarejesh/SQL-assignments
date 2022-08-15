/*Display the orders placed by customer with phone number 9876543210*/
SELECT P.ProductName AS PRODUCT_NAME, C.FirstName + ' ' + C.LastName AS CUSTOMER_NAME
FROM CUSTOMER C INNER JOIN [ORDER] O
	 ON C.ID = O.CustomerId
	 INNER JOIN ORDERITEM OI
	 ON O.ID = OI.OrderId
	 INNER JOIN PRODUCT P
	 ON P.ID = OI.ProductId
WHERE c.Phone = '9876543210'





/*Fetching all the products which are available under Category ‘Seafood’*/
ALTER TABLE PRODUCT
ADD CATAGORY NVARCHAR(40)

INSERT INTO PRODUCT
VALUES
		('OCTOPUS', 500, 'small', 'False', NULL, NULL, 'Seafood'),
		('PRAWN', 800, 'medium', 'False', NULL, NULL, 'Seafood'),
		('FISH', 300, 'medium', 'False', NULL, NULL, 'Seafood');

SELECT P.ProductName AS PRODUCT_SEAFOOD
FROM PRODUCT P
WHERE P.CATAGORY = 'SEAFOOD';





/*Display the orders placed by customers not in MUMBAI*/
SELECT P.ProductName AS PRODUCT_NAME
FROM CUSTOMER C INNER JOIN [ORDER] O
	 ON C.ID = O.CustomerId
	 INNER JOIN OrderItem OI
	 ON O.ID = OI.OrderId
	 INNER JOIN PRODUCT P
	 ON P.ID = OI.ProductId
WHERE C.CITY <> 'MUMBAI'





/*selects all the order which are placed for the product AC.*/
SELECT P.ProductName AS PRODUCT_NAME, O.OrderDate AS ORDER_DATE, O.OrderNumebr AS ORDER_NUMBER, O.TotalAmount AS TOTAL_AMOUNT
FROM [ORDER] O INNER JOIN OrderItem OI
	 ON O.ID = OI.OrderId
	 INNER JOIN PRODUCT P
	 ON P.ID = OI.ProductId
WHERE P.ProductName = 'AC'




/*Display the name , department name and Manager of any given employee*/
SELECT E.FIRST_NAME + ' ' + E.SECOND_NAME AS FULL_NAME, D.DEPT_NAME, M.[NAME] AS MANAGER_NAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
	 ON E.DEPT_ID = D.ID
	 INNER JOIN MANAGER M
	 ON E.MANAGER_ID = M.ID