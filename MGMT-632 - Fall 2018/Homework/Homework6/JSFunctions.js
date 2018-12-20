///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                       //
// The functions below are related the Part 1: High or Low game using random numbers                                                                                     //
//                                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var total = 0;
var current = 0;
var strCard = "0.png";

function startGame() {  //Begin Function body
    total = 0;
    var num = Math.ceil((1 - Math.random()) * 13);
    var color = Math.ceil((1-Math.random()) * 4);
    var strColor;

    switch (color)
    {
        case 1:
            strColor = "H";
            break;
        case 2:
            strColor = "D";
            break;
        case 3:
            strColor = "S";
            break;
        case 4:
            strColor = "C";
            break;
        default:
            alert('startGame is malfunctioning');
            break;
    }

    current = num;
    strCard = num + strColor + ".png";
    document.getElementById("displayCard").innerHTML = "<img src=\"cards/" + strCard + "\">";
    document.getElementById("displayMessage").innerHTML = "";
    document.getElementById("myScore").innerHTML = "Score: " + total;
}


function myGuess(strHighLow) {  //Begin Function body
    var num = Math.ceil(Math.random() * 12) + 1;
    var color = Math.ceil(Math.random() * 3) + 1;
    var strColor;
    var msg;

    switch (color) {
        case 1:
            strColor = "H";
            break;
        case 2:
            strColor = "D";
            break;
        case 3:
            strColor = "S";
            break;
        case 4:
            strColor = "C";
            break;
        default:
            alert('startGame is malfunctioning');
            break;
    }

    strCard = num + strColor + ".png";

    if (strHighLow == 'H' && num > current) {
        msg = "The card is higher, you win!";
        total += 1;
    } else if (strHighLow == 'L' && num < current) {
        msg = "The card is lower, you win!";
        total += 1;
    } else if (num == current)
        msg = "The cards match, Try Again!";
    else
    {
        msg = "You Lose!";
        total = 0;
    }

    current = num;
    strCard = num + strColor + ".png";
    document.getElementById("displayMessage").innerHTML = msg;
    document.getElementById("myScore").innerHTML = "Score: " + total;
    document.getElementById("displayCard").innerHTML = "<img src=\"cards/" + strCard + "\">";
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                       //
// The functions below are related the Part 2: The Mortgage Calculator                                                                                                   //
//                                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validateLoanCalcData() {  //Begin Function body
    if (!document.loanCalc.loanAmount.value.match(/^[0-9]+$/) || document.loanCalc.loanAmount.value <= 0)
    {
        alert('Please enter a valid Loan Amount');
        document.loanCalc.loanAmount.focus();
        return;
    }

    if (!document.loanCalc.payments.value.match(/^[0-9]+$/) || document.loanCalc.payments.value <= 0)
    {
        alert('Please enter a valid # of Payments');
        document.loanCalc.payments.focus();
        return;
    }

    if (!document.loanCalc.interestRate.value.match(/^[0-9\.]+$/) || document.loanCalc.interestRate.value <= 0 || document.loanCalc.interestRate.value >= 1) {
        alert('Please enter a valid Interest Rate');
        document.loanCalc.interestRate.focus();
        return;
    }

    writePayments();
}


function clearResults() {
    document.getElementById("displayPayments").innerHTML = "";
}


