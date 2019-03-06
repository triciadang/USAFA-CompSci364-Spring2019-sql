-- One of the purchasing managers is interested in the impact of product prices
-- on the sale of products of each brand. Write a query to display the brand
-- name, brand type, average price of products of each brand, and total units
-- sold of products of each brand. Even if a product has been sold more than
-- once, its price should only be included once in the calculation of the
-- average price. However, you must be careful because multiple products of the
-- same brand can have the same price, and each of those products must be
-- included in the calculation of the brand's average price. (Problem 8.26)

WITH distinctbrandbuys AS (
	SELECT DISTINCT LGBRAND.BRAND_ID
	FROM LGBRAND
),
brandprice AS (
	SELECT distinctbrandbuys.BRAND_ID, LGPRODUCT.PROD_PRICE
	FROM distinctbrandbuys right join LGPRODUCT on distinctbrandbuys.BRAND_ID = LGPRODUCT.BRAND_ID
	),
sumqty AS (
	SELECT LGBRAND.BRAND_ID, SUM(LGLINE.LINE_QTY) AS UNITS_SOLD
	FROM LGBRAND, LGPRODUCT, LGLINE
	WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
	AND LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
	GROUP BY LGBRAND.BRAND_ID,LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE
)

SELECT LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE, AVG(brandprice.PROD_PRICE) as "AVERAGE PRICE", sumqty.UNITS_SOLD AS "UNITS SOLD"
FROM LGBRAND, LGPRODUCT, LGLINE, brandprice, sumqty
WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
AND	brandprice.BRAND_ID = LGBRAND.BRAND_ID
AND sumqty.BRAND_ID = brandprice.BRAND_ID
AND LGLINE.PROD_SKU = LGPRODUCT.PROD_SKU
GROUP BY LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE, sumqty.UNITS_SOLD
ORDER BY LGBRAND.BRAND_NAME;
