USE `mydb`;
DROP procedure IF EXISTS `user_get_customer`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_get_customer`(in inputNI int)
BEGIN
	select customer.firstName as fname , customer.lastName as lname , customer.city as city , customer.password as password
    from customer
    where customer.NationalId = inputNI;
END$$

DELIMITER ;

