<?php //data.php
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_finalproject");

// Get values from form
$Fname     = $_POST['first_name'];
$Lname     = $_POST['last_name'];
$street1   = $_POST['street_address1'];
$street2   = $_POST['street_address2'];
$city      = $_POST['city'];
$state     = $_POST['state_province'];
$zip       = $_POST['zip_postal'];
$gender    = $_POST['gender'];
$email     = $_POST['email'];

// Insert data into mysql
$sql="INSERT INTO Customers (first_name, last_name, street_address1, street_address2, city, state_province, zip_postal, gender, email) VALUES ('$Fname','$Lname','$street1','$street2','$city','$state','$zip','$gender','$email')";
$result=mysqli_query($link, $sql);

//if successfully insert data into database, displays message "successful".
if($result) {
header('Location: ../thankyou.php');
}
else {
echo "ERROR";
}

//close mysqli
mysqli_close($link);
?>