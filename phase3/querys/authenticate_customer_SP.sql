USE `mydb`;
DROP procedure IF EXISTS `authenticate_customer`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `authenticate_customer` (IN inputNI INT , IN inputPass VARCHAR(45))
BEGIN
DECLARE foundNI INT DEFAULT -1;
DECLARE foundPass VARCHAR(45);

    SELECT customer.NationalId , password
    INTO foundNI , foundPass
    FROM customer
    WHERE customer.NationalId = inputNI;
    
    IF foundNI = inputNI THEN
		IF foundPass = inputPass THEN
			SELECT "true$true" as result;
		else
			select "true$false" as result;
		end if;
	else
		select "false$false" as result;
	end if;
END$$

DELIMITER ;

