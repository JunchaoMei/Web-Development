<%      Set conn = Server.CreateObject("ADODB.Connection") 'Set DB connection variable
        conn.Open dbConn 'open database connection 
 
        SQLDept = "select deptID, name from department;" 'Select all departments
        Set RSDept = conn.Execute(SQLDept) 'Execute query to display the departments 
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
            <td width="170"><a href="index.asp?pageID=5"><img src="images/cart.png"></a></td>
        </tr>
        <tr height="30" align="center" valign="top">
            <td width="176"><a class="personal" href="index.asp?pageID=101">Login/</a><a class="personal" href="index.asp?pageID=102">Sign-up</a></td>
            <td width="119"><a class="personal" href="index.asp?pageID=103">Favorites</a></td>
            <td width="148"><a class="personal" href="index.asp?pageID=104">Recent Visits</a></td>
            <td width="170" valign="middle"><a class="personal" href="index.asp?pageID=4">Contact us</a></td>
        </tr>
        <tr height="49" valign="middle" align="center">
            <td colspan="4">
                <ul class="primary">
                    <table width="560" border="0" cellpadding="0" cellspacing="0"><tr valign="top">
                        <td width="130"><li>
                            <a class="menu" href="index.asp?pageID=1&deptID=<%=RSDept("deptID")%>"><%=RSDept("name")%></a>
                            <ul class="secondary">
                                <table bgcolor="#3a3f42" cellpadding="0" cellspacing="0">
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Action</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Drama</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Horror</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Sci-fi</a></td></tr>
                                </table>
                            </ul>
                        </li></td>
                        <td width="170"><li>
                            <a class="menu" href="index.asp?pageID=2">TV Shows</a>
                            <ul class="secondary">
                                <table bgcolor="#3a3f42" cellpadding="0" cellspacing="0">
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Action</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Drama</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Horror</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Sci-fi</a></td></tr>
                                </table>
                            </ul>
                        </li></td>
                        <td width="130"><li>
                            <a class="menu" href="index.asp?pageID=2">Music</a>
                            <ul class="secondary">
                                <table bgcolor="#3a3f42" cellpadding="0" cellspacing="0">
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Country</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Hip Hop</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Pop</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Rock</a></td></tr>
                                </table>
                            </ul>
                        </li></td>
                        <td width="130"><li>
                            <a class="menu" href="index.asp?pageID=2">Games</a>
                            <ul class="secondary">
                                <table bgcolor="#3a3f42" cellpadding="0" cellspacing="0">
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Play Station</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">PC</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">Wii</a></td></tr>
                                    <tr><td><a class="submenu" href="index.asp?pageID=2">xBox</a></td></tr>
                                </table>
                            </ul>
                        </li></td>
                    </tr></table>
                </ul>
            </td>
        </tr>
      </tbody>
    </table>
</body>
</html>

<%
    RSDept.Close() 'Close the department recordset
    conn.Close 'Close the database connection
%> 