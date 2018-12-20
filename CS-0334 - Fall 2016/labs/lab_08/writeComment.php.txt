<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Lab 8 -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Write Comments</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="writeComment.css">
	</head>
	<body>

	<?PHP
	//generates a master file and an HTML file for the customer information

	//load variables from form
	$firstName = filter_input(INPUT_POST, "firstName");
	$lastName = filter_input(INPUT_POST, "lastName");
	$address = filter_input(INPUT_POST, "address");
	$schoolAttend = filter_input(INPUT_POST, "schoolAttend");
	$email = filter_input(INPUT_POST, "email");
	$phone = filter_input(INPUT_POST, "phone");
	$major = filter_input(INPUT_POST, "major");
	$collegeYear = filter_input(INPUT_POST, "collegeYear");
	$comments = filter_input(INPUT_POST, "comments");

	//open the output file
	$fileBase = "customer";
	$htmlFile = $fileBase . ".html";
	$masFile = $fileBase . ".mas";

	$htfp = fopen($htmlFile, "a");
	$htData = buildHTML();
	fputs($htfp, $htData);
	fclose($htfp);

	$msfp = fopen($masFile, "a");
	$msData = buildMas();
	fputs($msfp, $msData);
print <<<HERE
<pre>
$msData
</pre>

HERE;

	fclose ($msfp);

	function buildMas(){
	  //builds the master file
	  global $firstName, $lastName, $address, $schoolAttend, $email, $phone, $major, $comments, $collegeYear;
	  $msData = "Your first name is " . $firstName . "\n";
	  $msData .= "Your last name is " . $lastName . "\n";
	  $msData .= "Your street address is " . $address . "\n";
	  $msData .= "Your email address is " . $email . "\n";
	  $msData .= "Your phone number is " . $phone . "\n";
	  $msData .= "Your major is " . $major . "\n";
	  $msData .= "You are attending " . $schoolAttend . "\n";
	  $msData .= "You are a " . $collegeYear . " student \n\n";
	  $msData .=  "Here is your comment: \n" . $comments. "\n";
	  return $msData;
	} // end buildMas

	function buildHTML(){
	  global $lastName, $comments;
	  $htData = <<<HERE

<!DOCTYPE html >
<html lang="EN" >
<head>
<title>$lastName</title>
<style type = "text/css">
ol ol {
  border-bottom: 1px solid black;
}

ol ol li {
  list-style-type: upperAlpha;
}
</style>
</head>
<body>

HERE;

	  //print $htData;
	  return $htData;
	} // end buildHTML

	?><!-- end php -->
	</body>
</html>