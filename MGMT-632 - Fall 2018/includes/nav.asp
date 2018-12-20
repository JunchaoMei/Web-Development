<%      Set conn = Server.CreateObject("ADODB.Connection") 'Set DB connection variable
        conn.Open dbConn 'open database connection 
 
        SQLDept = "select deptID, name from department;" 'Select all departments
        Set RSDept = conn.Execute(SQLDept) 'Execute query to display the departments

        SQLOrder = "select count(*) as TOTAL from orderItems where OID = '" & session("cartID") & "'"
        Set RSOrder = conn.Execute(SQLOrder)
        intItems = RSOrder("TOTAL")
%>

<!DOCTYPE html>
<html>
<head>
	<title>navigation</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="includes/styles.css">
</head>
<body>
    <table bgcolor="#3a3f42" border="0" cellSpacing="0" cellPadding="0" align="center" valign="middle">
      <tbody>
        <tr height="71" align="center" valign="bottom">
            <td width="176"><img src="images/icon_login.png"></td>
            <td width="119"><img src="images/icon_favor.png"></td>
            <td width="148"><img src="images/icon_recent.png"></td>
            <td width="170"><a href="index.asp?pageID=5"><div id="cartListing" style="display:inline; font-family:Calibri; font-size:15pt;">Cart(<% =intItems %>)</div><br /><img src="images/cart.png"></a></td>
        </tr>
        <tr height="30" align="center" valign="top">
            <td width="176"><div id="loginDisplay" style="display:inline;"><% =session("loginText") %></div></td>
            <td width="119"><a class="personal" href="index.asp?pageID=103">Favorites</a></td>
            <td width="148"><a class="personal" href="index.asp?pageID=104">Recent Visits</a></td>
            <td width="170" valign="middle"><a class="personal" href="index.asp?pageID=4">Contact us</a></td>
        </tr>
        <tr height="49" valign="middle" align="center">
            <td colspan="4">
                <ul class="primary">
                    <table width="560" border="0" cellpadding="0" cellspacing="0"><tr valign="top">
                        <%
                            ' Loop through all departments and display the link
                            do while not RSDept.eof ' Loop through the recordset until you reach the end
                        %>
                        <td width="140" align="center"><li>
                            <a class="menu" href="index.asp?pageID=1&deptID=<%=RSDept("deptID")%>"><%=RSDept("name")%></a>
                            <ul class="secondary">
                                <table bgcolor="#3a3f42" cellpadding="0" cellspacing="0">
                                    <%  
                                        'Select all categories for each deptID to create links to the category pages
                                        SQLcat = "select catID, name from category where deptID=" & RSDept("deptID") & ";"
                                        Set RScat = conn.Execute(SQLcat) 'Execute query to display the categories
                                        do while not RScat.eof
                                    %>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2&catID=<%=RScat("catID")%>"><%=RScat("name")%></a></td></tr>
                                    <%
                                        RScat.movenext
                                        Loop
                                        RScat.Close() 'Close the category recordset 
                                    %>
                                </table>
                            </ul>
                        </li></td>
                        <%
                            RSDept.movenext ' Move to the next record in your record set
                            Loop ' Loop back to the top
                        %>
                    </tr></table>
                </ul>
            </td>
        </tr>
      </tbody>
    </table>
</body>
</html>

<%
    RSOrder.Close()
    RSDept.Close() 'Close the department recordset
    conn.close 'Close the database connection
%> 