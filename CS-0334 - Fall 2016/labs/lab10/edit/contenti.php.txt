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
	<a href="thankyou.php.txt">thankyou.php</a></br>
	<a href="script/datai.php.txt">datai.php</a></br>
	<a href="script/logini.php.txt">logini.php</a></br>
<h1>Update Table</h1>
<p>Location ID is limited to 'location001~010' (foreign key constraint)</p>
<div id="wrapper><-- begin main wrapper-->
     <section id="top area">
	      <article class="box-right">
		       <form action="script/datai.php" method="post">
                    <p>
                        <label>Table Name:</label>
                        <input name="table_name" required="required" placeholder="Customers" type="text">
                    </p>
                    <p> 
                        <label>Field Name:</label>
                        <input name="field_name" required="required" placeholder="user_id" type="text"> 
                    </p>
                    <p> 
                        <label>New Value:</label>
                        <input name="new_value" required="required" placeholder="new value" type="text">
                    </p>
                    <p> 
                        <label>Condition:</label>
                        <input name="condition" required="required" placeholder="condition" type="text">
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