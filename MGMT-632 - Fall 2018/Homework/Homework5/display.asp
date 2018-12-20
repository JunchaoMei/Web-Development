<%
    strfName=Request.Form.Item("fName")
    strlName=Request.Form.Item("lName")
    struserID=Request.Form.Item("userID")
    strpw=Request.Form.Item("pw")
    strgender=Request.Form.Item("gender")
    numage=cint(Request.Form.Item("age"))
    strnews=Request.Form.Item("news")
    If Request.Form.Item("news")="on" Then
       strnews="subcribed"
    Else
       strnews="unsubscribed"
    End If
    strmajor=Request.Form.Item("major")
    strhobbies=Request.Form.Item("hobbies")
    strmessage=Request.Form.Item("message")
    strdate=Request.Form.Item("date")

    strData = strfName & CHR(9) & strlName & CHR(9) & struserID & CHR(9) & strpw & CHR(9) & strgender & CHR(9) & numage & CHR(9) & strnews & CHR(9) & strmajor & CHR(9) & strhobbies & CHR(9) & strmessage & CHR(9) & strdate
    strFileLocation = Server.MapPath("formData.txt")
    Const ForReading = 1, ForWriting = 2, ForAppending = 8
    dim objFSO, objOpenFile
    set objFSO=Server.CreateObject("Scripting.FileSystemObject")
    set objOpenFile=objFSO.OpenTextFile(strFileLocation, ForAppending, true)
    objOpenFile.writeLine(strData)
    objOpenFile.close
    set objOpenFile=nothing
%>

<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Homework 5 -->

<html>
<head>
	<title>Form Display</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" align="center">
    <tr align="center">
        <td>#</td>
        <td>First Name</td>
        <td>Last Name</td>
        <td>userID</td>
        <td>Password</td>
        <td>Gender</td>
        <td>Age</td>
        <td>Newsletter</td>
        <td>Major</td>
        <td>Hobbies</td>
        <td>Message</td>
        <td>Date</td>
    </tr>
    <%  'Beginning ASP code to read the file and loop through the data
        dim objReadFile
        set objReadFile=objFSO.OpenTextFile(strFileLocation, ForReading, false)

        Do Until objReadFile.AtEndOfStream
            strLineNumber = objReadFile.Line
            strLineData = objReadFile.ReadLine
            strDataArray=Split(strLineData, CHR(9))
    %> 
    <tr align="center"><td width="700" colspan="12" height="20"></td></tr>
    <tr align="center"><td><% = strLineNumber %></td>
        <% for each strValue in strDataArray %>
            <td><% =strValue %></td>
        <% next %>
    </tr>
    <%  Loop

        'Ending ASP code that loops back to the top and then closes the file
        objReadFile.close
        set objReadFile=nothing
        set objFSO=nothing
    %>
</table>
</body>