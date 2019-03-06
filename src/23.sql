-- LargeCo is planning a new promotion in Alabama (AL) and wants to know about
-- the largest purchases made by customers in that state. Write a query to
-- display the customer code, customer first name, last name, full address,
-- invoice date, and invoice total of the largest purchase made by each
-- customer in Alabama. Be certain to include any customers in Alabama who have
-- never made a purchase; their invoice dates should be NULL and the invoice
-- totals should display as 0. (Problem 8.25)


WITH TABLE1 AS (
	SELECT LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_STREET, 
	LGCUSTOMER.CUST_CITY, LGCUSTOMER.CUST_STATE, LGCUSTOMER.CUST_ZIP, MAX(LGINVOICE.INV_TOTAL) AS LARGEST_INVOICE 
	FROM LGCUSTOMER LEFT JOIN LGINVOICE ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
	WHERE LGCUSTOMER.CUST_STATE = 'AL'
	GROUP BY LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_STREET, 
	LGCUSTOMER.CUST_CITY, LGCUSTOMER.CUST_STATE, LGCUSTOMER.CUST_ZIP
	ORDER BY LGCUSTOMER.CUST_LNAME)

SELECT distinct TABLE1.CUST_CODE, TABLE1.CUST_FNAME, TABLE1.CUST_LNAME, TABLE1.CUST_STREET, 
TABLE1.CUST_CITY, TABLE1.CUST_STATE, TABLE1.CUST_ZIP, LGINVOICE.INV_DATE, TABLE1.LARGEST_INVOICE
FROM TABLE1 LEFT JOIN LGINVOICE ON TABLE1.LARGEST_INVOICE = LGINVOICE.INV_TOTAL
AND LGINVOICE.CUST_CODE = TABLE1.CUST_CODE
GROUP BY TABLE1.CUST_CODE, TABLE1.CUST_FNAME, TABLE1.CUST_LNAME, TABLE1.CUST_STREET, 
TABLE1.CUST_CITY, TABLE1.CUST_STATE, TABLE1.CUST_ZIP, LGINVOICE.INV_DATE, TABLE1.LARGEST_INVOICE
ORDER BY TABLE1.CUST_LNAME;
	
	