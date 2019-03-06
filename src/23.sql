-- LargeCo is planning a new promotion in Alabama (AL) and wants to know about
-- the largest purchases made by customers in that state. Write a query to
-- display the customer code, customer first name, last name, full address,
-- invoice date, and invoice total of the largest purchase made by each
-- customer in Alabama. Be certain to include any customers in Alabama who have
-- never made a purchase; their invoice dates should be NULL and the invoice
-- totals should display as 0. (Problem 8.25)


WITH maxInvoice AS (
	SELECT LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_STREET, 
	LGCUSTOMER.CUST_CITY, LGCUSTOMER.CUST_STATE, LGCUSTOMER.CUST_ZIP, MAX(LGINVOICE.INV_TOTAL) AS LARGEST_INVOICE 
	FROM LGCUSTOMER LEFT JOIN LGINVOICE ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
	WHERE LGCUSTOMER.CUST_STATE = 'AL'
	GROUP BY LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_STREET, 
	LGCUSTOMER.CUST_CITY, LGCUSTOMER.CUST_STATE, LGCUSTOMER.CUST_ZIP
	ORDER BY LGCUSTOMER.CUST_LNAME)

SELECT distinct maxInvoice.CUST_CODE, maxInvoice.CUST_FNAME, maxInvoice.CUST_LNAME, maxInvoice.CUST_STREET, 
maxInvoice.CUST_CITY, maxInvoice.CUST_STATE, maxInvoice.CUST_ZIP, LGINVOICE.INV_DATE, maxInvoice.LARGEST_INVOICE AS "LARGEST INVOICE"
FROM maxInvoice LEFT JOIN LGINVOICE ON maxInvoice.LARGEST_INVOICE = LGINVOICE.INV_TOTAL
AND LGINVOICE.CUST_CODE = maxInvoice.CUST_CODE
GROUP BY maxInvoice.CUST_CODE, maxInvoice.CUST_FNAME, maxInvoice.CUST_LNAME, maxInvoice.CUST_STREET, 
maxInvoice.CUST_CITY, maxInvoice.CUST_STATE, maxInvoice.CUST_ZIP, LGINVOICE.INV_DATE, maxInvoice.LARGEST_INVOICE
ORDER BY maxInvoice.CUST_LNAME;
	
	