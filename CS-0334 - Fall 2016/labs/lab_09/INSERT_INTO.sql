USE junchaox_lab_09;

INSERT INTO `Locations` (`location_id`, `street_address_1`, `street_address_2`, `city`, `state`, `postal_code`, `country`)
VALUES ('location001', 'st1001', 'st2001', 'city001', 'state001', 'zip001', 'country001'),
('location002', 'st1002', 'st2002', 'city002', 'state002', 'zip002', 'country002'),
('location003', 'st1003', 'st2003', 'city003', 'state003', 'zip003', 'country003'),
('location004', 'st1004', 'st2004', 'city004', 'state004', 'zip004', 'country004'),
('location005', 'st1005', 'st2005', 'city005', 'state005', 'zip005', 'country005'),
('location006', 'st1006', 'st2006', 'city006', 'state006', 'zip006', 'country006'),
('location007', 'st1007', 'st2007', 'city007', 'state007', 'zip007', 'country007'),
('location008', 'st1008', 'st2008', 'city008', 'state008', 'zip008', 'country008'),
('location009', 'st1009', 'st2009', 'city009', 'state009', 'zip009', 'country009'),
('location010', 'st1010', 'st2010', 'city010', 'state010', 'zip010', 'country010');

INSERT INTO `Customers` (`user_id`, `fk_location_id`, `first_name`, `last_name`, `password`)
VALUES ('user001', 'location001', 'fn01', 'ln01', 'pw01'),
('user002', 'location002', 'fn02', 'ln02', 'pw02'),
('user003', 'location003', 'fn03', 'ln03', 'pw03'),
('user004', 'location004', 'fn04', 'ln04', 'pw04'),
('user005', 'location005', 'fn05', 'ln05', 'pw05'),
('user006', 'location006', 'fn06', 'ln06', 'pw06'),
('user007', 'location007', 'fn07', 'ln07', 'pw07'),
('user008', 'location008', 'fn08', 'ln08', 'pw08'),
('user009', 'location009', 'fn09', 'ln09', 'pw09'),
('user010', 'location010', 'fn10', 'ln10', 'pw10');

INSERT INTO `Contact_Info` (`fk_user_id`, `email`, `home_phone`, `cell_phone`, `facebook_url`)
VALUES ('user001', 'email001', 'hp01', 'cp01', 'fb01'),
('user002', 'email002', 'hp02', 'cp02', 'fb02'),
('user003', 'email003', 'hp03', 'cp03', 'fb03'),
('user004', 'email004', 'hp04', 'cp04', 'fb04'),
('user005', 'email005', 'hp05', 'cp05', 'fb05'),
('user006', 'email006', 'hp06', 'cp06', 'fb06'),
('user007', 'email007', 'hp07', 'cp07', 'fb07'),
('user008', 'email008', 'hp08', 'cp08', 'fb08'),
('user009', 'email009', 'hp09', 'cp09', 'fb09'),
('user010', 'email010', 'hp10', 'cp10', 'fb10');