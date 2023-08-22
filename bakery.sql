CREATE DATABASE bakery;

CREATE TABLE bakery.tbl_Contact(
ID int NOT NULL AUTO_INCREMENT,
FullName varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
Email varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
Message varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
Status tinyint(1) DEFAULT '1',
PRIMARY KEY (ID)
);

CREATE TABLE bakery.tbl_ProductCategory(
CateID int NOT NULL AUTO_INCREMENT,
Name nvarchar(100) NOT NULL,
Description nvarchar(100),
Status tinyint(1) DEFAULT '1',
ParentID int DEFAULT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
Seo varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
PRIMARY KEY (CateID)
);

CREATE TABLE bakery.tbl_Products(
ProductID int NOT NULL AUTO_INCREMENT,
Name nvarchar(100) NOT NULL,
Price decimal(13,0) NOT NULL,
PriceSale decimal(13,0) DEFAULT NULL,
ShortDescription varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
DetailDescription longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
Avatar varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
CategoryID int DEFAULT NULL,
Status tinyint(1) DEFAULT '1',
ParentID int DEFAULT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
Seo varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
IsHot tinyint(1) DEFAULT '0',
PRIMARY KEY (`ProductID`),
CONSTRAINT `fk_category_products` FOREIGN KEY (`CategoryID`) REFERENCES `tbl_ProductCategory` (`CateID`) ON DELETE RESTRICT
);

CREATE TABLE bakery.tbl_Product_Images(
ID int NOT NULL AUTO_INCREMENT,
Name varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
Path varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
ProductID int NOT NULL,
Status tinyint(1) DEFAULT '1',
ParentID int DEFAULT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
PRIMARY KEY (ID),
CONSTRAINT `fk_product_images` FOREIGN KEY (`ProductID`) REFERENCES `tbl_Products` (`ProductID`)
);

CREATE TABLE bakery.tbl_Saleoder(
ID int NOT NULL AUTO_INCREMENT,
Code varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
UserID int DEFAULT NULL,
Total decimal(13,2) DEFAULT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
CustomerName varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
CustomerAddress varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
Seo varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
CustomerPhone varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
CustomerEmail varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE bakery.tbl_Saleoder_Product(
ID int NOT NULL AUTO_INCREMENT,
SaleoderID int NOT NULL,
ProductID int NOT NULL,
Quanlity int NOT NULL,
CteatedBy int DEFAULT NULL,
CreatedDate datetime DEFAULT NULL,
UpdatedBy int DEFAULT NULL,
UpdatedDate datetime DEFAULT NULL,
Status tinyint(1) DEFAULT '1',
PRIMARY KEY (`ID`),
KEY `fk_saleorder_product_idx` (`SaleoderID`),
KEY `fk_product_saleorder_idx` (`ProductID`),
CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`ProductID`) REFERENCES `tbl_Products` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`SaleoderID`) REFERENCES `tbl_Saleoder` (ID)
);