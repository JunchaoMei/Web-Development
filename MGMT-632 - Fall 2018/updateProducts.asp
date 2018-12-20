<!--#include file="includes/dbconn.asp"-->
<!--#include file="includes/validateBackEnd.asp"-->
<link href="includes/stylesBE.css" rel="stylesheet" type="text/css">

<%
    'Step 1a: Open a database connection
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConn

    'Step 2: Declare your variables
    checkMode = Request.QueryString.Item("mode")
    strSearchID = Request.Form.Item("searchID")
    If strSearchID="" Then
        strSearchID=0
    Else
        strSearchID = strSearchID
    End If
    strSearchName = Request.Form.Item("searchName")
    If strSearchName="" Then
        strSearchName="Null"
    End If
    strSearchCatID = Request.Form.Item("searchCatID")
    strSearchDeptID = Request.Form.Item("searchDeptID")
    strProdName = Request.Form.Item("prodName")
    strHeadline = Request.Form.Item("prodHeadline")
    strDesc = Request.Form.Item("desc")
    strTImage = Request.Form.Item("tImage")
    strNImage = Request.Form.Item("nImage")
    strRPrice = Request.Form.Item("rPrice")
    strSPrice = Request.Form.Item("sPrice")
    strCatID = Request.Form.Item("catID")
    strKeywords = Request.Form.Item("keywords")
    strButton = Request.Form.Item("submitForm")
    strHeader = "Add New Product"
    strErrorMessage = ""
    strIsErrors = "N"
    'The variables below are used for formatting and already set for you. 
    'They identify the colors used in the header, divider and rows of your output.
    'Feel free to change the colors once you have finished the program if you wish.
    headerColor = "#226e24"
    dividerColor = "#000000"
    rowColor = "#caf5cb"

    'Step 3: Actions based on checkMode variable
    If checkMode="4" Then
        sMode="4"
        strProdID = Request.QueryString("prodID")
    Elseif checkMode="9" Then
        strErrorMessage = "Your product was deleted"
    Else
        strProdID = Request.Form.Item("prodID")
        sMode = Request.Form.Item("mode")
    End If
    'Step 4: Check Button that was clicked
    If strButton="Add New Product" or strButton="Clear Form" Then
        Response.Redirect("updateProducts.asp")
    Elseif strButton="Delete Product" Then
        SQLdeleteProd = "Delete from product where prodID = " & strProdID
        conn.Execute(SQLdeleteProd)
        Response.Redirect("updateProducts.asp?mode=9")
    Elseif strButton="Save Changes" Then
        validateProduct()
        If strIsErrors="N" Then
            SQLupdateProd = "Update product set prodName = '" & strProdName & "', prodHeadline = '" & strHeadline & "', [desc] = '" & strDesc & "', tImage = '" & strTImage & "', nImage = '" & strNImage & "', rPrice = " & strRPrice & ", sPrice = " & strSPrice & ", catID = " & strCatID & ", keywords = '" & strKeywords & "' where prodID = " & strProdID
            conn.Execute(SQLupdateProd)
            strErrorMessage = "Your changes were saved"
        End If
    Elseif strButton="Add Product" Then
        validateProduct()
        checkProdID()
        If strIsErrors="N" Then
            SQLaddProduct = "insert into product values (" & strProdID & ", '" & strProdName & "', '" & strHeadline & "', '" & strDesc & "', '" & strTImage & "', '" & strNImage & "', " & strRPrice & ", " & strSPrice & ", " & strCatID & ", '" & strKeywords & "')"
            conn.Execute(SQLaddProduct)
            sMode="4"
            strErrorMessage="Your product was added"
        End If
    End If
%>

<html>
<head>
<title>Hummingbird Studio - Backend</title>
</head>

