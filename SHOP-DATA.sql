USE `shop_db`;

DESCRIBE users;

INSERT INTO `users` VALUES 
(1,'jharry', 'pass', 'j@h.com', 'jordan', 'harrison'),
(2,'jbiddy', 'bloop', 'j@b.com', 'jordan', 'banbelaid'),
(3, 'nick', 'arrr', 'n@p.com', 'nick', 'the pirate');

SELECT * FROM `users`;

DESCRIBE `products`;

INSERT INTO `products` (`name`, `price`) VALUES ('pepsi', 2.20), ('pepsi MAX', 2.10), ('headphones', 15), ('4k monitor', 600), ('monitor', 400);

SELECT * FROM `products`;

DESCRIBE `orders`;

INSERT INTO `orders` VALUES 
(1, '2021-04-04 14:44', 1),
(2, '2021-06-06 16:56', 1),
(3, '2021-02-27 12;34', 2);

SELECT * FROM `orders`;

INSERT INTO 
	`order_line`
(`order_id`, `prod_id`, `price`)
	VALUES 
(1, 2, 1.00),
(1, 2, 1.00),
(1, 2, 1.00),
(1, 2, 1.00),
(1, 2, 1.00),
(2, 4, 350),
(2, 5, 700),
(3, 3, 20.00);