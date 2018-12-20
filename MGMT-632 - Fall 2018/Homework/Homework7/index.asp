<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Homework 7 -->

<html>
<head>
	<title>Sliders</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset="utf-8"/>
    <script type="text/javascript">
        function initializeBoard(gameDir)
        {
            var dirPath = "images/" + gameDir + "/";
            var buttonClicked = false;
            var ending = document.gameBoard.length - 1;

            for (i = 0; i < ending; i++)
            {
                var faceValue = i+1;
                document.gameBoard[i].src = dirPath + faceValue + ".jpg";
                document.gameBoard[i].faceValue = faceValue;
            }
            document.gameBoard[ending].src = dirPath + "0.jpg";
            document.gameBoard[ending].faceValue = 0;

            var blankTile = 15;

            for (i = 0; i < ending; i++)
            {
                document.solutionBoard[i].src = dirPath + (i+1) + ".jpg";
            }
            document.solutionBoard[ending].src = dirPath + "0.jpg";
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
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                </tr>
                <tr height="100">
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                    <td width="100"><img src="" name="gameBoard"/></td>
                </tr>
            </table>
        </td>
        <td width="200" valign="middle" align="center">
            <input type="button" value="Start Game!" onClick=""><br /><br /><br />
            Score: 0
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
</table>
</body>
</html>