-- Write a query to display the brand ID, brand name, brand type, and average
-- price of products for the brand that has the largest average product price.
-- (Problem 7.63)


SELECT LGPRODUCT.BRAND_ID, LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE, AVG(LGPRODUCT.PROD_PRICE) AS avgprice
FROM LGPRODUCT, LGBRAND
WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY LGPRODUCT.BRAND_ID, LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE
ORDER BY AVG(LGPRODUCT.PROD_PRICE) DESC
LIMIT 1;
