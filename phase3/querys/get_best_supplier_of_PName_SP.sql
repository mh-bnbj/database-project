USE `mydb`;
DROP procedure IF EXISTS `get_best_supplier_of_PName`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_best_supplier_of_PName`( in inputPN varchar(45))
BEGIN
	select s.id as SID , s.name as SName , min(temp.purchasePrice) as pPrice
    from product as p 
    inner join supplier as s on s.Id = p.supplier_Id
    inner join (select product_Id , purchasePrice , max(date)
				from pricerecord
                group by product_Id) as temp on temp.product_Id = p.Id
	where p.name = inputPN ;
END$$

DELIMITER ;

