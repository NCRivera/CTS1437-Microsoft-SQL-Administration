CREATE TABLE PRODUCT_MANUFACTURERS(
    MANUFACTURER_ID INT PRIMARY KEY,
	BUSINESS_NAME CHARACTER(50)); -- Creating a table called Product Manufacturers. 

INSERT INTO PRODUCT_MANUFACTURERS(MANUFACTURER_ID, BUSINESS_NAME)
VALUES 	(91, 'THE PEN MAKERS INC.'),
		(92, 'THE ERASER MAKERS INC.'),
		(93, 'THE NOTEBOOK MAKERS INC.'); -- I'm inserting data into the table I just made.


CREATE TABLE PRODUCT_NAMES(
	PRODUCT_NAME_ID INT,
	PRODUCT_NAME CHARACTER(50),
	MANUFACTURER_ID INT FOREIGN KEY REFERENCES PRODUCT_MANUFACTURERS(MANUFACTURER_ID)); -- I'm creating a table called product names.

SELECT * FROM PRODUCT_NAMES; -- Now I'm calling the table I just created.

INSERT INTO PRODUCT_NAMES VALUES (1001, 'X Pen', 91), (1002, 'Y Eraser', 92), (1003, 'Z Notebook', 93) -- Now I'm inserting a row of values into the table created.
