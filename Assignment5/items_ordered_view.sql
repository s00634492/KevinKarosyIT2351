CREATE OR REPLACE VIEW items_ordered AS
	SELECT category_name AS "item name",
		product_name,
		item_price,
		quantity
	FROM order_items ooo
	JOIN products ppp ON ppp.product_id = ooo.product_id
	JOIN categories ccc ON ccc.category_id = ppp.category_id;
    
SELECT * FROM items_ordered;