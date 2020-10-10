USE kevinkarosy_guitar_shop
DELIMITER //
DROP TRIGGER IF EXISTS products_before_update//
CREATE TRIGGER products_before_update
	BEFORE UPDATE ON products
    FOR EACH ROW
BEGIN
	IF NEW.list_price>1200 THEN
		SIGNAL SQLSTATE "HY000"
			SET MESSAGE_TEXT="New list_price can't be > 1200.";
	ELSEIF NEW.list_price<100 THEN
		SIGNAL SQLSTATE "HY000"
			SET MESSAGE_TEXT="New list_price can't be < 100.";
	END IF;
END//
DELIMITER ;

UPDATE products SET list_price=99 WHERE product_id=11;