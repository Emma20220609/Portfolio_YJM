<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<!DOCTYPE html>

<%
	//session.setMaxInactiveInterval(60*1); //1분후 세션만료(아무 움직임 없을시)
	String id = "";
	accountVO user  = (accountVO) session.getAttribute("accountVO");
	if(user != null)
	{
		id = user.id();
	}
%>
<html>
	<head>
		
		<title>메타벅스</title>
		<link rel="stylesheet" href="css/kiosk.css"/>
		<script src="js/jquery-3.6.0.js"></script>
	</head>
	<body>
		<table border=0  style="width:100%;">
			<tr>
				<td id="bar" colspan="2" style="text-align:left;padding:0px 0px 30px 0px; font-size:4rem;">
					<a style="color: white;text-decoration:none;" href="index.jsp">
					<img src="images/CoffeeLogo.png" height="80px" width="100px">
					HOME &nbsp;
					</a>
				</td>
			</tr>
			<tr>
				<td id="bar" colspan="2" style="text-align:right; width:100px; height:30px; font-size: 3rem; padding:0px 20px 30px 0px">
					<%
						if(id == null || id.equals(""))
						{
							%>
								안녕하세요
							<%
						}else
						{
							%>
							[<%= user.name() %>]님 환영합니다 &nbsp;&nbsp;&nbsp;<a id="mypagebtn" href="mypage.jsp">마이페이지</a></td>
							<%
						}	
					%>
				</td>
			</tr>
			<tr>
				<td id="bar"  height="130px" width="100px" style="text-align:center">
					<a id="menu" style="color: white" href="drinkmenu.jsp">음료</a>
				</td>
				<td id="bar" width="130px" style="text-align:center">
					<a id="menu" style="color: white" href="sidemenu.jsp">사이드 메뉴</a>
					</td>
			</tr>