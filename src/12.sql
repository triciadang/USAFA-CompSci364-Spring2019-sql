-- Write a query to display a brand name and the number of products of that
-- brand that are in the database. Sort the output by the brand name. (Problem
-- 7.51)

SELECT LGBRAND.BRAND_NAME, COUNT(LGPRODUCT.BRAND_ID)
FROM LGPRODUCT, LGBRAND
WHERE LGPRODUCT.BRAND_ID = LGBRAND.BRAND_ID
GROUP BY LGBRAND.BRAND_NAME
ORDER BY LGBRAND.BRAND_NAME;