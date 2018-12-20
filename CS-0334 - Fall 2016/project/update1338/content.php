<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Final Project -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Enter Customer Information</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="content.css">
	</head>

<body>
<div id="wrapper"><!--Begin main wrapper -->
     <section id="top area">
	      <article class="box-right">
		       <form action="script/data.php" method="post">
			        <p>
					     <label>First Name:</label>
						 <input name="first_name" required="required" placeholder="Junchao" type="text">
					</p>
					<p>
					     <label>Last Name:</label>
						 <input name="last_name" required="required" placeholder="Mei" type="text">
					</p>
					<p>
					     <label>Street Address 1:</label>
						 <input name="street_address1" required="required" placeholder="street address" type="text">
					</p>
					<p>
					     <label>Street Address 2:</label>
						 <input name="street_address2" type="text">
					</p>
					<p>
					     <label>City:</label>
						 <input name="city" required="required" placeholder="City" type="text">
					</p>
					<p>
					     <label>State/Province:</label>
						 <input name="state_province" required="required" placeholder="State/Province" type="text">
					</p>
					<p>
					     <label>Zip/Postal Code:</label>
						 <input name="zip_postal" required="required" placeholder="Zip/Postal Code" type="text">
					</p>
					<p>
					     <label>Gender:</label>
						 <input type="radio" name="gender" value="male" checked="checked" /><label>male</label>
						 <input type="radio" name="gender" value="female" /><label>female</label>
					</p>
					<p>
					     <label>Email Address:</label>
						 <input name="email" required="required" placeholder="name@email.com" type="email">
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