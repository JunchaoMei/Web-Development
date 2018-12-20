<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Lab 3 -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

 <head>
  <title>Tip of the day</title>
  <meta name="author" content="Junchao Mei"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <!-- <meta name="generator" content="mshtml 9.00.8112.16457"> -->
  <link rel="stylesheet" type="text/css" href="tips.css">
 </head>

 <body>
  <a href="tip_of_the_day.txt">view source code</a></br>
  <h1>Tip of Today</h1>

  <div class="tip">
  <?php
   echo "<h2>Here's your tip:</h2>";
    switch (date("w"))
    {
		case 0:
			readfile("tip_Su.txt");
			break;
		case 1:
			readfile("tip_Mo.txt");
			break;
		case 2:
			readfile("tip_Tu.txt");
			break;
		case 3:
			readfile("tip_We.txt");
			break;
		case 4:
			readfile("tip_Th.txt");
			break;
		case 5:
			readfile("tip_Fr.txt");
			break;
		case 6:
			readfile("tip_Sa.txt");
			break;
		default:
			print "error";
	}//end switch
   ?><!-- end php -->
  </div>
 </body>
</html>