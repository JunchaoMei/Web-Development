<%@ Language=VBScript %>
<!--#include file="dbconn.asp"-->

<%
    prodID = Request.QueryString("prodID")*1
    sPrice = Request.QueryString("sPrice")*1.0

    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConn

    If session("cartID")=0 Then
        currentDate = date
        
        If Left(session("visitorID"),1) = "v" Then
            SQLCreateCart = "INSERT into orders(visitorID, createDt, completedYN) values ('" & session("visitorID") & "','" & currentDate & "', 'N');"
        ELSE
            SQLCreateCart = "INSERT into orders(custID, createDt, completedYN) values ('" & session("visitorID") & "','" & currentDate & "', 'N');"
        End If 
 
        SQLgetCartID = "SELECT max(OID) as cartID from orders"
        Set rsCreateCart = conn.Execute(SQLCreateCart)
        Set rsGetCartID = conn.Execute(SQLgetCartID)
        session("cartID") = rsGetCartID("cartID")
 
        rsGetCartID.close
        set rsGetCartID=nothing
    End if

    SQLaddItem = "INSERT into orderItems(OID, prodID, qty, price) values (" & session("cartID") & "," & prodID & ", 1, " & sPrice & ");" 
    SQLcartTotal = "SELECT count(*) as TOTAL from orderItems where OID = '" & session("cartID") & "'"
    Set RSAddItem = conn.Execute(SQLaddItem)
    Set RSCartTotal = conn.Execute(SQLcartTotal)
    cartTotal = RSCartTotal("TOTAL")
%>

<%
    response.write(cartTotal & ",Your item was added to the cart. <a href='index.asp?pageID=5' style='color: purple;'>View Cart</a>")

    'RSAddItem.close
    RSCartTotal.close
    conn.Close
%>