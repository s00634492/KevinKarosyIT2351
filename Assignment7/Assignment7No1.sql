USE kevinkarosy_guitar_shop;
DELIMITER //
DROP PROCEDURE IF EXISTS remove_customer//
CREATE PROCEDURE remove_customer(customer_id_var INT)
BEGIN
    DECLARE error_occured TINYINT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error_occured=TRUE;
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;
    IF EXISTS(SELECT * FROM customers WHERE customer_id=customer_id_var FOR UPDATE) THEN

		DELETE FROM customers WHERE customer_id=customer_id_var;
		IF error_occured=TRUE THEN
			ROLLBACK;
			SELECT "Removing the customer was not successful." AS message;
		ELSE
			COMMIT;
			SELECT "Removing the customer was successful." AS message;
		END IF;
    ELSE
        SELECT "Customer does not exist." AS message;
	END IF;
END//
DELIMITER ;

INSERT INTO customers VALUES(20,"kevin@kevin.com","abc123","kevin","karosy",NULL,NULL);
CALL remove_customer(20);
