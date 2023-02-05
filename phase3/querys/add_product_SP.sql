USE `mydb`;
DROP procedure IF EXISTS `add_product`;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `add_product`(IId int,
  Iname varchar(45),
  Iunit varchar(45),
  ImanufactureDate date,
  IpurchaseDate date,
  Ibasket_Id int,
  Istock_Id int,
  Isupplier_Id int,
  Idiscount int,
  IexpirationDate date,
  Itype varchar(45))
BEGIN

INSERT INTO `mydb`.`product`
(`Id`,
`name`,
`unit`,
`manufactureDate`,
`purchaseDate`,
`basket_Id`,
`stock_Id`,
`supplier_Id`,
`discount`,
`expirationDate`,
`type`)
VALUES
(IId,
Iname,
Iunit,
ImanufactureDate,
IpurchaseDate,
Ibasket_Id,
Istock_Id,
Isupplier_Id,
Idiscount,
IexpirationDate,
Itype);

END$$

DELIMITER ;

