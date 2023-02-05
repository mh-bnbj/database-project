USE `mydb`;
DROP procedure IF EXISTS `get_all_comment_by_PID`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `get_all_comment_by_PID`(in inputPID int)
BEGIN
	select customer_NationalId as cNI , point as point , text as text
    from commend
    where product_Id = inputPID ;
END$$

DELIMITER ;