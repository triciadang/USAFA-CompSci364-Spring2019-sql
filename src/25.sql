-- The purchasing manager is still concerned about the impact of price on
-- sales. Write a query to display the brand name, brand type, product SKU,
-- product description, and price of any products that are not a premium brand,
-- but that cost more than the most expensive premium brand products. (Problem
-- 8.27)



SELECT LGBRAND.BRAND_NAME, LGBRAND.BRAND_TYPE, LGPRODUCT.PROD_SKU, LGPRODUCT.PROD_DESCRIPT, 
LGPRODUCT.PROD_PRICE
FROM LGBRAND, LGPRODUCT
WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
AND LGPRODUCT.PROD_PRICE > (SELECT MAX(LGPRODUCT.PROD_PRICE)
						   	FROM LGPRODUCT, LGBRAND
						   	WHERE LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
							AND LGBRAND.BRAND_TYPE = 'PREMIUM');
