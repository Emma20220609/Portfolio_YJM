<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>
<%
accountVO user = (accountVO)session.getAttribute("login");

if( user == null ) 
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = 'index.jsp';</script>");
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
			<tr>
				<td>
					<a href="index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						계정정보
					</h2>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4><a href="#">닉네임설정</a></h4></div>
				</td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4><a href="#">자주가는매장</a></h4></div>
				</td>
			</tr>
			<tr>
				<td align=center>
					<div style="position: relative; left: 0px; top: 450px;"><a href="logout.jsp">로그아웃</a></div>
				</td>
			</tr>
		</table>
	</body>
</html>