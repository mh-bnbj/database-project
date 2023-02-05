USE `mydb`;
DROP procedure IF EXISTS `user_get_last_buy`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_get_last_buy`(in inputNI int)
BEGIN

	select bill.generateDate as date , paymentmethod.TracingCode as payCode , paymentmethod.finalAmount as cost , buy.basket_Id as basketId
    from buy
    inner join bill on bill.Id = buy.bill_Id
    inner join paymentmethod on buy.paymentMethod_TracingCode = paymentmethod.TracingCode
    where buy.customer_NationalId = inputNI
    order by bill.generateDate desc
    limit 4;

END$$

DELIMITER ;

