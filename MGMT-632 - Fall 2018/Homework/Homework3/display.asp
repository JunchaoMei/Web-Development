<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Homework 3 -->

<html>
<head>
	<title>Form Display</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
<%
    strfName=Request.QueryString.Item("fName")
    strlName=Request.QueryString.Item("lName")
    struserID=Request.QueryString.Item("userID")
    strpw=Request.QueryString.Item("pw")
    strgender=Request.QueryString.Item("gender")
    strnews=Request.QueryString.Item("news")
    strmajor=Request.QueryString.Item("major")
    strhobbies=Request.QueryString.Item("hobbies")
    strmessage=Request.QueryString.Item("message")
    strdate=Request.QueryString.Item("date")
%>
    First Name: <%=strfName %> <br />
    Last Name: <%=strlName %> <br />
    User ID: <%=struserID %> <br />
    Password: <%=strpw %> <br />
    Gender: <%=strgender %> <br />
    Newsletter:
        <% If strnews="on" Then %> subcribed
        <% Else %> unsubscribed
        <% End If %> <br />
    Major: <%=strmajor %> <br />
    Hobbies: <%=strhobbies %> <br />
    Message: <%=strmessage %> <br />
    Date: <%=strdate %> <br />
</body>