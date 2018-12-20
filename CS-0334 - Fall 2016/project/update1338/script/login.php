<?php //login.php
$db_hostname = 'localhost';
$db_database = 'junchaox_finalproject';
$db_username = 'junchaox_mei';
$db_password = '12331233mjc';

//connect to server using mysqli
$mysqli = new mysqli($db_hostname, $db_username, $db_password, $db_database);
$result = $mysqli -> query("SELECT 'Hello, Dear MySQL user!' AS _message FROM DUAL");
$row = $result -> fetch_assoc();
echo htmlentities($row['message']);
?>