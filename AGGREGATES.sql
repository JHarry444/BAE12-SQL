SELECT * FROM `users`;

SELECT COUNT(*) AS num_of_users FROM `users`;

SELECT * FROM `products`;

SELECT MAX(`price`) AS `most_expensive` FROM `products`;

SELECT MIN(`price`) AS `least_expensive` FROM `products`;

SELECT MAX(`price`) - MIN(`price`) AS `price_range` FROM `products`;

SELECT SUM(`price`) AS `sum_price` FROM `products`;

SELECT AVG(`price`) AS `average_price` FROM `products`;

SELECT COUNT(*) AS `frequency`, `first_name` FROM `users` GROUP BY `first_name`;

SELECT `price` as `poodles` from `products` where `price` > 100;
-- alias is evaluated AFTER the WHERE 
SELECT COUNT(*) AS `frequency`, `first_name` FROM `users` GROUP BY `first_name` HAVING `frequency` = 1;
--  Aggregates are also evaluated AFTER the WHERE so we have to use HAVING instead
