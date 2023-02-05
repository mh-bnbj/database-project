USE `mydb`;
DROP procedure IF EXISTS `get_total_sell_Product_by_Pname`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_total_sell_Product_by_Pname` (in inputName varchar(45))
BEGIN

	select temp.pName as PN , sum(temp.pSellP) as PSP
    from (select p.name as pName , max(pr.date) as d, pr.sellPrice as pSellP
			from product as p
            inner join pricerecord as pr on pr.product_Id=p.Id
            where p.basket_Id in (select b.basket_Id
										from buy as b
										inner join bill as bl on b.bill_Id=bl.Id
                                        where date_add(bl.generateDate,interval 30 day) > curdate()) and p.name = inputName
			group by p.Id ) as temp
	group by temp.pName ;
			
END$$

DELIMITER ;

