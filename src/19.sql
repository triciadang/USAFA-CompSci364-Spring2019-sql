-- Write a query to display the brand ID, brand name, brand type, and average
-- price of products for the brand that has the largest average product price.
-- (Problem 7.63)

WITH avgprice AS(
	SELECT LGPRODUCT.BRAND_ID, LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE, AVG(LGPRODUCT.PROD_PRICE) AS avgpri
	FROM LGPRODUCT, LGBRAND
	WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
	GROUP BY LGPRODUCT.BRAND_ID, LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE)
SELECT avgprice.BRAND_ID, avgprice.BRAND_NAME, avgprice.BRAND_TYPE, MAX(avgprice.avgpri)
FROM avgprice
WHERE avgpri = (SELECT MAX(avgprice.avgpri) FROM avgprice) 
GROUP BY avgprice.BRAND_ID, avgprice.BRAND_NAME, avgprice.BRAND_TYPE;
