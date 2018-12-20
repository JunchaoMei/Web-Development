<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Final Project -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Display all Items</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="table.css">
	</head>

<body>
<?php
$link = mysqli_connect("localhost","junchaox_mei","12331233mjc","junchaox_finalproject");

//perform query
$sql = "SELECT * FROM Inventory";
$result=mysqli_query($link, $sql);
//print table
echo "<table border=\"1\" align='center'>\n";//create table
echo "<tr><td>inventory_id</td><td>type</td><td>brand</td><td>color</td><td>size</td><td>price</td><td>gender_applied</td></tr>";
while ($row = mysqli_fetch_assoc($result))
{
	echo "<tr>";
	echo "<td>{$row['inventory_id']}</td>";
	echo "<td>{$row['type']}</td>";
	echo "<td>{$row['brand']}</td>";
	echo "<td>{$row['color']}</td>";
	echo "<td>{$row['size']}</td>";
	echo "<td>{$row['price']}</td>";
	echo "<td>{$row['gender_applied']}</td>";
	echo "</tr>";
}//end while loop

//close mysqli
mysqli_close($link);
?>
</body>
</html>