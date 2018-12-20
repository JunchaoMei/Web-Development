USE junchaox_lab_09;

/*
Problem:
	Display the `user_id`, `first_name(lower case) last_name(upper case)` of all the customers in the state 'state005' or 'state006'
*/

SELECT c.`user_id`, CONCAT(LCASE(c.`first_name`),' ',UCASE(c.`last_name`)) AS `Customer Name`
FROM `Customers` c
JOIN `Locations` l ON c.`fk_location_id` = l.location_id
WHERE l.`state` = 'state005' OR l.`state` = 'state006'
GROUP BY c.`user_id`
ORDER BY c.`user_id`;