function writePayments() {  //Begin Function body
    //Task 1: Create three variables
	//Create three variables (loanAmt, loanPmts, intRate) and set their values equal to the values
    //entered in the form fields.
    var loanAmt = document.loanCalc.loanAmount.value;
    var loanPmts = document.loanCalc.payments.value;
    var intRate = document.loanCalc.interestRate.value;

	//Task 2: Perform Calculations
	//Using the four variables (monthlyRate, monthlyPayment, totalPaid, totalInterest) listed below, 
    //finish the necessary calculations.
    var monthlyRate = intRate / 12; //The monthly rate calculates the interest rate per month based on the rate entered
    //monthlyPayment is provided below, you do not need to calculate this.
    var monthlyPayment = (loanAmt * monthlyRate) / (1 - Math.pow(monthlyRate * 1 + 1, 0 - loanPmts)); //Calculate the monthly interest rate.
    var totalPaid = loanPmts * monthlyPayment; //total paid equals the number of payments made multiplied by the monthly payment
    var totalInterest = totalPaid - loanAmt; //using the total amount paid and the loan amount, calculate how much interest was paid

    //Information about the loan in general. This output is provided for you.
    strOutputData = '<table cellpadding="0" cellspacing="0" border="0" align="center">';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Loan Amount:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">$' + addCommas((loanAmt * 1).toFixed(2)) + '</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="5" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Number of Payments:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">' + loanPmts + '</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="5" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Annual Rate:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">' + (intRate * 100).toFixed(3) + '%</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="5" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Monthly Rate:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">' + (monthlyRate * 100).toFixed(3) + '%</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="15" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Monthly Payment:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">$' + addCommas(monthlyPayment.toFixed(2)) + '</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="5" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Total Paid:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">$' + addCommas(totalPaid.toFixed(2)) + '</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="5" colspan="2"></td></tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="right" width="250">Total Interest:&nbsp;&nbsp;</td>';
    strOutputData += '<td class="normal" align="left" width="250">$' + addCommas(totalInterest.toFixed(2)) + '</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr><td height="20" colspan="2"></td></tr>';
    strOutputData += '</table>';

    // Write table used to output monthly payments. This code is provided for you.
    strOutputData += '<table cellpadding="0" cellspacing="0" border="1" width="500" align="center">';
    strOutputData += '<tr>';
    strOutputData += '<td width="60" align="center" valign="middle" bgcolor="#bcbcbc" class="normalBold">Pmt #</td>';
    strOutputData += '<td width="110" align="center" valign="middle" bgcolor="#bcbcbc" class="normalBold">Payment</td>';
    strOutputData += '<td width="110" align="center" valign="middle" bgcolor="#bcbcbc" class="normalBold">Interest</td>';
    strOutputData += '<td width="110" align="center" valign="middle" bgcolor="#bcbcbc" class="normalBold">Principal<br>Reduction</td>';
    strOutputData += '<td width="110" align="center" valign="middle" bgcolor="#bcbcbc" class="normalBold">Principal<br>Balance</td>';
    strOutputData += '</tr>';
    strOutputData += '<tr>';
    strOutputData += '<td class="normal" align="center">0</td>';
    strOutputData += '<td class="normal" align="center">&nbsp;</td>';
    strOutputData += '<td class="normal" align="center">&nbsp;</td>';
    strOutputData += '<td class="normal" align="center">&nbsp;</td>';
    strOutputData += '<td class="normal" align="center">' + addCommas((loanAmt * 1).toFixed(2)) + '</td>';
    strOutputData += '</tr>';

    var currentBalance = loanAmt;
    var currentInterest = 0;
    var currentPrinciple = 0;
    var shadedRow = 1;

    for (i = 1; i <= loanPmts; i++) {
		//Task 3: Calculate each payment data. Three variables required
        currentInterest = monthlyRate * currentBalance;
        currentPrinciple = monthlyPayment - currentInterest;
        currentBalance = currentBalance - currentPrinciple;

		//The IF statement below is used to alternate the background color of each row.
        if (shadedRow == 0) {
            strOutputData += '<tr>';
            shadedRow = 1;
        } else {
            strOutputData += '<tr bgcolor="#bddf81">';
            shadedRow = 0;
        }

        strOutputData += '<td class="normal" align="center">' + i + '</td>';
        strOutputData += '<td class="normal" align="center">' + addCommas(monthlyPayment.toFixed(2)) + '</td>';
        strOutputData += '<td class="normal" align="center">' + addCommas(currentInterest.toFixed(2)) + '</td>';
        strOutputData += '<td class="normal" align="center">' + addCommas(currentPrinciple.toFixed(2)) + '</td>';
        if (currentBalance < 0) {
            strOutputData += '<td class="normal" align="center">.00</td>';
        } else {
            strOutputData += '<td class="normal" align="center">' + addCommas(currentBalance.toFixed(2)) + '</td>';
        }

        strOutputData += '</tr>';
    }
    strOutputData += '</table>';
    strOutputData += '<br>';

    //Task 4: Using the 'displayPayments' div tag, output the data stored in the strOutputData variable
    document.getElementById("displayPayments").innerHTML = strOutputData;
} //End of Function

