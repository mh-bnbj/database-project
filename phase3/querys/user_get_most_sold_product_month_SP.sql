USE `mydb`;
DROP procedure IF EXISTS `user_get_most_sold_product_month`;

USE `mydb`;
DROP procedure IF EXISTS `mydb`.`user_get_most_sold_product_month`;
;

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_get_most_sold_product_month`()
BEGIN
	select product.name as name , product.type as type , product.unit as unit , count(product.Id) as soldCount
	from product
	where product.basket_Id is not null and product.basket_Id in (select buy.basket_Id
																	from buy
																	inner join bill on bill.Id = buy.bill_Id
																	where date_add(bill.generateDate,interval 30 day) > curdate())
	group by product.name
	order by count(product.Id) DESC
	limit 4;
END$$

DELIMITER ;
;

