USE `mydb`;
DROP procedure IF EXISTS `user_get_all_off_Product`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_get_all_off_Product`()
BEGIN
    select product.Id,product.name,product.unit,product.manufactureDate,product.discount,product.expirationDate,product.type,MAX(pricerecord.date),pricerecord.sellPrice
	from product
	inner join pricerecord on product.Id=pricerecord.product_Id
	where product.basket_Id IS NULL and product.discount>15
	GROUP BY product.Id ;
END$$

DELIMITER ;

