USE `mydb`;
DROP procedure IF EXISTS `get-best3-command-by-PID`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get-best3-command-by-PID`(in inputPID int)
BEGIN
	select customer_NationalId as cNI , point as point , text as text
    from commend
    where product_Id = inputPID
    order by commend.point desc
    limit 3;
END$$

DELIMITER ;