<body bgcolor="#f8f8f8">
<center>

    <table cellspacing="0" cellpadding="0" border="0" width="1024">
        <tr>
            <td><img src="images/logoblk.png" /></td>
        </tr>
        <tr bgcolor="#226e24">
            <td class="normalWhite" align="center" height="30" valign="middle">
                Hummingbird Studio Product Management
            </td>
        </tr>
    </table>

    <table cellspacing="0" cellpadding="0" border="1" width="1024">
        <tr>
            <td align="center">
                <table cellspacing="0" cellpadding="0" border="0" width="1004">
                    <tr><td colspan="14" height="10"></td></tr>
                    <tr>
                        <td colspan="14" class="pageHeading">
                            Search Criteria
                        </td>
                    </tr>
                    <tr><td colspan="14" height="10"></td></tr>

                    <form action="updateProducts.asp" method="post">
                        <input type="hidden" name="mode" value="1" />
                        <tr>
                            <td colspan="14" class="normal">
                                <% If strSearchID = 0 Then %>
                                    Product ID: <input type="text" name="searchID" value="" class="searchBoxes">
                                <% Else %>
                                    Product ID: <input type="text" name="searchID" value="<% =strSearchID %>" class="searchBoxes">
                                <% End If %>
                                &nbsp;&nbsp;&nbsp;
                                <% If strsearchName = "Null" Then %>
                                    Name: <input type="text" name="searchName" value="" class="searchBoxes">
                                <% Else %>
                                    Name: <input type="text" name="searchName" value="<% =strsearchName %>" class="searchBoxes">
                                <% End If %>
                                &nbsp;&nbsp;&nbsp;
                                Category: 
                                <select name="searchCatID" class="searchBoxes">
                                    <option value="0">--</option>
                        <%
                            SQLcatIDList = "select catID, name from category"
                            Set rsCatIDList = conn.Execute(SQLcatIDList)
                            
                            do while not rsCatIDList.eof
                                If rsCatIDList("catID") = CSng(strsearchCatID) Then
                        %>
                                    <option value="<% =rsCatIDList("catID") %>" selected><% =rsCatIDList("name") %></option>
                        <%
                                Else
                        %>      
                                    <option value="<% =rsCatIDList("catID") %>"><% =rsCatIDList("name") %></option>
                        <%
                                End If
                            rsCatIDList.movenext
                            loop

                            rsCatIDList.close
                            set rsCatIDList=nothing

                        %>
                                </select>
                                &nbsp;&nbsp;&nbsp;
                                Department:
                                <select name="searchDeptID" class="searchBoxes">
                                    <option value="0">--</option>
                        <%
                            SQLdeptIDList = "select deptID, name from department"
                            Set rsDeptIDList = conn.Execute(SQLdeptIDList)

                            do while not rsDeptIDList.eof
                                If rsDeptIDList("deptID") = CSng(strsearchDeptID) Then
                        %>
                                    <option value="<% =rsDeptIDList("deptID") %>" selected><% =rsDeptIDList("name") %></option>
                        <%
                                Else
                        %>      
                                    <option value="<% =rsDeptIDList("deptID") %>"><% =rsDeptIDList("name") %></option>
                        <%
                                End If
                            rsDeptIDList.movenext
                            loop

                            rsDeptIDList.close
                            set rsDeptIDList=nothing
                        %>
                                </select>
                                &nbsp;&nbsp;&nbsp;
                                <input type="submit" value="Search" class="searchButton">
                            </td>
                        </tr>
                    </form>
            <% IF sMode = "1" Then %>
                    <tr><td colspan="14" height="20"></td></tr>
                    <tr><td colspan="14" height="1" bgcolor="#000000"></td></tr>
                    <tr><td colspan="14" height="20"></td></tr>
                    <tr><td colspan="14" class="pageHeading">Results</td></tr>
                    <tr><td colspan="14" height="10"></td></tr>
                    <tr>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="100" bgcolor="<% =headerColor %>" class="normalWhite">Product ID</td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="1" bgcolor="<% =dividerColor %>"></td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="546" bgcolor="<% =headerColor %>" class="normalWhite">Product Name</td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="1" bgcolor="<% =dividerColor %>"></td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="160" bgcolor="<% =headerColor %>" class="normalWhite">Department</td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="1" bgcolor="<% =dividerColor %>"></td>
                        <td width="5" bgcolor="<% =headerColor %>"></td>
                        <td width="160" bgcolor="<% =headerColor %>" class="normalWhite">Category</td>
                    </tr>
            <%
                SQLsearchProducts = "select p.prodID, p.prodName, c.name as 'catName', d.name as 'deptName' from product p, category c, department d where p.catID = c.catID and c.deptID = d.deptID and (p.prodID = " & strSearchID & " or c.catID = " & strsearchCatID & " or d.deptID = " & strsearchDeptID & " or p.prodName like ('%" & strsearchName & "%'))"
                Set rsSearch = conn.Execute(SQLsearchProducts)

                do while not rsSearch.eof
                    If rowColor = "#caf5cb" Then
                        rowColor = "#ffffff"
                    Else
                        rowColor = "#caf5cb"
                    End If
            %>
                    <tr>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =rowColor %>" class="normal"><a href="updateProducts.asp?mode=4&prodID=<% =rsSearch("prodID") %>"><% =rsSearch("prodID") %></a></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =dividerColor %>"></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =rowColor %>" class="normal"><% =rsSearch("prodName") %></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =dividerColor %>"></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =rowColor %>" class="normal"><% =rsSearch("catName") %></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =dividerColor %>"></td>
                        <td bgcolor="<% =rowColor %>"></td>
                        <td bgcolor="<% =rowColor %>" class="normal"><% =rsSearch("deptName") %></td>
                    </tr>
            <%
                    rsSearch.movenext
                loop

                rsSearch.close
                set rsSearch=nothing
            %>
            <% End If %>

                    <tr><td colspan="14" height="10"></td></tr>
                </table>
            </td>
        </tr>
    </table>
    <br />

    <form action="updateProducts.asp?mode=3" method="post">
    <table cellspacing="0" cellpadding="0" border="0" width="1024" style="border:2px solid; border-color:#185621">
        <tr><td height="10" colspan="5"></td></tr>
            <% 
                IF sMode = "4" or sMode = "3" Then 
                    SQLDisplayProduct = "select prodID, prodName, prodHeadline, [desc], tImage, nImage, rPrice, sPrice, catID, keywords from product where prodID =  " & strProdID
                    Set rsDisplayProduct = conn.Execute(SQLDisplayProduct)
                    
                    strProdID = rsDisplayProduct("prodID")
                    strProdName = rsDisplayProduct("prodName")
                    strHeadline = rsDisplayProduct("prodHeadline")
                    strDesc = rsDisplayProduct("desc")
                    strTImage = rsDisplayProduct("tImage")
                    strNImage = rsDisplayProduct("nImage")
                    strRPrice = rsDisplayProduct("rPrice")
                    strSPrice = rsDisplayProduct("sPrice")
                    strCatID = rsDisplayProduct("catID")
                    strKeywords = rsDisplayProduct("keywords")
                    strHeader = "Update Product"    
            %>
                    <input type="hidden" name="mode" value="3" />
            <%
                End If 
            %>
        <tr><td width="10"></td><td class="pageHeading" colspan="4"><% =strHeader %></td></tr>
        <tr><td width="10"></td><td class="errorRed" height="30" colspan="4"><% =strErrorMessage %></td></tr>
        <tr>
            <td width="10"></td>
            <td width="450" align="left" valign="top">
                <table cellspacing="0" cellpadding="0" border="0" width="350" >
	                <tr>
		                <td class="normal" valign="top">
                            Product ID
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
            <% 
                IF sMode = "4" or sMode = "3" Then 
            %>
                            <span class="displayOnlyBox">&nbsp;<% =strProdID %></span>
                            <input type="hidden" value="<% =strProdID %>" name="prodID" />
            <% 
                Else
            %>
                            <input type="text" value="<% =strProdID %>" name="prodID" class="backendBoxes">
            <% 
                End If
            %>
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Product Name
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strProdName %>" name="prodName" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Product Headline
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strHeadline %>" name="prodHeadline" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Description
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strDesc %>" name="desc" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Regular Price
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strRPrice %>" name="rPrice" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Sale Price
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strSPrice %>" name="sPrice" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Department: Category
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <select name="catID" class="backendBoxes">
                                    <option value="0">--</option>
                        <%
                            SQLcatID = "select c.catID, c.name as 'catName', d.name as 'deptName' from category c, department d where c.deptID = d.deptID"
                            Set rsCatID = conn.Execute(SQLcatID)
                            
                            do while not rsCatID.eof
                                If rsCatID("catID") = CSng(strCatID) Then
                        %>
                                    <option value="<% =rsCatID("catID") %>" selected><% =rsCatID("deptName") %>: <% =rsCatID("catName") %></option>
                        <%
                                Else
                        %>      
                                    <option value="<% =rsCatID("catID") %>"><% =rsCatID("deptName") %>: <% =rsCatID("catName") %></option>
                        <%
                                End If
                                
                                rsCatID.movenext
                            loop

                            rsCatID.close
                            set rsCatID=nothing

                        %>
                                </select>
	                </td>
	                </tr>
                    <tr><td height="25"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Keywords
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strKeywords %>" name="keywords" class="backendBoxes">
		                </td>
	                </tr>
                </table>
            </td>
            <td width="54"></td>
            <td width="500" align="left" valign="top">
                <table cellspacing="0" cellpadding="0" border="0" width="350" >
	                <tr>
		                <td class="normal" valign="top">
                            Thumb Image (Max Width: 100px)
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strTImage %>" name="tImage" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <img src="<% =strTImage %>">
		                </td>
	                </tr>
                    <tr><td height="20"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            Normal Image (Max Width: 191px)
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <input type="text" value="<% =strNImage %>" name="nImage" class="backendBoxes">
		                </td>
	                </tr>
                    <tr><td height="5"></td></tr>
	                <tr>
		                <td class="normal" valign="top">
                            <img src="<% =strNImage %>">
		                </td>
	                </tr>
                </table>
            </td>
            <td width="10"></td>
        </tr>
        <tr><td height="40" colspan="5"></td></tr>
        <tr>
            <td align="center" colspan="5">
              <% 
                IF sMode = "4" or sMode = "3" Then 
              %>
                  <input type="submit" name="submitForm" value="Save Changes" class="backEndButtons">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="submit" name="submitForm" value="Delete Product" class="backEndButtons">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="submit" name="submitForm" value="Add New Product" class="backEndButtons">
              <% 
                Else 
              %>
                  <input type="submit" name="submitForm" value="Add Product" class="backEndButtons">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="submit" name="submitForm" value="Clear Form" class="backEndButtons">

              <% 
                End If
              %>
            </td>
        </tr>
        <tr><td height="20" colspan="5"></td></tr>
        </form>
    </table>
</center>
</body>
</html>
<%

    'Step 1b: Close database connection
    conn.Close

%>