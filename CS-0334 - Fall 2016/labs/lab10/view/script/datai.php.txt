<?php //datai.php
// require_once 'logini.php';
//mysqli connection code
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_lab_09");
//Get values from form
$TableName	= $_POST['table_name'];

//view table
$sql="SELECT * FROM $TableName";
$result=mysqli_query($link, $sql);

//display results
if ($TableName == 'Customers')
{
	echo "user_id	fk_location_id	first_name	last_name	password</br>";
	while ($row = mysqli_fetch_assoc($result))
	{
		echo "{$row['user_id']}	";
		echo "{$row['fk_location_id']}	";
		echo "{$row['first_name']}	";
		echo "{$row['last_name']}	";
		echo "{$row['password']}	</br>";
	}//end while loop
} else if ($TableName == 'Locations')
{
	echo "location_id	street_address_1	street_address_2	city	state	postal_code	country</br>";
	while ($row = mysqli_fetch_assoc($result))
	{
		echo "{$row['location_id']}	";
		echo "{$row['street_address_1']}	";
		echo "{$row['street_address_2']}	";
		echo "{$row['city']}	";
		echo "{$row['state']}	";
		echo "{$row['postal_code']}	";
		echo "{$row['country']}	</br>";
	}//end while loop
} else
{
	echo "fk_user_id	email	home_phone	cell_phone	facebook_url</br>";
	while ($row = mysqli_fetch_assoc($result))
	{
		echo "{$row['fk_user_id']}	";
		echo "{$row['email']}	";
		echo "{$row['home_phone']}	";
		echo "{$row['cell_phone']}	";
		echo "{$row['facebook_url']}	</br>";
	}//end while loop
}//end else

/*free result set*/
    $result->close();
//close mysql
mysqli_close($link);
?>