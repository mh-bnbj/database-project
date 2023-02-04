USE `mydb`;
DROP procedure IF EXISTS `user_get_all_off_Product_test`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `user_get_all_off_Product_test`()
BEGIN
    select "12345" as id,"noshabe" as name,"addad" as unit,"2022-2-2" as manDate,"35" as discount ,null as exDate ,"drink" as type,"2022-2-4" as date,"2500" as price;
END$$

DELIMITER ;

