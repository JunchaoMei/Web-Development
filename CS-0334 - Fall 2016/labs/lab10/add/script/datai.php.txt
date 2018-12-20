<?php //datai.php
// require_once 'logini.php';
//mysqli connection code
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_lab_09");
//Get values from form
$UserID		= $_POST['user_id'];
$LocationID	= $_POST['fk_location_id'];	
$FirstName	= $_POST['first_name'];	
$LastName	= $_POST['last_name'];
$password	= $_POST['password']; 
/*
if($link)
{ echo "linked!";}
echo $UserID;
echo $LocationID;
echo $FirstName;
echo $LastName;
echo $password;
*/
//insert data into mysql
$sql="INSERT INTO Customers(user_id, fk_location_id, first_name, last_name, password) VALUES ('$UserID', '$LocationID', '$FirstName', '$LastName', SHA1('$password'))";
$result=mysqli_query($link, $sql);

//if successfully insert data into database, displays message "successful".
if($result) {
header('Location: ../thankyou.php');
}
else {
echo "ERROR";
}

//close mysql
mysqli_close($link);
?>