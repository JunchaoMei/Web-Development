<?php //datai.php
// require_once 'logini.php';
//mysqli connection code
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_lab_09");
//Get values from form
$FirstName	= $_POST['first_name'];	
$LastName	= $_POST['last_name'];
/*
if($link)
{ echo "linked!";}
*/
//insert data into mysql
$sql="SELECT * FROM Customers WHERE first_name = $FirstName AND last_name = $LastName";
$result=mysqli_query($link, $sql);

//if successfully insert data into database, displays message "successful".
//display results
echo "user_id	fk_location_id	first_name	last_name	password</br>";
while ($row = mysqli_fetch_assoc($result))
{
	echo "{$row['user_id']}	";
	echo "{$row['fk_location_id']}	";
	echo "{$row['first_name']}	";
	echo "{$row['last_name']}	";
	echo "{$row['password']}	</br>";
}//end while loop

//close mysql
mysqli_close($link);
?>