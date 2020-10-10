DELIMITER //
CREATE EVENT categories_add_test_row
	ON SCHEDULE AT NOW()+INTERVAL 1 DAY
DO BEGIN
    INSERT categories VALUES (DEFAULT,"Testing");
END//
DELIMITER ;

SHOW EVENTS IN kevinkarosy_guitar_shop;