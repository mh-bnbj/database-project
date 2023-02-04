CREATE DEFINER=`root`@`localhost` PROCEDURE `user_get_most_sold_product_week`()
BEGIN
	select product.name as name , product.type as type , product.unit as unit , count(product.Id) as soldCount
	from product
	where product.basket_Id is not null and product.basket_Id in (select buy.basket_Id
																	from buy
																	inner join bill on bill.Id = buy.bill_Id
																	where date_add(bill.generateDate,interval 7 day) > curdate());
	group by product.name
	order by count(product.Id) DESC
	limit 4;
END