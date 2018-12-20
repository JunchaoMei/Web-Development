USE junchaox_lab_09;

/*
Problem:
	Display the `user_id`, `first_name last_name` & `email` of the customer who's email address contains substring '8'
*/

SELECT c.`user_id`, CONCAT(c.`first_name`,' ',c.`last_name`) AS `Customer Name`, ci.`email`
FROM `Customers` c
JOIN `Contact_Info` ci ON c.`user_id` = ci.fk_user_id
WHERE ci.`email` LIKE '%8%'
GROUP BY c.`user_id`
ORDER BY c.`user_id`;