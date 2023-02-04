USE `mydb`;
DROP procedure IF EXISTS `insert_customer`;

USE `mydb`;
DROP procedure IF EXISTS `mydb`.`insert_customer`;
;

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer`(nationalId int , firstName varchar(50) , lastName varchar(45) , type varchar(45) , city varchar(45) , password varchar(45))
BEGIN

insert into customer values (nationalId , firstName , type , lastName , city , password);

END$$

DELIMITER ;
;

