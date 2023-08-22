CREATE DATABASE bakery;

CREATE TABLE bakery.tbl_contact(
id int NOT NULL AUTO_INCREMENT,
fullName varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
email varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
message varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
Status tinyint(1) DEFAULT '1',
PRIMARY KEY (ID)
);

CREATE TABLE bakery.tbl_product_category(
id int NOT NULL AUTO_INCREMENT,
name nvarchar(100) NOT NULL,
description nvarchar(100),
status tinyint(1) DEFAULT '1',
parent_id int DEFAULT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
seo varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
PRIMARY KEY (id)
);

CREATE TABLE bakery.tbl_products(
id int NOT NULL AUTO_INCREMENT,
name nvarchar(100) NOT NULL,
price decimal(13,0) NOT NULL,
price_sale decimal(13,0) DEFAULT NULL,
short_description varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
detail_description longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
avatar varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
category_id int DEFAULT NULL,
status tinyint(1) DEFAULT '1',
parent_id int DEFAULT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
seo varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
is_hot tinyint(1) DEFAULT '0',
PRIMARY KEY (`id`),
CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_product_category` (`cate_id`) ON DELETE RESTRICT
);

CREATE TABLE bakery.tbl_product_images(
id int NOT NULL AUTO_INCREMENT,
name varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
path varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
product_id int NOT NULL,
status tinyint(1) DEFAULT '1',
parent_id int DEFAULT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
PRIMARY KEY (id),
CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
);

CREATE TABLE bakery.tbl_saleoder(
id int NOT NULL AUTO_INCREMENT,
code varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
user_id int DEFAULT NULL,
total decimal(13,2) DEFAULT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
customer_name varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
customer_address varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
seo varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
customer_phone varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
customer_email varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
PRIMARY KEY (id)
);

CREATE TABLE bakery.tbl_saleoder_product(
id int NOT NULL AUTO_INCREMENT,
saleoder_id int NOT NULL,
product_id int NOT NULL,
quanlity int NOT NULL,
cteated_by int DEFAULT NULL,
created_date datetime DEFAULT NULL,
updated_by int DEFAULT NULL,
updated_date datetime DEFAULT NULL,
status tinyint(1) DEFAULT '1',
PRIMARY KEY (`id`),
KEY `fk_saleorder_product_idx` (`saleoder_id`),
KEY `fk_product_saleorder_idx` (`product_id`),
CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`product_id`) REFERENCES `tbl_Products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleoder_id`) REFERENCES `tbl_saleoder` (id)
);