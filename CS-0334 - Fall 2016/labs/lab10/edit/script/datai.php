<?php //datai.php
// require_once 'logini.php';
//mysqli connection code
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_lab_09");
//Get values from form
$TableName	= $_POST['table_name'];
$FieldName	= $_POST['field_name'];
$NewValue	= $_POST['new_value'];
$Condition	= $_POST['condition'];
/*
if($link)
{ echo "linked!";}
*/
//update field data
$sql="UPDATE $TableName SET $FieldName = $NewValue WHERE $Condition";
$result=mysqli_query($link, $sql);

//if successfully update field data in database, displays message "successful".
if($result) {
header('Location: ../thankyou.php');
}
else {
echo "ERROR";
}

//close mysql
mysqli_close($link);
?>