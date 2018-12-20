<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, mid-term -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>mid-term</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="mid_term.css">
	</head>

	<body>
		<p><a href="mid_term.php.txt">View PHP Code</a></p>
		<h1>Associative array and for loop</h1>
		<?php
			//create associative array
			$month['January']="31";
			$month['February']="28";
			$month['March']="31";
			$month['April']="30";
			$month['May']="31";
			$month['June']="30";
			$month['July']="31";
			$month['August']="31";
			$month['September']="30";
			$month['October']="31";
			$month['November']="30";
			$month['December']="31";

			//sort array by keys
			ksort($month);
			
			echo "<h3>Output as an Array:</h3>";
			foreach($month as $x=>$x_value)
			{
				echo $x . "    " . $x_value;
				echo "<br>";
			}//end foreach loop

			echo "<h3>Output as a Table:</h3>";
			echo "<table bgcolor='white' border=\"1\" align='center'>\n";//create table 
			foreach($month as $x=>$x_value)
			{
				echo "<tr>\n"; //start row

					echo "<td>";//start column
					echo $x;
					echo "</td>";//end column

					echo "<td>";
					echo $x_value;
					echo "</td>";

				echo "</tr>\n"; //end row
			}//end foreach loop
			echo "</table>\n"; //end table
		?><!-- end php -->
	</body>
</html>