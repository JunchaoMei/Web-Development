<%
    prodID = Request.QueryString("prodID")
    IF NOT prodID > 0 Then
        prodID = 0 'If no prodID is passed, set to 0
    End IF
%>
<%
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConn
%>

<!DOCTYPE html>
<html>
<html>
<head>
	<title>product</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="includes/styles.css">
</head>
<body>
<%
    SQLValidate = "select count(*) as Total from product where prodID = " & prodID & ";"
    Set RSvalidate = conn.Execute(SQLValidate)
 
    If RSvalidate("Total") = 0 Then
%>
        <table cellspacing="0" cellpadding="0" border="0" width="1237" align="center" bgcolor="white">
            <tr><td height="5" colspan="2"></td></tr>
            <tr><td width="300" valign="top" rowspan="11"><h1>No Product Found</h1></td></tr>
        </table>
<%
    ELSE
        SQLStmt = "SELECT prodID, prodName, prodHeadline, [desc], nImage, rPrice, sPrice FROM product WHERE prodID = " & prodID & ";"  
        Set RS = conn.Execute(SQLStmt)
%> 
        <table border="0" cellSpacing="0" cellPadding="0" width="1237" align="center" bgcolor="white">
            <tbody>
                <tr><td colspan="2" height="20"></td></tr>
                <tr>
                    <td valign="top" align="center" width="300" rowspan="10"><img src="<% =RS("nImage") %>"></td>
                    <td valign="top" align="left" width="900" style="font-family:Calibri; font-weight:bold; font-size:25pt;"><% =RS("prodName") %></td>
                </tr>
                <tr><td valign="top" style="font-style:italic;"><% =RS("prodHeadline") %></td></tr>
                <%
                    regPrice = CSng(RS("rPrice"))
                    salePrice = CSng(RS("sPrice"))
                %>
                <% If salePrice<regPrice Then %>
                    <tr><td style="font-family:Arial; font-weight:bold; color:blue; text-decoration:line-through;"><% =FormatCurrency(RS("rPrice")) %></td></tr>
                    <tr><td style="font-family:Arial; font-weight:bold; color:red;"><% =FormatCurrency(RS("sPrice")) %></td></tr>
                <% Else %>
                    <tr><td style="font-family:Arial; font-weight:bold; color:red;"><% =FormatCurrency(RS("rPrice")) %></td></tr>
                <% End If %>
                <tr><td style="font-family:'Times New Roman';"><% =RS("desc") %></td></tr>
                <tr>
                    <td><input type="button" value="Add to Cart" onclick="addToCart(<% =prodID %>,<% =salePrice %>)" />&nbsp&nbsp&nbsp<div id="itemAdded" style="color:red; font-family:Arial; font-size:15pt;"></div></td>
                </tr>
            </tbody>
        </table>
<%
    End If
    RS.Close()
    RSvalidate.Close()
    conn.Close()
%>
</body>
</html>