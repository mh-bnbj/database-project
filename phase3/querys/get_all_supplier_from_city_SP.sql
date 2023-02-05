USE `mydb`;
DROP procedure IF EXISTS `get_all_supplier_from_city`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_supplier_from_city` ( in inputCity varchar(45))
BEGIN
	select s.id as id , s.name as name , s.phoneNumber as pN
    from supplier as s
    where s.city = inputCity ;
END$$

DELIMITER ;

