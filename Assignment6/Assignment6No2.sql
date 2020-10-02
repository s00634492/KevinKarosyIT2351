
-- DELETE FROM categories WHERE category_name="Flute";

USE kevinkarosy_guitar_shop;
DELIMITER //
DROP PROCEDURE IF EXISTS InsertCategory//
CREATE PROCEDURE InsertCategory()
	BEGIN
		DECLARE flute_exists TINYINT DEFAULT FALSE;
        BEGIN
			DECLARE EXIT HANDLER FOR 1062 SET flute_exists = TRUE;
			INSERT INTO categories (category_name) VALUES ("Flute");
		END;
        IF flute_exists = TRUE THEN
			SELECT "Row was not inserted - duplicate entry." AS message;
		ELSE
			SELECT "1 row was inserted." AS message;
		END IF;
    END//
DELIMITER ;
CALL InsertCategory();

-- SELECT * FROM categories;