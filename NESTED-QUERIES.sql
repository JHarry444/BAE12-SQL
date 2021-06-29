-- Who placed the most expensive order?

SELECT 
    `order_id`
FROM
    `order_line`
GROUP BY `order_id`
ORDER BY SUM(`price`) DESC
LIMIT 1;

SELECT `placed_by` FROM `orders` WHERE `id` = ?;

SELECT * FROM `users` WHERE `id` = ?;

-- CREATE VIEW `who_placed_the_most_expensive_order` AS 
SELECT 
    *
FROM
    `users`
WHERE
    `id` = (SELECT 
            `placed_by`
        FROM
            `orders`
        WHERE
            `id` = (SELECT 
                    `order_id`
                FROM
                    `order_line`
                GROUP BY `order_id`
                ORDER BY SUM(`price`) DESC
                LIMIT 1));

SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name` FROM `who_placed_the_most_expensive_order`;


-- FIND ALL ORDERS PLACED BY A JORDAN

DESCRIBE `users`;

DESCRIBE `orders`;


(SELECT `id` FROM `users` WHERE `first_name` = 'jordan');

SELECT * FROM `orders` WHERE `placed_by` = 1 OR `placed_by` = 2;
SELECT * FROM `orders` WHERE `placed_by` IN (1, 2);
SELECT * FROM `orders` WHERE `placed_by` IN
(SELECT `id` FROM `users` WHERE `first_name` = 'jordan');