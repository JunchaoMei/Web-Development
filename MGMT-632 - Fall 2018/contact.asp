<%
    strname=Request.QueryString.Item("name")
    stremail=Request.QueryString.Item("email")
    strmessage=Request.QueryString.Item("message")
    strpageID=Request.QueryString.Item("pageID")
    strsubmitForm=Request.QueryString.Item("submitForm")
    strsubmitDate=Request.QueryString.Item("submitDate")
%>
<%  If strsubmitForm=1 Then
        'initialize
        strError="N"
        strErrorMessage=""
        Dim objRegExp
        Set objRegExp = New RegExp
        objRegExp.IgnoreCase = True

        'validating name
        objRegExp.Pattern = "^[a-z' \-]{3,}$"
        If Not objRegExp.Test(strname) Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The name field must contain >=3 characters of letter, apostrophe, space or hyphen<br /><br />"
        End If

        'validating email
        objRegExp.Pattern = "^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
        If Not objRegExp.Test(stremail) Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The email field is not valid<br /><br />"
        End If

        'validating message
        If Len(strmessage)<10 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The message field must contain ten or more characters<br /><br />"
        End If

        'Error exists?
        If strErrors = "Y" Then
            formOutputMessage = strErrorMessage
        Else
            'SEND EMAIL CODE START
            'strMessageBody = "Sender: " & strname & "<br><br>Send Date: " & strsubmitDate & "<br><br>Message: " & strmessage 
            'Set myMail = CreateObject("CDO.Message")
            'myMail.Subject = "Web Form Message"
            'myMail.From = stremail
            'myMail.To = "customerService@unm.edu"
            'myMail.HTMLBody = strMessageBody
            'myMail.Send
            'set myMail = nothing
            'SEND EMAIL CODE END
            formOutputMessage = "Your message has been sent!"
            strname=""
            stremail=""
            strmessage=""
        End If

    End If
%>

<!--  SEND EMAIL CODE
    strMessageBody = "Sender: " & strname & "<br><br>Send Date: " & strsubmitDate & "<br><br>Message: " & strmessage 
 
    Set myMail = CreateObject("CDO.Message")
    myMail.Subject = "Web Form Message"
    myMail.From = stremail
    myMail.To = "customerService@unm.edu"
    myMail.HTMLBody = strMessageBody
    myMail.Send
    set myMail = nothing
-->

<!DOCTYPE html>
<html>
<head>
	<title>contact</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="includes/styles.css">
</head>
<body>
<table border="0" cellSpacing="0" cellPadding="20" width="1237" align="center" bgcolor="#f2f2f3">
    <tbody>
        <tr valign="middle" style="font-family:Arial; font-size:30pt; font-weight:bold;"><td>Contact Hummingbrid Studio</td></tr>
        <tr><td style="font-family:Arial; font-size:15pt;">
            <form name="myForm" action="index.asp" method="get">
                Full Name: <input type="text" name="name" value="<% =strname %>" placeholder="use initial for middle name" /><br /><br />
                Email: <input type="text" name="email" value="<% =stremail %>"/><br /><br />
                Message: <br />
                <textarea name="message" value="<% =strmessage %>" cols=120 rows=15></textarea><br />
                <input type="hidden" name="pageID" value="4" />
                <input type="hidden" name="submitForm" value="1" />
                <input type="hidden" name="submitDate" value="<% =date() %>" /><br />
                <% if strsubmitForm = 1 Then %>
                    <p align="left" style="color:red; font-family:'Times New Roman'; font-size:12pt;"><% =formOutputMessage %></p><br />
                <% End If %>
                <input type="submit" value="Send" style="font-family:Arial; font-weight:bold; font-size:13pt;" /><br />
            </form>
        </td></tr>
    </tbody>
</table>
</body>
</html>