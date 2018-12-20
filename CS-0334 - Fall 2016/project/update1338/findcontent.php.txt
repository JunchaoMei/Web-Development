<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Final Project -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Search for Items</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="content.css">
	</head>

<body>
<div id="wrapper"><!--Begin main wrapper -->
    <section id="top area">
	        <article class="box-right">
		       <form action="script/search.php" method="post">
			        <p>
						<label>Type:</label>
						<select name = "type">
							<option value = "dress">dress</option>
							<option value = "gloves">gloves</option>
							<option value = "hat">hat</option>
							<option value = "jacket">jacket</option>
							<option value = "jeans">jeans</option>
							<option value = "overcoat">overcoat</option>
							<option value = "shoes">shoes</option>
							<option value = "socks">socks</option>
							<option value = "sweater">sweater</option>
							<option value = "t-shirt">t-shirt</option>
							<option value = "underwear">underwear</option>
						</select>
					</p>
					<p>
						<label>Gender:</label>
						<select name = "gender_applied">
							<option value = "M">Male</option>
							<option value = "F">Female</option>
							<option value = "U">Unisex</option>
						</select>
					</p>
					<p>
					     <input value="Submit" type="submit">
					</p>
			   </form>
			</article>
	</section>
</div><!-- end main wrapper-->
</body>
</html>