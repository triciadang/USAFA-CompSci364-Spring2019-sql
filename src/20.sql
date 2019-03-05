-- Write a query to display the invoice number, line numbers, product SKUs,
-- product descriptions, and brand ID for sales of sealer and top coat products
-- of the same brand on the same invoice with the sealer information appearing
-- before top coat. Sort the results by invoice number, sealer line number, and
-- top coat line number in ascending order. (Problem 8.22)

SELECT LGLINE.INV_NUM, LGLINE.LINE_NUM, LGPRODUCT.PROD_SKU, LGPRODUCT.PROD_DESCRIPT, LGPRODUCT.BRAND_ID
FROM LGLINE, LGLINE AS LGLINE2, LGPRODUCT, LGPRODUCT AS LGPRODUCT2
WHERE LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
AND LGLINE.INV_NUM = LGLINE2.INV_NUM
AND LGLINE.LINE_NUM = LGLINE2.LINE_NUM
AND LGPRODUCT.BRAND_ID = LGPRODUCT2.BRAND_ID
AND LGPRODUCT.PROD_CATEGORY = 'Sealer' 
OR LGPRODUCT.PROD_CATEGORY = 'Top Coat' 
GROUP BY LGLINE.INV_NUM, LGLINE.LINE_NUM, LGPRODUCT.PROD_SKU, LGPRODUCT.PROD_DESCRIPT, LGPRODUCT.BRAND_ID
ORDER BY LGPRODUCT.PROD_CATEGORY ASC, LGLINE.INV_NUM ASC, LGLINE.LINE_NUM;