USE `mydb`;
DROP procedure IF EXISTS `get_all_customer`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_customer` ()
BEGIN
	select * from customer;
END$$

DELIMITER ;
