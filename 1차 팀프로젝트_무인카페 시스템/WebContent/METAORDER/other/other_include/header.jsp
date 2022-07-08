<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>

<%

accountVO user = (accountVO)session.getAttribute("login");

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
						Other
					</h2>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<%
							if( user == null )
							{
								%>로그인 하시면 서비스 이용이 가능합니다.<%
							}else
							{
								%><%= user.name() %>님 환영 합니다.<%
							}
						%>
					</h2>
				</td>
			</tr>