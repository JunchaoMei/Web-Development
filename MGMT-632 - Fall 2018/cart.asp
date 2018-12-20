<%
    sMode=CSng(Request.Form.Item("mode"))
    sProdID=Request.Form.Item("prodID")
    sPrice=Request.Form.Item("price")
    sQty=Request.Form.Item("qty")

    If sMode=1 Then
        'add an itm
    Elseif sMode=2 Then
        call updateCart(sProdID, sQty)
        response.Redirect "index.asp?pageID=5"
    End if
%>

<br />
<table border="0" cellSpacing="0" cellPadding="0" align="center" bgcolor="white">
    <tr align="left"><td colspan="5" style="font-family:Arial; font-size:20pt; font-weight:bold;">Shopping Cart</td></tr>
    <%
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open dbConn

        SQLCart = "SELECT oi.prodID, oi.qty, oi.price, p.prodName FROM orderItems oi, product p where oi.prodID = p.prodID and oi.OID = " & session("cartID") & " order by oi.prodID "
        Set RScart = conn.Execute(SQLCart)
        SQLCount = "SELECT count(*) as 'TOTAL' FROM orderItems oi, product p where oi.prodID = p.prodID and oi.OID = " & session("cartID")
        Set RScount = conn.Execute(SQLCount)

    %>
    <tr height="10"></tr>
    <tr bgcolor="blue" style="color:white; font-family:Arial; font-size:12pt;">
        <td align="center" width="70">Delete</td>
        <td align="left" width="500">Item</td>
        <td align="center" width="100">Price</td>
        <td align="center" width="50">Quantity</td>
        <td align="center" width="100">Total</td>
    </tr>
    <form name="cart" action="index.asp?pageID=5" method="post">
        <input type="hidden" name="mode" value=2>
        <%  iCount = 0
            If RScount("TOTAL")>0 Then
                Do While iCount<RScount("TOTAL")
                    tempQty = CSng(RScart("qty"))
                    tempPrice = CSng(RScart("price"))
                    tempLineTotal = tempQty * tempPrice
        %>          <input type="hidden" name="prodID" value=<%=RScart("prodID")%>
                    <tr style="font-family:Arial;">
                        <td align="center"><input type="checkbox" name="deleteYN<%=iCount%>" value="Y" /></td>
                        <td align="left"><%=RScart("prodName")%></td>
                        <input type="hidden" name="price" value=<%=tempPrice%>/>
                        <td align="center">$&nbsp<%=tempPrice%></td>
                        <td align="center"><input type="text" name="qty" value=<%=tempQty%> style="width:20px;"/></td>
                        <td align="center">$&nbsp<%=tempLineTotal%></td>
                    </tr>
        <%          iCount=iCount+1
                    tempOrderTotal = tempOrderTotal + tempLineTotal
                    RScart.movenext
                Loop
            Else
        %>      <tr style="font-family:Arial; color:red; font-size:15pt;"><td colspan="5">&nbsp&nbsp There are no items in your cart!</td></tr>
        <%  End If  %>
        <tr height="10"></tr>
        <tr style="font-family:Arial; font-size:12pt;">
            <td></td>
            <td colspan="2" align="right"><input type="submit" value="Update Cart" style="font-weight:bold; font-size:12pt;"/></td>
            <td align="right"><b>Total:</b></td>
            <td align="center"><b>$&nbsp<%=FormatNumber(tempOrderTotal,2)%></b></td>
        </tr>
    </form>
    <tr height="15"></tr>
    <tr><td colspan="5" align="right"><input type="button" value="Proceed to Checkout" style="font-weight:bold; font-size:12pt;"/></td></tr>
</table>
<br />

<%
    RScart.Close()
    RScount.Close()
    conn.Close()
%>