<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Lab 8 -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Working With Files</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="workingWithFiles.css">
	</head>
	<body>
		<p><a href="workingWithFiles.php.txt">View *.php Code-1</a></p>
		<p><a href="writeComment.php.txt">View *.php Code-2</a></p>
		<p><a href="customer.mas">View *.mas file</a></p>
		<p><a href="customer.html">View *.html file</a></p>
		<p><a href="customer.html.txt">View *.html.txt file</a></p>

		<?PHP
		 print <<<HERE
		  <form action = "writeComment.php" method = "post">
			<fieldset>
			  <label>First Name</label>
				<input type = "text" name = "firstName" value = "" /><br/>
			  <label>Last Name</label>
				<input type = "text" name = "lastName" value = "" /><br/>
			  <label>Address</label>
				<input type = "text" name = "address" value = "" /><br/>
			  <label>School</label>
				<input type = "text" name = "schoolAttend" value = "" /><br/>
			  <label>Email</label>
				<input type = "text" name = "email" value = "" /><br/>
			  <label>Phone</label>
				<input type = "text" name = "phone" value = "" /><br/>
			  <label>Major</label>
				<input type = "text" name = "major" value = "" /><br/>
			  <label>College Year</label>
				<select name = "collegeYear">
					<option value = "Freshman">Freshman</option>
					<option value = "Sophomore">Sophomore</option>
					<option value = "Junior">Junior</option>
					<option value = "Senior">Senior</option>
					<option value = "Master">Master</option>
					<option value = "doctoral">Doctoral</option>
					<option value = "Post-doc">Post-doc</option>
				</select><br/>
			  <textarea name = "comments" rows = "10" cols = "60">enter your comments here</textarea><br/>      

			  <button type = "submit">Submit Comments</button>
			</fieldset>
		  </form>
HERE;

		?><!-- end php --><br/>
	</body>
</html>