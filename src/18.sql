-- Write a query to display the employee number, last name, first name, and sum
-- of invoice totals for all employees who completed an invoice. Sort the
-- output by employee last name and then by first name. (Problem 7.61)

SELECT LGEMPLOYEE.EMP_NUM, LGEMPLOYEE.EMP_LNAME, LGEMPLOYEE.EMP_FNAME, SUM(LGINVOICE.INV_TOTAL) AS totalinvoices
FROM LGEMPLOYEE, LGINVOICE
WHERE LGEMPLOYEE.EMP_NUM = LGINVOICE.EMPLOYEE_ID
GROUP BY LGEMPLOYEE.EMP_NUM
ORDER BY LGEMPLOYEE.EMP_LNAME ASC, LGEMPLOYEE.EMP_FNAME;



