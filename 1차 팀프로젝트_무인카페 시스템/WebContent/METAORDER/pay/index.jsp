<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>
<%
accountVO user = (accountVO)session.getAttribute("login");

if( user == null ) 
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = '../main/index.jsp';</script>");
	return;
}
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
	</head>
	<body>
		<table align=center width=500px>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						Pay
					</h2>
				</td>
			</tr>
			<tr style="height:500px; ">
				<td colspan="4" valign=top style="box-shadow: 5px 5px 5px 5px gray;">
					<div style="line-height:230px;text-align:center; width:400px; height:200px; border: 4px dashed #bcbcbc; margin-top:5px; margin-right:46px; margin-left:46px;">
						<div><a href="payplus.jsp"><img src="../img/plus.png"></a></div>
					</div>
				</td>
			</tr>
<%@ include file="pay_include/footer.jsp" %>