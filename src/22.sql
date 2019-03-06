-- Write a query to display the customer code, first name, and last name of all
-- customers who have had at least one invoice completed by employee 83649 and
-- at least one invoice completed by employee 83677. Sort the output by
-- customer last name and then first name. (Problem 8.24)

WITH firstempinvoice AS (
	SELECT LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME
	FROM LGCUSTOMER, LGINVOICE
	WHERE LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
	AND LGINVOICE.EMPLOYEE_ID = 83649
),
secondempinvoice AS (
	SELECT LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME
	FROM LGCUSTOMER, LGINVOICE
	WHERE LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
	AND LGINVOICE.EMPLOYEE_ID = 83677
)
SELECT DISTINCT firstempinvoice.CUST_CODE, firstempinvoice.CUST_FNAME, firstempinvoice.CUST_LNAME
FROM firstempinvoice, secondempinvoice
WHERE firstempinvoice.CUST_CODE = secondempinvoice.CUST_CODE
ORDER BY firstempinvoice.CUST_LNAME ASC, firstempinvoice.CUST_FNAME;