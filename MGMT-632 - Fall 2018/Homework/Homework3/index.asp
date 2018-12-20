<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Homework 3 -->

<html>
<head>
	<title>Forms</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <form name="cusInfo" action="display.asp" method="get">
        First Name: <input type="text" name="fName" /><br /><br />
        Last Name: <input type="text" name="lName" /><br /><br />
        User ID: <input type="text" name="userID" /><br /><br />
        Password: <input type="password" name="pw" /><br /><br />
        Gender: <input type="radio" name="gender" value="male"/>Male<input type="radio" name="gender" value="female"/>Female<br /><br />
        Newsletter: <input type="checkbox" name="news" checked="checked" />Receive<br /><br />
        Major:
        <select name="major">
            <option>MBA</option>
            <option>MS-ISA</option>
            <option>EMBA</option>
            <option>MACCT</option>
            <option>MBA-Ed</option>
            <option>3-2 MBA</option>
            <option>BBA</option>
            <option>BBA/MACCT</option>
            <option>AOL</option>
            <option>Certificates</option>
        </select><br /><br />
        Hobbies:<br />
        <select name="hobbies" size="5" multiple="multiple">
            <option>reading</option>
            <option>basketball</option>
            <option>tennis</option>
            <option>skiing</option>
            <option>ping pong</option>
            <option>singing</option>
            <option>piano</option>
            <option>guitar</option>
            <option>hunting</option>
            <option>hiking</option>
        </select><br /><br />
        Message: <input type="text" name="message" /><br /><br />
        <input type="hidden" name="date" value=<%=date() %> /><br /><br />
        <input type="submit" value="Submit" />
    </form>
</body>