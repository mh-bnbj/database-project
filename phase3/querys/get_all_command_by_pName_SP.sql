USE `mydb`;
DROP procedure IF EXISTS `get_all_command_by_pName`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_command_by_pName`(in inputName varchar(45))
BEGIN
	select commend.customer_NationalId as cNI , commend.point as point , commend.text as text
    from commend
    inner join product on product.Id = commend.customer_NationalId
    where product.name = inputName ;
END$$

DELIMITER ;

