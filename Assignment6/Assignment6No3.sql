DELIMITER //
DROP FUNCTION IF EXISTS item_price//
CREATE FUNCTION item_price
	(item_id_var INT)
	RETURNS DECIMAL(10,2)
    DETERMINISTIC READS SQL DATA
	BEGIN
		RETURN
			(SELECT item_price - discount_amount
			FROM order_items
			WHERE item_id = item_id_var
			);
    END//
DELIMITER ;
SELECT item_id, item_price, discount_amount,
	item_price(item_id) AS "Discounted Price"
    FROM order_items;