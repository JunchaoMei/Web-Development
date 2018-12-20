<%
    loginAttempt = int(Request.Form.Item("loginAttempt"))
    
    If loginAttempt=1 Then
        'CODE TO LOGIN USER 
        struName=Request.Form.Item("email")
        strpWord=Request.Form.Item("pw")
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open dbConn
        SQLValidate = "select count(*) as TOTAL from customer where email='" & struName & "' and pword='" & strpWord & "';"
        SQLcustomerName = "select custID, fName from customer where email='" & struName & "' and pword='" & strpWord & "';"
        Set RSValidate = conn.Execute(SQLValidate)

        If RSValidate("TOTAL")=1 Then
            'log the user in
            Set RSlogin = conn.Execute(SQLcustomerName)
            strOldVID = session("visitorID")
            SQLUpdate = "UPDATE orders set custID = " & RSlogin("custID") & " WHERE visitorID= '" & strOldVID & "';"
            SQLcartID = "SELECT OID from orders where visitorID = '" & strOldVID &"' and custID = " & RSlogin("custID")
            SQLcartValidate = "SELECT count(*) as TOTAL from orders where visitorID = '" & strOldVID &"' and custID = " & RSlogin("custID")
            Set RSUpdate = conn.Execute(SQLUpdate)
            Set RScartValidate = conn.Execute(SQLcartValidate)
            Set RSgetCart = conn.Execute(SQLcartID)
            If RScartValidate("TOTAL") > 1 Then
                session("cartID") = RSgetCart("OID")
            End If
            session("loginText") = "<p style='font-family:Gabriola; font-size:15pt; color:white;'>Hi, " & RSlogin("fName") & "(<a href='index.asp?pageID=6&logout=1' class='personal' style='font-size:13pt;'>Logout</a>)</p>"
            session("getVisitorID") = 1
            session("visitorID") = RSlogin("custID")
            session("userName") = RSlogin("fName")
            RSlogin.Close()
            'RSUpdate.Close()
            RSgetCart.Close()
            response.Redirect "index.asp"
        Else
            displayMessage = "Invalid Email or Password"
        End If

        RSValidate.Close()
        conn.Close
    End If

    strLogout = int(Request.QueryString.Item("logout"))

    If strLogout=1 Then
        'CODE TO LOG OUT & RESET THE SHOPPING CART
        session("loginText") = "<a class='personal' href='index.asp?pageID=6'>Login/</a><a class='personal' href='index.asp?pageID=7'>Sign-up</a>"
        session("getVisitorID") = 0
        session("visitorID") = ""
        session("userName") = ""
        session("cartID") = 0
        response.Redirect "index.asp"
    End If
%>

<table border="0" cellSpacing="0" cellPadding="0" width="600" align="center" bgcolor="white">
    <tr valign="middle" align="center" height="20"><td><h2>Login to Hummingbird Studio</h2><br /></td></tr>
    <tr valign="middle" align="center"><td><form name="loginForm" action="index.asp?pageID=6" method="post">
        Email:  <input type="text" name="email" placeholder="email address" value="<% =struName %>"/><br /><br />
        Password:  <input type="password" name="pw" placeholder="password" /><br /><br />
        <input type="hidden" name="loginAttempt" value="1" />
        <input type="submit" value="Login" style="font-family:Arial; font-weight:bold; font-size:13pt;" /><br /><br />
    </form></td></tr>
    <tr valign="middle" align="center"><td>
        <input type="button" value="Sign-Up" style="font-family:Arial; font-weight:bold; font-size:10pt;" onclick="location.href='index.asp?pageID=7'">
        &nbsp&nbsp<a href="" style="color:black;">Forget Password?</a><br /><br />
        <p style="font-weight:bold; font-size:15pt; color:red;"><% =displayMessage %></p>
    </td></tr>
</table><br /><br />