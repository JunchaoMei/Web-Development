<!DOCTYPE html >
<html lang="en">
<head>
    <link rel=stylesheet href="dice.css"/>
    
    <title>Dice Game Sample</title>
    <!-- Created by Peter DeNardis - last updated 25 September, 2014 -->
</head>
<body>
    <h1>Dice Game</h1><br/>

    <?php
    
    printBeginning();
    printForm();
  
    
function printBeginning() {
    global $total;
   $guess = filter_input(INPUT_POST,"guess");
    $numberofdice = filter_input(INPUT_POST,"numberofdice"); 

printDice($numberofdice);

 if (!filter_has_var(INPUT_POST, "guess")) {  //beginning of game
    print "<h2>Welcome to My Dice Game</h2>";
  } else if ($guess == $total) {
    print "<h2>Good Guess. You Win!</h2>";
  } else {
    
     print <<<HERE
        <h3>Sorry, you are wrong. Guess again!</h3>
        <p>
        Your guess: $guess <br/>
        Correct Total: $total
        </p>;
HERE;
    }  // end if
}  // end printBeginning


function showDie($value){
  print <<<HERE
  <img src = "die$value.jpg"
       height = "100"
       width = "100"
       alt = "die: $value" />
 
HERE;
} // end showDie


function printDice($numberofdice) {
  global $total;
  global $dice;
  $dice = 0;
  print "<h3>New Roll:</h3> \n";
  $total = 0;
  
 // for($i=1; $i<=$numberofdice; $i+=1)
 // {
 // $dice = rand(1,6);
 // showDie($dice);
 // $total=$total+$dice;
 // }
 //return $total;
 
 switch($numberofdice) {
 case 1:
    $die1 = rand(1,6);
	showDie($die1);
	$total = $total+$die1;
    break;	
case 2:
     $die1 = rand(1,6);
	 showDie($die1);
	 $die2 = rand(1,6);
	 showDie($die2);
	 $total = $total+$die1+$die2;
	 break;
case 3:
     $die1 = rand(1,6);
	 showDie($die1);
	 $die2 = rand(1,6);
	 showDie($die2);
	 $die3 = rand(1,6);
	 showDie($die3);
	 $total = $total+$die1+$die2+$die3;
	 break;
case 4:
	 $die1 = rand(1,6);
	 showDie($die1);
	 $die2 = rand(1,6);
	 showDie($die2);
	 $die3 = rand(1,6);
	 showDie($die3);
	 $die4 = rand(1,6);
	 showDie($die4);
	 $total = $total+$die1+$die2+$die3+$die4;
	 break;
case 5:
	 $die1 = rand(1,6);
	 showDie($die1);
	 $die2 = rand(1,6);
	 showDie($die2);
	 $die3 = rand(1,6);
	 showDie($die3);
	 $die4 = rand(1,6);
	 showDie($die4);
	 $die5 = rand(1,6);
	 showDie($die5);
	 $total = $total+$die1+$die2+$die3+$die4+$die5;
	 break;
 }// end switchDice
 
} // end printDice


  function printForm() { //where people will submit their choices and guesses
  global $total;

  print <<<HERE
    <form method="post" action="">
        <fieldset>
            <label> Choose the number of dice you would like to roll:</label>
            <select name="numberofdice">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
           </fieldset>
            <br/>
            <label>What do you think the number will be?:</label>
            <select name="guess"> 
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
            </select>
            <br/>
            <input type="submit" />
        </fieldset>
    </form>
HERE;
} //end printForm
    
    ?>
 <p><a href="sampleDiceNoFor.php.src.txt">Code for php dice file</a></p>   
</body>
</html>