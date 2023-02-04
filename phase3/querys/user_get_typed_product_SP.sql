USE `mydb`;
DROP procedure IF EXISTS `user_get_typed_product`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_get_typed_product`(in inputType varchar(45))
BEGIN
	select product.Id,product.name,product.unit,product.manufactureDate,product.discount,product.expirationDate,product.type,MAX(pricerecord.date),pricerecord.sellPrice
	from product
	inner join pricerecord on product.Id=pricerecord.product_Id
	where product.basket_Id IS NULL and product.type=inputType
	GROUP BY product.Id ;
END$$

DELIMITER ;