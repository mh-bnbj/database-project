USE `mydb`;
DROP procedure IF EXISTS `user_set_customer`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_set_customer` (in NI int , in fN varchar(50) , in lN varchar(45) , in c varchar(45) , in pass varchar(45))
BEGIN
	update customer
    set firstName = fN , lastName = lN , city = c , password = pass
    where NationalId = NI;
END$$

DELIMITER ;

