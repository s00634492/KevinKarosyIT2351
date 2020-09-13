SELECT category_name AS "Category Name",
	COUNT(*) AS number_of_products,
	MAX(list_price) AS "Most Expensive Product"
FROM products ppp
JOIN categories ccc
	ON ppp.category_id = ccc.category_id
GROUP BY ppp.category_id
ORDER BY number_of_products DESC;
