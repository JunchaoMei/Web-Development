USE junchaox_finalproject;

CREATE TABLE `Customers` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `street_address1` VARCHAR(50) NOT NULL,
  `street_address2` VARCHAR(50) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state_province` VARCHAR(20) NOT NULL,
  `zip_postal` VARCHAR(10) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`user_id`)
  #,FOREIGN KEY (`fk_location_id`) REFERENCES `Locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Inventory` (
  `inventory_id` BIGINT NOT NULL AUTO_INCREMENT, 	
  `type` VARCHAR(20) NOT NULL,
  `brand` VARCHAR(20) NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  `size` VARCHAR(10) NOT NULL,
  `price` FLOAT NOT NULL,
  `gender_applied` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`inventory_id`)
  #,FOREIGN KEY (`fk_location_id`) REFERENCES `Locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Customers (`first_name`, `last_name`, `street_address1`, `street_address2`, `city`, `state_province`, `zip_postal`, `gender`, `email`) VALUES
('$Fname','$Lname','$street1','$street2','$city','$state','$zip','$gender','$email');