<%@ Language=VBScript %>
<!--#include file="includes/dbconn.asp"-->
<!--#include file="includes/common.asp"-->
<script src="includes/commonJs.js?ver=1"></script >
<%
    call getCustID()
    'response.Write("VisitorID: " & session("VisitorID") & " cartID: " & session("cartID"))
%>
<% 'On Error Resume Next %>

<!DOCTYPE html>
<!-- Junchao Mei, MGMT-632, Fall 2018, Project -->
<!-- fixed-size page designed for monitor resolution width=1536 & scale=100% (default in this virtual machine)-->

<html>
<head>
	<title>Hummingbird Studio</title>
	<meta name="author" content="Junchao Mei"/>
	<meta charset=utf-8"/>
    <!--#include file="includes/functions.asp"-->
    <script src="includes/functions.js?ver=1"></script >
	<link rel="stylesheet" type="text/css" href="includes/styles.css?ver=1">
</head>

<body class="index">
<% sPageID = Request.QueryString("pageID") %>
<table border="0" cellSpacing="0" cellPadding="0" width="1237" align="center">
  <tbody>
    <tr height="150" bgcolor="#3a3f42" valign="top">
        <td width="624"><!--#include file="includes/header.asp"--></td>
        <td width="613"><!--#include file="includes/nav.asp"--></td>
    </tr>
    <tr><td colspan="2">
        <% If sPageID=1 Then %>
            <!--#include file="department.asp"-->
        <% Elseif sPageID=2 Then %>
            <!--#include file="category.asp"-->
        <% Elseif sPageID=3 Then %>
            <!--#include file="product.asp"-->
        <% Elseif sPageID=4 Then %>
            <!--#include file="contact.asp"-->
        <% Elseif sPageID=5 Then %>
            <!--#include file="cart.asp"-->
        <% Elseif sPageID=6 Then %>
            <!--#include file="login.asp"-->
        <% Elseif sPageID=7 Then %>
            <!--#include file="createAccount.asp"-->
        <% Elseif sPageID=103 Then %>
            <!--#include file="includes/favorites.asp"-->
        <% Elseif sPageID=104 Then %>
            <!--#include file="includes/recentVisits.asp"-->
        <% Else %>
            <!--#include file="home.asp"-->
        <% End If %>
    </td></tr>
    <tr><td bgcolor="#f2f2f3" colspan="2"><!--#include file="includes/footer.asp"--></td></tr>
  </tbody>
</table>
</body>
</html>
