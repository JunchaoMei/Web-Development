<%
    strfName=Request.Form.Item("fName")
    strlName=Request.Form.Item("lName")
    stremail=Request.Form.Item("email")
    strvEmail=Request.Form.Item("vEmail")
    strphone=Request.Form.Item("phone")
    strbirth=Request.Form.Item("birth")
    strgender=Request.Form.Item("gender")
    strpw=Request.Form.Item("pw")
    strvPw=Request.Form.Item("vPw")
    strcreateAccount=Request.Form.Item("createAccount")

    If strcreateAccount=1 Then
        'initialize
        strError="N"
        strErrorMessage=""
        Dim objRegExp1
        Set objRegExp1 = New RegExp
        objRegExp1.IgnoreCase = True

        'validating fName
        objRegExp1.Pattern = "[^a-zA-Z'\-]"
        If objRegExp1.Test(strfName) or Len(strfName)<3 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The first name field must contain >=3 characters of letter, apostrophe or hyphen<br /><br />"
        End If

        'validating lName
        objRegExp1.Pattern = "[^a-zA-Z'\-]"
        If objRegExp1.Test(strlName) or Len(strlName)<3 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The last name field must contain >=3 characters of letter, apostrophe or hyphen<br /><br />"
        End If

        'validating email format
        objRegExp1.Pattern = "^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
        If Not objRegExp1.Test(stremail) Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The email field is not valid<br /><br />"
        End If

        'validating email duplication
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open dbConn
        SQLCheckEmail = "SELECT count(email) as TOTAL FROM customer WHERE email = '" & strEmail & "';"
        Set RSCheckEmail = conn.Execute(SQLCheckEmail)
        emailExist = RSCheckEmail("TOTAL")
        If emailExist > 0 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "This email address has already been taken"
        End If

        'validating vEmail
        If stremail<>strvEmail Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "Email address doesn't match<br /><br />"
        End If
        
        'validating phone
        objRegExp1.Pattern = "\d{3}-\d{3}-\d{4}"
        If Len(strphone)<1 Then
            strphone = NULL
        Elseif Not objRegExp1.Test(strphone) Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "Wrong input format for phone number<br /><br />"
        Elseif Len(strphone)>12 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "Incorrect length of phone number<br /><br />"
        Else
            strphone = replace(Request.Form.Item("phone"),"-","")
        End If

        'validating birth
        If Not IsDate(strbirth) Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "Not a valid birthday<br /><br />"
        End If

        'validating gender
        If Len(strgender)<1 Then
            strgender = "0"
        End If

        'validating pw
        If Len(strpw)<=6 Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "The length of password must be longer than 6"
        End If

        'validating vPw
        If strpw<>strvPw Then
            strErrors = "Y"
            strErrorMessage = strErrorMessage & "Password doesn't match<br /><br />"
        End If

        'Error exists?
        If strErrors = "Y" Then
            formOutputMessage = strErrorMessage
        Else
            'CODE TO CREATE ACCOUNT (start)
            If strbirth = "" Then
                SQLInsert = "INSERT into customer(email, fName, lName, phone, dob, gender, pword) values ('" & stremail & "','" & strfName & "','" & strlName & "','" & strphone & "', NULL ,'" & strgender & "','" & strpw & "');"
            ELSE
                SQLInsert = "INSERT into customer(email, fName, lName, phone, dob, gender, pword) values ('" & stremail & "','" & strfName & "','" & strlName & "','" & strphone & "','" & strbirth & "','" & strgender & "','" & strpw & "');"
            End IF
 
            SQLGetCustID = "SELECT max(custID) as cID from customer;"
            Set RSInsert = conn.Execute(SQLInsert)
            Set RSGetCustID = conn.Execute(SQLGetCustID)
            strOldVID = session("VisitorID")
            SQLUpdate = "UPDATE orders set custID = " & RSGetCustID("cID") & " WHERE visitorID= '" & strOldVID & "';"
            SQLcartValidate = "SELECT count(*) as TOTAL from orders where visitorID = '" & strOldVID &"' and custID = " & RSGetCustID("cID") 
            SQLcartID = "SELECT OID from orders where visitorID = '" & strOldVID &"' and custID = " & RSGetCustID("cID")
            Set RSUpdate = conn.Execute(SQLUpdate)
            Set RSCartValidate = conn.Execute(SQLcartValidate)
            Set RSCartID = conn.Execute(SQLcartID)

            If RSCartValidate("TOTAL")>0 Then
                session("cartID") = RSCartID("OID")
            End If

            session("loginText") = "Welcome " & strfName & " (<a href='index.asp?pageID=6&logout=1' class='personal'>Logout</a>)"
            session("getVisitorID") = 1
            session("visitorID") = RSGetCustID("cID")
            session("userName") = strfName
            
            RSCheckEmail.Close
            'RSInsert.Close
            RSGetCustID.Close
            'RSUpdate.Close
            RSCartValidate.Close
            RSCartID.Close
            conn.Close

            response.Redirect "index.asp"
            'CODE TO CREATE ACCOUNT (end)
            formOutputMessage = "Your account has been created!"
            strfName=""
            strlName=""
            stremail=""
            strvEmail=""
            strphone=""
            strbirth=""
            strgender=""
            strpw=""
            strvPw=""
        End If

        RSCheckEmail.Close
        conn.Close

    End If
%>

<table border="0" cellSpacing="0" cellPadding="0" width="600" align="center" bgcolor="white">
    <tr valign="middle" align="center" height="20"><td><h2>Sign-Up to Hummingbird Studio</h2><br /></td></tr>
    <tr valign="middle" align="center"><td><form name="signupForm" action="index.asp?pageID=7" method="post">
        <b>First Name</b><br />
        <input type="text" name="fName" value="<% =strfName %>" /><br /><br />
        <b>Last Name</b><br />
        <input type="text" name="lName" value="<% =strlName %>" /><br /><br />
        <b>Email</b><br />
        <input type="text" name="email" value="<% =stremail %>"/><br /><br />
        <b>Verify Email</b><br />
        <input type="text" name="vEmail" value="<% =strvEmail %>"/><br /><br />
        <b>Phone Number (###-###-####)</b><br />
        <input type="text" name="phone" value="<% =strphone %>" /><br /><br />
        <b>Birthday (MM/DD/YYYY)</b><br />
        <input type="text" name="birth" value="<% =strbirth %>" /><br /><br />
        <b>Gender</b><br />
        <input type="radio" name="gender" value='M'/>Male&nbsp&nbsp<input type="radio" name="gender" value='F'/>Female<br /><br />
        <b>Password</b><br />
        <input type="password" name="pw" /><br /><br />
        <b>Verify Password</b><br />
        <input type="password" name="vPw" /><br /><br />
        <input type="hidden" name="createAccount" value="1" /><br />
        <% if strcreateAccount = 1 Then %>
            <p align="left" style="color:red; font-family:'Times New Roman'; font-size:12pt;"><% =formOutputMessage %></p><br />
        <% End If %>
        <input type="submit" value="Create Account" style="font-family:Arial; font-weight:bold; font-size:15pt;" /><br /><br />
    </form></td></tr>
</table><br /><br />

<%
    'RSCheckEmail.Close
    'RSInsert.Close
    'RSGetCustID.Close
    'RSUpdate.Close
    'RSCartValidate.Close
    'RSCartID.Close
    'conn.Close
%>