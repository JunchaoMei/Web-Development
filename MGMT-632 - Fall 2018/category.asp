<%
    catID = Request.QueryString("catID")
    IF NOT catID > 0 Then
        catID = 0 'If no catID is passed, set to 0
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
	<title>category</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="includes/styles.css">
</head>
<body>
<%
    SQLValidate = "select count(*) as Total from product where catID = " & catID & ";"
    Set RSvalidate = conn.Execute(SQLValidate)
 
    If RSvalidate("Total") = 0 Then
        Response.Redirect "index.asp?pageID=1"
    ELSE
        SQLStmt = "SELECT p.prodID, p.prodName, p.prodHeadline, p.tImage, c.name as cName, d.name as dName from product p, category c, department d where p.catID = c.catID and c.deptID = d.deptID and p.catID = " & catID & ";"
        Set RS = conn.Execute(SQLStmt)  
        strHeader = "Department: " & RS("dName") & " > " & "Category: " & RS("cName")
    End If
%>

<table border="0" cellSpacing="0" cellPadding="1" width="1237" align="center" bgcolor="#f2f2f3">
    <tr><td colspan="10"><h1><% =strHeader %></h1></td></tr>
    <tr>
        <% do while not RS.eof %>
        <td align="center" width="123">
            <a href="index.asp?pageID=3&prodID=<% =RS("prodID") %>"><img src="<% =RS("tImage") %>"></a><br />
            <a class="prodTitle" href="index.asp?pageID=3&prodID=<% =RS("prodID") %>"><% =RS("prodName") %></a><br />
            <p class="desc"><% =RS("prodHeadline") %></p>
        </td>
        <%
            RS.movenext
            Loop
        %>
    </tr>
</table>
</body>
</html>

<%
    RSvalidate.Close() 'Close the recordset
    RS.Close() 'Close the recordset
    conn.Close 'Close the database connection
%>