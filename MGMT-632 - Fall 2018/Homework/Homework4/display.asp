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
    numage=cint(Request.QueryString.Item("age"))
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
<%
    Select Case True
    Case numage<13
        strage="didn't select"
    Case numage<18
        strage="Your age is " & numage & ". Your are a minor"
    Case numage<=21
        strage="Your age is " & numage & ". Your are an adult under 21"
    Case numage<=24
        strage="Your age is " & numage & ". An adult with expensive car insurance"
    Case numage<=29
        strage="Your age is " & numage & ". An adult with cheaper car insurance"
    Case numage<=39
        strage="Your age is " & numage & ". Middle age years"
    Case numage<=64
        strage="Your age is " & numage & ". The Golden Years"
    Case numage<=100
        strage="Your age is " & numage & ". Enjoying a life of retirement"
    Case Else
        strage="Invalid age!"
    End Select
%>
    Age: <%=strage %> <br />
    Newsletter:
        <% If strnews="on" Then %> subcribed
        <% Else %> unsubscribed
        <% End If %> <br />
    Major: <%=strmajor %> <br />
    Hobbies: <%=strhobbies %> <br />
    Message: <%=strmessage %> <br />
    Date: <%=strdate %> <br />
</body>