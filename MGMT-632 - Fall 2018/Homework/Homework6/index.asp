<html>
<head>
    <title>Homework 6 - Fun with JavaScript</title>

    <script src="JSFunctions.js?ver=1"></script> 
    <link href="styles.css" rel="stylesheet" type="text/css">
</head>
<body>

    <table cellpadding="0" cellspacing="0" border="0" align="center" width="1024">
        <!-- Part 1: Used to select a random number and display a card. -->
        <tr><td width="1024" colspan="2"><b>Part 1: Higher or Lower (Select card using the Random() function)</b></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr>
            <td colspan="2">
                <form name="cardGame">
			    <t-able cellpadding="0" cellspacing="0" border="0">
				    <tr>
					    <td class="normal" align="center" width="110">
                            <input type="button" value="New Game" onClick="startGame()"><br /><br />
                            <div id="myScore">Score: 0</div>
					    </td>
                        <td width="20"></td>
					    <td class="normal" align="right">
                            <input type="button" value="Higher" onClick="myGuess('H')"><br /><br />
                            <input type="button" value="Lower" onClick="myGuess('L')">
					    </td>
                        <td width="30"></td>
					    <td class="normal" align="left" width="110"> <img src="cards/Back.png" /></td>
                        <td width="10"></td>
					    <td class="normal" align="left" width="110"><div id="displayCard"><img src="cards/0.png"></div></td>
                        <td width="10"></td>
					    <td class="normal" align="left" width="300"><div id="displayMessage"></div></td>
				    </tr>
			    </t-able>
			    </form>
            </td>
        </tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr><td colspan="2" height="1" bgcolor="#000000"></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <!-- Part 2: Mortgage Calculator lists the payments and interest paid for each payment. -->
        <tr><td width="1024" colspan="2"><b>Part 2: Mortgage Calculator</b></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr>
            <td colspan="2">
                <form name="loanCalc">
			    <table cellpadding="0" cellspacing="0" border="0">
				    <tr>
					    <td class="normal" align="right" width="250">Loan Amount:&nbsp;&nbsp;</td>
					    <td class="normal" align="left" width="250"> <input type="text" name="loanAmount" size="10" value=""></td>
				    </tr>
				    <tr><td height="10" colspan="2"></td></tr>
				    <tr>
					    <td class="normal" align="right" width="250">Number of Payments:&nbsp;&nbsp;</td>
					    <td class="normal" align="left" width="250"> <input type="text" name="payments" size="10" value=""></td>
				    </tr>
				    <tr><td height="10" colspan="2"></td></tr>
				    <tr>
					    <td class="normal" align="right" width="250">Interest Rate:&nbsp;&nbsp;</td>
					    <td class="normal" align="left" width="250"> <input type="text" name="interestRate" size="10" value=""></td>
				    </tr>
				    <tr>
					    <td class="normal" align="right" width="250"></td>
					    <td class="normal" align="left" width="250">(Enter .095 for 9.5%)</td>
				    </tr>
				    <tr><td height="15" colspan="2"></td></tr>
				    <tr>
					    <td class="normal" align="right" width="250"><input type="button" name="calculateLoan" value="Calculate" onClick="validateLoanCalcData()">&nbsp;&nbsp;</td>
					    <td class="normal" align="left" width="250">
                            <input type="reset" name="resetButton">&nbsp;&nbsp;
    					    <input type="button" name="clear" value="Clear Results" onClick="clearResults()">
					    </td>
				    </tr>
			    </table>
			    </form>
                <br />
                <div id="displayPayments"></div>
            </td>
        </tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr><td colspan="2" height="1" bgcolor="#000000"></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <!-- Part 3: A standard calculator with four mathematical operations: Multiply, Divide, Add, Subtract. -->
        <tr><td width="1024" colspan="2"><b>Part 3: Calculator</b></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr>
            <td colspan="2">
                <form name="myCalculator">
			    <table cellpadding="0" cellspacing="0" border="0" style="border:3px solid;" bgcolor="#6bafd3">
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="30"></td>
                        <td width="50" colspan="7" valign="middle" align="center" class="calcTitle">New Mexico Instruments</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#ffffff" colspan="7" valign="middle" align="right" class="calcDisplay"><div id="calcDisplay">0</div></td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('1')">1</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('2')">2</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('3')">3</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="mathOperator('*')">*</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('4')">4</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('5')">5</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('6')">6</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="mathOperator('/')">/</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('7')">7</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('8')">8</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('9')">9</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="mathOperator('+')">+</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" colspan="3" onClick="calcNumber('0')">0</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="calcNumber('.')">.</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="mathOperator('-')">-</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
				    <tr>
                        <td width="10" height="50"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" colspan="5" onClick="clearCalc()">Clear</td>
                        <td width="10"></td>
                        <td width="50" bgcolor="#92d7fb" valign="middle" align="center" class="calcButtons" onClick="mathOperator('=')">=</td>
                        <td width="10"></td>
				    </tr>
                    <tr><td colspan="9" height="10"></td></tr>
			    </table>
			    </form>
            </td>
        </tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr><td colspan="2" height="1" bgcolor="#000000"></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <!-- Part 4: Using a random number generator, move the emoji to a random location on the screen everytime the mouse touches him. -->
        <tr><td width="1024" colspan="2"><b>Part 4: Catch me if you can</b></td></tr>
        <tr><td colspan="2" height="20"></td></tr>
        <tr><td width="1024" colspan="2">Try to catch the Emoji using your mouse.</td></tr>
        <tr>
            <td height="400" colspan="2">
                <div id ="container">
                <div id ="catchSmiley" onMouseOver="moveSmiley()" class="smiley" onClick="caughtSmiley()"></div>
                </div>
            </td>
        </tr>
        <tr><td colspan="2" height="20"></td></tr>
    </table>
</body>
</html>