function addCommas(nStr) {
    nStr += '';

    //Split the number into two part, the part before the decimal and the part after the decimal
    x = nStr.split('.');

    //Set x1 equal to the part of the number before the decimal
    x1 = x[0];

    //Set x2 equal to the part of the number after the decimal concatenated with a decimal point
    x2 = x.length > 1 ? '.' + x[1] : '';

    //set the regular expression to look for a number and only 3 digits at a time
    var rgx = /(\d+)(\d{3})/;

    //Loop through each 3 digits adding a comma
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }

    //concatenate the first part of the number with the newly inserted commas to the last part 
    //of the number containing any digits that follow the decimal place and return the value
    return x1 + x2;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                       //
// The functions below are related the Part 3: Calculator                                                                                                                //
//                                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The variables below are the default values for the calculator. These do not appear within a function, so they will be set when the page loads.
//Once the script loads, these variables will be set and these three lines of code will not be executed again unless the page is reloaded.
//Add global variables here...
var currentValue;
var saveNumber="";
var useOperator;


//This is the function that is called when the user clicks on a number button (0-9) or the decimal button.
function calcNumber(strNumber) {
    if (saveNumber == "" && strNumber == '.')
        saveNumber = "0.";
    else if (!(saveNumber == "" && strNumber == '0') && !(saveNumber.match(/^d+(\.\d+)?$/) && strNumber == '.'))
        saveNumber = saveNumber + strNumber;

    document.getElementById("calcDisplay").innerHTML = saveNumber;
}


//This is the function that is called when the user clicks on one of the mathematical operations (+, -, *, /)
function mathOperator(strSign) {
    var newValue = Number(saveNumber);
    saveNumber = "";

    if (currentValue == 0) {
        currentValue = newValue;
        useOperator = strSign;
    } else if (useOperator == '')
        useOperator = strSign;
    else
    {
        if (useOperator == '+')
            currentValue = currentValue + newValue;
        else if (useOperator == '-')
            currentValue = currentValue - newValue;
        else if (useOperator == '*')
            currentValue = currentValue * newValue;
        else if (useOperator == '/') {
            if (newValue == 0)
            {
                alert('cannot divide by zero');
                clearCalc();
            }
            else
                currentValue = currentValue / newValue;
        } else if (useOperator == '=')
            useOperator = '';
        else
            useOperator = strSign;
    }
    currentValue = Math.round(currentValue * 10000) / 10000;
    document.getElementById("calcDisplay").innerHTML = currentValue;
}


//This is the function that is called when the user clicks on the clear button. It restores the variables to their default values and clears the calculator display.
function clearCalc() {
    document.getElementById("calcDisplay").innerHTML = 0;
    currentValue = "";
    saveNumber = "";
    useOperator = "";
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                       //
// The function below is related the Part 4: Catch me if you can                                                                                                         //
//                                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function moveSmiley() {
    var intTop = Math.ceil(Math.random() * 349) + 1; //Create a random number between 1 and 350
    var intLeft = Math.ceil(Math.random() * 349) + 1; //Create a random number between 1 and 350

	//The code below is provided to you.
    document.getElementById("catchSmiley").style.top = intTop + 'px';
    document.getElementById("catchSmiley").style.left = intLeft + 'px';
}

function caughtSmiley() {
    alert('You caught him!');
}