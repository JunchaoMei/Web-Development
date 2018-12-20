<!DOCTYPE html >
<head>
<title>Self Introduction</title>
<style type = "text/css">
  h1, h2 {
    text-align: center;
  }
</style>

</head>
<body>

<h1>Self Introduction</h1>


<?php 

$full_name = filter_input(INPUT_POST, "full_name");
$location = filter_input(INPUT_POST, "location");
$language = filter_input(INPUT_POST, "language");
$hobby = filter_input(INPUT_POST, "hobby");
$job = filter_input(INPUT_POST, "job");
$favorite_color = filter_input(INPUT_POST, "favorite_color");
$favorite_season = filter_input(INPUT_POST, "favorite_season");

print <<<HERE
<h2>
Hello, everyone! My name is $full_name. I live in $location.<br />
I speak $language. I am a $job.<br />
I like $hobby. My favorite color is $favorite_color, and my favorite season is $favorite_season<br />
Nice to meet you all!
</h2>
HERE;
?>


</body>
</html>