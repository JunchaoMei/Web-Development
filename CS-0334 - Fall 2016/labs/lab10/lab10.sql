#View
SELECT * FROM $TableName;

#Add
INSERT INTO Customers(user_id, fk_location_id, first_name, last_name, password) VALUES ('$UserID', '$LocationID', '$FirstName', '$LastName', SHA1('$password'));

#Edit
UPDATE $TableName SET $FieldName = $NewValue WHERE $Condition;

#Search
SELECT * FROM Customers WHERE first_name = $FirstName AND last_name = $LastName;