<%
    deptID = Request.QueryString("deptID")
    IF NOT deptID > 0 Then
        deptID = 0 'If no deptID is passed, set to 0
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
	<title>department</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="includes/styles.css">
</head>
<body>
<%
    SQLValidate = "select count(*) as Total from department where deptID = " & deptID & ";"
    Set RSvalidate = conn.Execute(SQLValidate)
 
    If RSvalidate("Total") = 0 Then
        SQLStmt = "select pageID=1, linkID='deptID', deptID as useID, name, [desc] from department;"
        Set RS = conn.Execute(SQLStmt)  
        strHeader = "Departments"
    ELSE
        SQLStmt = "SELECT pageID=2, linkID='catID', c.catID as useID, c.name, c.[desc], d.name as dName FROM category c, department d WHERE c.deptID = d.deptID and c.deptID = " & deptID & ";"
        Set RS = conn.Execute(SQLStmt)  
        strHeader = "Department: " & RS("dName")
    End If
%>

<table border="0" cellSpacing="0" cellPadding="0" width="1237" align="center" bgcolor="#f2f2f3">
    <tr><td><h1><% =strHeader %></h1></td></tr>
 
    <% do while not RS.eof %> 
 
    <tr><td>
        <a class="section" href="index.asp?pageID=<% =RS("pageID") %>&<% =RS("linkID") %>=<% =RS("useID") %>"><% =RS("name") %></a>
    </td></tr>
    <tr><td><% =RS("desc") %></td></tr>
 
    <%
        RS.movenext
        Loop
    %>
</table>
</body>
</html>

<%
    RSvalidate.Close() 'Close the recordset
    RS.Close() 'Close the recordset
    conn.Close 'Close the database connection
%>