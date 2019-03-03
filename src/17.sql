-- Write a query to display the customer code, first name, last name, and sum
-- of all invoice totals for customers with cumulative invoice totals greater
-- than $1,500. Sort the output by the sum of invoice totals in descending
-- order. (Problem 7.58)

SELECT LGCUSTOMER.CUST_CODE, LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, SUM(LGINVOICE.INV_TOTAL)
FROM LGCUSTOMER, LGINVOICE
WHERE LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
GROUP BY LGCUSTOMER.CUST_CODE
HAVING SUM(LGINVOICE.INV_TOTAL) > 1500
ORDER BY SUM(LGINVOICE.INV_TOTAL) DESC;