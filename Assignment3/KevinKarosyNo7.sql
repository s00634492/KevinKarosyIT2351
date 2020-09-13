SELECT IF(GROUPING(category_name)=1,"All Categories",category_name) AS "Category",
	IF(GROUPING(product_name)=1,"All Products",product_name) AS "Product",
	COUNT(*) AS "Quantity"
FROM order_items ooo
JOIN products ppp
	ON ooo.product_id = ppp.product_id
JOIN categories ccc
	ON ppp.category_id = ccc.category_id
GROUP BY ccc.category_name, product_name WITH ROLLUP;-- */