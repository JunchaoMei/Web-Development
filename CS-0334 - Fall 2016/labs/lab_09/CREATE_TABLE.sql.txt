USE junchaox_lab_09;

CREATE TABLE `Locations` (
  `location_id` VARCHAR(20) NOT NULL, 	
  `street_address_1` VARCHAR(50) NOT NULL,    
  `street_address_2` VARCHAR(50) NOT NULL,   
  `city` VARCHAR(20) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `postal_code` VARCHAR(10) NOT NULL,
  `country` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Customers` (
  `user_id` VARCHAR(20) NOT NULL, 	
  `fk_location_id` VARCHAR(20) NOT NULL,    
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`fk_location_id`) REFERENCES `Locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Contact_Info` (
  `fk_user_id` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,    
  `home_phone` VARCHAR(20) NOT NULL,
  `cell_phone` VARCHAR(20) NOT NULL,
  `facebook_url` VARCHAR(100) NOT NULL,
  FOREIGN KEY (`fk_user_id`) REFERENCES `Customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;