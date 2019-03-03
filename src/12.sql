-- Write a query to display a brand name and the number of products of that
-- brand that are in the database. Sort the output by the brand name. (Problem
-- 7.51)

SELECT LGBRAND.BRAND_NAME, COUNT(BRAND_ID)
FROM LGBRAND
GROUP BY LGBRAND.BRAND_NAME;