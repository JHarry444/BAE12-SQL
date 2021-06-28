CREATE SCHEMA bae12;

USE bae12;

-- CONVENTIONS - THE DONE THING
-- SNAKE_CASE
-- camelCase
-- PascalCase 

-- CREATE
CREATE TABLE `users` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
	`password` VARCHAR(30) NOT NULL,
    `email` VARCHAR(30),
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30)
);

CREATE TABLE `orders` (
	`id` INT AUTO_INCREMENT,
    `product_name` VARCHAR(30) NOT NULL,
    `placed_by` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`placed_by`) REFERENCES `users` (`id`)
);

-- READ

SHOW TABLES;  -- lists tables in db
-- ctrl + / 
DESCRIBE `users`; -- describes a table

-- UPDATE

ALTER TABLE `users` ADD `phone_number` CHAR(10) NOT NULL;

DESCRIBE `users`;

-- ctrl + space === auto complete
ALTER TABLE `users` DROP COLUMN `phone_number`;

DESCRIBE `users`;

-- DELETE

DROP TABLE `users`;
