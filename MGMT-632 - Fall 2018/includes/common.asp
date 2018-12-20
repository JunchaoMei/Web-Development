<%
Function getCustID()
    'ASP code for checking the customer ID End Function
    strActiveSession = session("getVisitorID")
    strHasCart = session("activeCart")
    
    If NOT strActiveSession = 1 Then
        call getVisitorID()
    Else
        If mid(session("visitorID"),1,1) = "v" Then
            session("loginText") = "<a class='personal' href='index.asp?pageID=6'>Login/</a><a class='personal' href='index.asp?pageID=7'>Sign-up</a>"
        Else
            session("loginText") = "<p style='font-family:Gabriola; font-size:15pt; color:white;'>Hi, " & session("userName") & " (<a href='index.asp?pageID=6&logout=1' class='personal' style='font-size:13pt;'>Logout</a>)</p>"
        End If
    End If
    
    If NOT strHasCart = 1 Then
        session("activeCart") = 1
        session("cartID") = 0
    End If

End Function


Function getVisitorID()
    'ASP code for creating a temporary visitor ID
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConn

    SQLGetvID1 = "Insert Into visitors(usedYN) values('Y')"
    SQLGetvID2 = "SELECT max(visitorID) as vID from visitors"
    Set rsCreateVIS = conn.Execute(SQLGetvID1)
    Set rsVisitorID = conn.Execute(SQLGetvID2)
    
    session("getVisitorID") = 1
    session("visitorID") = "v" & rsVisitorID("vID")
    
    session("loginText") = "<a class='personal' href='index.asp?pageID=6'>Login/</a><a class='personal' href='index.asp?pageID=7'>Sign-up</a>"
    
    rsVisitorID.close
    set rsVisitorID=nothing
    'rsCreateVIS.close
    'set rsCreateVIS=nothing
    conn.close
    set conn=nothing
End Function
%>

<%
Function updateCart(tempProdID, tempQty)
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConn
    
    sProductArray=split(tempProdID, ",")
    sQtyArray=split(tempQty, ",")

    For n = 0 to ubound(sProductArray)

        If Request.Form("deleteYN"& n) = "Y" Then
            tempSQL = "Delete from orderItems where OID = " & session("cartID") & " and prodID = " &sProductArray(n)
        ElseIf CSng(sQtyArray(n)) > 0 Then
            tempSQL = "UPDATE orderItems set qty = " & CSng(sQtyArray(n)) & " where OID = " & session("cartID") & " and prodID = " &sProductArray(n)
        Else
            tempSQL = "Delete from orderItems where OID = " & session("cartID") & " and prodID = " &sProductArray(n)
        End If
        
        conn.Execute(tempSQL)

    Next

    conn.Close()
End Function
%>