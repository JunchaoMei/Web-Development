<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Lab 6 -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Looping & Conditions</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="loop.css">
	</head>

	<body>
		<p><a href="loop.php.txt">View PHP Code</a></p>
		<h1>Looping & Conditions</h1>
		<?php
			for ($i=1; $i<=100; $i++)
			{
				if ($i%3==0 || $i%5==0)
				{
					if ($i%3==0 && $i%5==0)
						print "FizzBuzz<br/>";
					else if ($i%3==0)
						print "Fizz<br/>";
					else
						print "Buzz<br/>";
				} else
					print "$i <br/>";
			}//end for loop $i
		?><!-- end php -->
	</body>
</html>