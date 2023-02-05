USE `mydb`;
DROP procedure IF EXISTS `get_total_sell_store`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_total_sell_store`()
BEGIN
	select sum(p.finalAmount) as totalSell
    from buy
    inner join bill on buy.bill_Id = bill.Id
    inner join paymentmethod as p on p.TracingCode = buy.paymentMethod_TracingCode
    where date_add(bill.generateDate,interval 30 day) > curdate() ;
END$$

DELIMITER ;

