CREATE DEFINER=`root`@`localhost` PROCEDURE `user_get_all_Product`()
BEGIN
    select product.Id,product.name,product.unit,product.manufactureDate,product.discount,product.expirationDate,product.type,MAX(pricerecord.date),pricerecord.sellPrice
	from product
	inner join pricerecord on product.Id=pricerecord.product_Id
	where product.basket_Id IS NULL
	GROUP BY product.Id ;
    
END