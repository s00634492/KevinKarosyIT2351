USE kevinkarosy_guitar_shop;
DELIMITER //
DROP PROCEDURE IF EXISTS ProductCount//
CREATE PROCEDURE ProductCount()
	BEGIN
		DECLARE product_count INT;
        SELECT COUNT(*)
			INTO product_count
			FROM products;
		IF product_count >= 17 THEN
			SELECT "The number of products is greater than or equal to 17." AS message;
		ELSE
			SELECT "The number of products is less than 17." AS message;
		END IF;
    END//
DELIMITER ;
CALL ProductCount();