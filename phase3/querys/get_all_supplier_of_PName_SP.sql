USE `mydb`;
DROP procedure IF EXISTS `get_all_supplier_of_PName`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_supplier_of_PName`(in inputPN varchar(45))
BEGIN
	select s.Id as SID , s.name as SName , s.city as SCity
    from product as p 
    inner join supplier as s on s.Id = p.supplier_Id
    where p.name = inputPN ;
END$$

DELIMITER ;

