-- The Binder Prime Company wants to recognize the employee who sold the most
-- of its products during a specified period. Write a query to display the
-- employee number, employee first name, employee last name, email address, and
-- total units sold for the employee who sold the most Binder Prime products
-- between Novemeber 1, 2015, and December 5, 2015. If there is a a tie for
-- most units sold, sort the output by employee last name. (Problem 8.23)

WITH TotalSales AS (
	SELECT LGEMPLOYEE.EMP_NUM, LGEMPLOYEE.EMP_FNAME, LGEMPLOYEE.EMP_LNAME, LGEMPLOYEE.EMP_EMAIL, LGINVOICE.EMPLOYEE_ID, SUM(LGLINE.LINE_QTY) AS saletotal  
	FROM LGEMPLOYEE, LGINVOICE, LGLINE, LGPRODUCT, LGBRAND
	WHERE LGEMPLOYEE.EMP_NUM = LGINVOICE.EMPLOYEE_ID
	AND LGINVOICE.INV_NUM = LGLINE.INV_NUM
	AND LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
	AND LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
	AND LGBRAND.BRAND_NAME = 'BINDER PRIME'
	AND LGINVOICE.INV_DATE BETWEEN '2015-11-01' AND '2015-12-05'
	GROUP BY LGEMPLOYEE.EMP_NUM, LGEMPLOYEE.EMP_FNAME, LGEMPLOYEE.EMP_LNAME, LGEMPLOYEE.EMP_EMAIL, LGINVOICE.EMPLOYEE_ID)
SELECT TotalSales.EMP_NUM, TotalSales.EMP_FNAME, TotalSales.EMP_LNAME, TotalSales.EMP_EMAIL, MAX(TotalSales.saletotal) AS TOTAL
FROM TotalSales
WHERE saletotal = (SELECT MAX(TotalSales.saletotal) FROM TotalSales)
GROUP BY TotalSales.EMP_NUM, TotalSales.EMP_FNAME, TotalSales.EMP_LNAME, TotalSales.EMP_EMAIL
ORDER BY TotalSales.EMP_LNAME;