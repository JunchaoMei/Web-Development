<?php //login.php
$db_hostname = 'localhost';
$db_database = 'junchaox_lab_09';
$db_username = 'junchaox_mei';
$db_password = '12331233mjc';

//connect to server using mysqli
$mysqli = new mysqli($db_hostname, $db_username, $db_password, $db_database);
$result = $mysqli -> query("SELECT 'Hello, Dear MySQL user!' AS _message FROM DUAL");
$row = $result -> fetch_assoc();
echo htmlentities($row['message']);

//COMMENTED OUT THE MYSQL CODE
//$db_server = mysql_connect($db_hostname, $db_username, $db_password)
//  or die("Unable to connect to MySQL: ".mysql_error());
  
//select the database
//mysql_select_db($db_database)
//  or die("Unable to select database: ".mysql_error());

?>