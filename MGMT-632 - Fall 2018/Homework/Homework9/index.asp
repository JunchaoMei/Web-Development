<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Homework 9 -->

<html>
<head>
	<title>Sliders</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset="utf-8"/>
    <script type="text/javascript">
        function initializeBoard(gameDir)
        {
            dirPath = "images/" + gameDir + "/";
            buttonClicked = false;
            ending = document.gameBoard.length - 1;

            for (i = 0; i < ending; i++)
            {
                faceValue = i+1;
                document.gameBoard[i].src = dirPath + faceValue + ".jpg";
                document.gameBoard[i].faceValue = faceValue;
            }
            document.gameBoard[ending].src = dirPath + "0.jpg";
            document.gameBoard[ending].faceValue = 0;

            blankTile = 15;

            for (i = 0; i < ending; i++)
            {
                document.solutionBoard[i].src = dirPath + (i+1) + ".jpg";
            }
            document.solutionBoard[ending].src = dirPath + "0.jpg";

            document.getElementById("myScore").innerHTML = 0;
        }

        function startGame()
        {
            buttonClicked = true;
            randomizingBoard = true;
            randomizationMoveLimit = 75;
            randomizationTimeDelay = 25;
            moveCounter = 0;
            randomMove();
            document.getElementById("myScore").innerHTML = 0;
            thread = setInterval('randomMove()', randomizationTimeDelay);
        }

        function randomMove()
        {
            row = Math.floor(blankTile / 4);
            col = blankTile % 4;
            rnd = Math.floor(Math.random() * 4);

            if (rnd == 0 && row != 0) {
                //move blank tile up 1 row
                swapTile(blankTile - 4, blankTile);
            } if (rnd == 1 && col != 3) {
                //move blank tile 1 col right
                swapTile(blankTile + 1, blankTile);
            } if (rnd == 2 && row != 3) {
                //move blank tile down 1 row
                swapTile(blankTile + 4, blankTile);
            } if (rnd == 3 && col != 0) {
                //move blank tile 1 col left
                swapTile(blankTile - 1, blankTile);
            }

            if (moveCounter > randomizationMoveLimit) {
                clearInterval(thread);
                randomizingBoard = false;
                moveCounter = 0;
            }

        }

        function swapTile(clicked, other)
        {
            document.gameBoard[other].src = document.gameBoard[clicked].src;
            document.gameBoard[other].faceValue = document.gameBoard[clicked].faceValue; 
 
            document.gameBoard[clicked].src = dirPath + "0.jpg";
            document.gameBoard[clicked].faceValue = 0;
 
            blankTile = clicked;
            moveCounter++; //this counter is used to scramble the board

            if (!randomizingBoard) {
                document.getElementById("myScore").innerHTML = moveCounter;
                checkGame();
            }
        }

        function moveTile(tileNum, rowNum, colNum)
        {
            if (!buttonClicked) {
                alert('You must start the game before you can play');
                return;
            }

            if (randomizingBoard) {
                return;
            }

            if (rowNum > 0 && document.gameBoard[tileNum - 4].faceValue == 0) {
                swapTile(tileNum, tileNum - 4);
                return;
            } if (colNum < 3 && document.gameBoard[tileNum + 1].faceValue == 0) {
                swapTile(tileNum, tileNum + 1);
                return;
            } if (rowNum < 3 && document.gameBoard[tileNum + 4].faceValue == 0) {
                swapTile(tileNum, tileNum + 4);
                return;
            } if (colNum > 0 && document.gameBoard[tileNum - 1].faceValue == 0) {
                swapTile(tileNum, tileNum - 1);
                return;
            }

        }

        function checkGame()
        {
            for (i = 1; i < 16; i++)
            {
                if (document.gameBoard[i - 1].faceValue != i)
                    return;
            }
            alert('You win!');
            buttonClicked = false;
        }
    </script>
    <style type="text/css">
        img {display:block}
    </style>
</head>

<body onLoad="initializeBoard('Lobo')">
<table border="0" cellSpacing="0" cellPadding="0" width="1000" align="center">
  <tbody>
    <tr><td colspan="3" valign="middle" align="center" style="font-weight: bold; font-size: 20pt; font-family: Calibri;">Dynamic Board</td></tr>
    <tr>
        <td width="400" valign="middle" align="center">
            <p style="font-weight:bold; font-size:15pt; font-family:Arial;">Game Board</p>
            <table border="1" width="400" cellPadding="0" cellSpacing="0">
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(0,0,0)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(1,0,1)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(2,0,2)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(3,0,3)"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(4,1,0)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(5,1,1)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(6,1,2)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(7,1,3)"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(8,2,0)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(9,2,1)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(10,2,2)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(11,2,3)"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(12,3,0)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(13,3,1)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(14,3,2)"/></td>
                    <td width="100"><img src="" name="gameBoard" onclick="moveTile(15,3,3)"/></td>
                </tr>
            </table>
        </td>
        <td width="200" valign="middle" align="center">
            <input type="button" value="Start Game!" onClick="startGame()"><br /><br /><br />
            Score: <div id="myScore">0</div>
        </td>
        <td width="400" valign="middle" align="center">
            <p style="font-weight:bold; font-size:15pt; font-family:Arial;">Solution</p>
            <table border="1" width="400" cellpadding="0" cellspacing="0">
                <tr height="100">
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                    <td width="100"><img src="" name="solutionBoard"/></td>
                </tr>
            </table>
        </td>
    </tr>
  </tbody>
</table><br /><br /><br />
<table align="center" width="1000" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" align="center" style="font-weight:bold; font-size:15pt; font-family:Calibri;">Choose Your Puzzle<br /><br /></td></tr>
    <tr>
        <td align="center"><a onclick="initializeBoard('Lobo')"><img src="images/Lobo.jpg" /></a></td>
        <td align="center"><a onclick="initializeBoard('Zia')"><img src="images/Zia.jpg" /></a></td>
        <td align="center"><a onclick="initializeBoard('BB')"><img src="images/BreakingBad.jpg" /></a></td>
        <td align="center"><a onclick="initializeBoard('BF')"><img src="images/Pig.jpg" /></a></td>
    </tr>
    <tr>
        <td align="center"><a onclick="initializeBoard('Lobo')">UNM Lobos</a></td>
        <td align="center"><a onclick="initializeBoard('Zia')">New Mexico Zia</a></td>
        <td align="center"><a onclick="initializeBoard('BB')">Breaking Bad</a></td>
        <td align="center"><a onclick="initializeBoard('BF')">Ballon Festival</a></td>
    </tr>
</table>
</body>
</html>