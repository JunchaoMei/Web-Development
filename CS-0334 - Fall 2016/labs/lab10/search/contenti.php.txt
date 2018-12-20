<!DOCTYPE html>
<!-- Junchao Mei, CS0334, Fall 2016, Lab 10 -->

<html>
<head>
	<title>More SQL/PHP</title>
	<meta name="author" content="Junchao Mei"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="lab10_contenti.css">
</head>

<body>
	<a href="contenti.php.txt">contenti.php</a></br>
	<a href="script/datai.php.txt">datai.php</a></br>
	<a href="script/logini.php.txt">logini.php</a></br>
<h1>Search a Certain User in Database</h1>
<div id="wrapper><-- begin main wrapper-->
     <section id="top area">
	      <article class="box-right">
		       <form action="script/datai.php" method="post">
                    <p> 
                        <label>First Name:</label>
                        <input name="first_name" required="required" placeholder="Junchao" type="text">
                    </p>
                    <p> 
                        <label>Last Name:</label>
                        <input name="last_name" required="required" placeholder="Mei" type="text">
                    </p>
					<p>
					     <input value="Submit" type="submit">
					</p>
				</form>
			</article>
		</section>
	</div><!-- END MAIN WRAPPER -->
</body>
</html>