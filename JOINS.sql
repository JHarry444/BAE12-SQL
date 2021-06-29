use shop_db;
SELECT 
    *
FROM
    `shop_db`.`users`;
SELECT 
    *
FROM
    `orders`;

SELECT 
    *
FROM
    `users`
        INNER JOIN
    `orders` ON `users`.`id` = `orders`.`placed_by`;

SELECT 
    *
FROM
    `users`
        LEFT OUTER JOIN
    `orders` ON `users`.`id` = `orders`.`placed_by`;

SELECT 
    *
FROM
    `users` AS `u`
        LEFT OUTER JOIN
    `orders` AS `o` ON `u`.`id` = `o`.`placed_by`;

SELECT 
    *
FROM
    `users` `u`
        LEFT OUTER JOIN
    `orders` `o` ON `u`.`id` = `o`.`placed_by`;

SELECT 
    `u`.`id` `user_id`,
    `email`,
    `username`,
    `o`.`id` `order_id`,
    `date_placed`
FROM
    `users` `u`
        LEFT OUTER JOIN
    `orders` `o` ON `u`.`id` = `o`.`placed_by`;
    
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
SELECT * FROM `who_placed_the_most_expensive_order`;

SELECT * FROM `order_line`;
    SELECT 
        *, SUM(`price`) `total_price`
    FROM
        `order_line` `ol`
            JOIN
        `orders` `o` ON `ol`.`order_id` = `o`.`id`
            JOIN
        `users` `u` ON `o`.`placed_by` = `u`.`id`
    GROUP BY `o`.`id`
    ORDER BY `total_price` DESC
    LIMIT 1;
    
