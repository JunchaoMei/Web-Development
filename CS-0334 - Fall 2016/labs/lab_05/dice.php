<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Junchao Mei, CS0334, Fall 2016, Lab 5 -->

<html lang="EN" dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Dice</title>
		<meta name="author" content="Junchao Mei"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="dice.css">
	</head>

	<body>
		<p><a href="dice.php.txt">View PHP Code</a></p>
		<h1>Roll The Dice!</h1>
		<?php
			printBeginning();
			printForm();

			function showDie($value)
			{
				print <<<HERE
				<img src = "die$value.jpg" height = "150" width = "150"	alt = "die: $value"/>
HERE;
			}//end showDie

			function printDice($numberofdice)
			{
				global $total;
				global $dice;
				$dice = 0;
				print "<h3>New Roll:</h3>\n";
				$total = 0;
			  
				for($i=1; $i<=$numberofdice; $i++)
				{
					$dice = rand(1,6);
					showDie($dice);
					$total+=$dice;
				}//end for loop

				return $total;
			}//end printDice

			function printBeginning()
			{
				global $total;
				$guess = filter_input(INPUT_POST,"guess");
				$numberofdice = filter_input(INPUT_POST,"numberofdice"); 

				printDice($numberofdice);

				if (!filter_has_var(INPUT_POST, "guess"))
				{	//beginning of game
					print "<h2>Welcome to our Dice Game!</h2>";
				} else if ($guess == $total)
				{
					print "<h2>Correct! You Win!</h2>";
				} else
				{
					print <<<HERE
						<h3>Wrong! Guess again!</h3>
						<p>
							Your guess: $guess <br/>
							Correct Total: $total
						</p>;
HERE;
				}//end else
			}//end printBeginning

			function printForm()
			{	//where people will submit their choices and guesses
				global $total;

				print <<<HERE
					<form method="post" action="">
						<fieldset>
							<label> The number of dice you would like to roll:</label>
							<select name="numberofdice">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</fieldset><br/>
							<label>Take a guess of total number:</label>
								<input type = "text" name = "guess" />
							<br/>
							<input type="submit"/>
						</fieldset>
					</form>
HERE;
			}//end printForm
		?><!-- end php -->
	</body>
</html>