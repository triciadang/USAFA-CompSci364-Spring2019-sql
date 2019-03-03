-- Write a query to display the first name, last name, street, city, state, and
-- zip code of any customer who purchased a Foresters Best brand top coat
-- between July 15, 2015, and July 31, 2015. If a customer purchased more than
-- one such product, display the customer's information only once in the
-- output. Sort the output by state, last name, and then first name. (Problem
-- 7.49)

SELECT DISTINCT LGCUSTOMER.CUST_FNAME, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_STREET, LGCUSTOMER.CUST_CITY, 
LGCUSTOMER.CUST_STATE, LGCUSTOMER.CUST_ZIP
FROM LGCUSTOMER, LGINVOICE, LGLINE, LGPRODUCT, LGBRAND
WHERE LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
AND LGINVOICE.INV_NUM = LGLINE.INV_NUM
AND LGLINE.PROD_SKU = LGPRODUCT.PROD_SKU
AND LGPRODUCT.BRAND_ID = LGBRAND.BRAND_ID
AND LGBRAND.BRAND_NAME = 'FORESTERS BEST'
AND LGINVOICE.INV_DATE >= '2015-07-15'
AND LGINVOICE.INV_DATE <= '2015-07-31'
ORDER BY LGCUSTOMER.CUST_STATE ASC, LGCUSTOMER.CUST_LNAME, LGCUSTOMER.CUST_FNAME;