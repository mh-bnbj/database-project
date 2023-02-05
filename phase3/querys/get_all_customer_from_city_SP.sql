USE `mydb`;
DROP procedure IF EXISTS `get_all_customer_from_city`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_customer_from_city`(in inputCity varchar(45))
BEGIN
	select c.NationalId as nI , c.firstName as fN , c.lastName as lN , c.city as city , c.password as pass
    from customer as c
    where c.city = inputCity ;
END$$

DELIMITER ;

