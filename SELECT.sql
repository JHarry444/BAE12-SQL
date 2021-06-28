DESCRIBE `users`;

INSERT INTO `users` 
(`username`, `password`, `email`, `first_name`, `last_name`) 
VALUES 
('jharry', 'not today', 'j@h.com', 'jordan', 'harrison'),
('jb', 'bloop', 'j@b.com', 'jordan', 'banbelaid');

-- * === WildCard (any value)
SELECT * FROM `users`; -- SELECT (ALL) FROM `users`; 

SELECT 
	`username`,`password`, `email`, `last_name`, `first_name` 
FROM 
	`users`;
    
SELECT * FROM `users` WHERE `id` > 1;

UPDATE `users` SET `password` = 'bl00p'; -- sets ALL passwords to bl00p
    
UPDATE `users` SET `password` = 'bl00p' WHERE `id` = 2;

-- UPDATE `users` SET `first_name` = 'Jordan' WHERE `first_name` = 'jordan';

DELETE FROM `users` WHERE `id` = 1 OR `id` = 2;

SELECT DISTINCT `first_name` FROM `users`; -- removes duplicates

SELECT * FROM `users` WHERE id = 1 OR id = 2;

SELECT * FROM 
	`users` 
WHERE 
	first_name = 'jordan' and last_name = 'harrison';
    
SELECT * FROM `users` WHERE `username` LIKE 'j%'; -- starts with 'j'
SELECT * FROM `users` WHERE `username` LIKE 'j_';
SELECT * FROM `users` WHERE `email` LIKE '___.com';

SELECT * FROM `users` ORDER BY `id` DESC;

SELECT * FROM `users` LIMIT 1;

SELECT * FROM `users` ORDER BY `id` DESC LIMIT 1; -- SELECT NEWEST USER

SELECT `first_name` AS `first name`, last_name AS `last name` from `users`;
SELECT 
	CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
    username, email 
from 
	`users`;

DESCRIBE `orders`;

INSERT INTO `orders` 
(`product_name`, `placed_by`)
 VALUES 
 ('pepsi', 99999);

SELECT * FROM `orders`;