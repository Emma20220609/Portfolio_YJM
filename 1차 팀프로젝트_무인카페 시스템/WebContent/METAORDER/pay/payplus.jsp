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
		<script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
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
						카드추가
					</h2>
				</td>
			</tr>
			<tr style="height:500px; ">
				<td colspan="4" valign=top style="box-shadow: 5px 5px 5px 5px gray;">
					<form method="post" action="#" name="payadd">
						<div style="position: relative; left: 80px; top: 100px;">
							카드명<input style="width:245px;" type="text" name="cardname">
						</div> 
						<div style="position: relative; left: 65px; top: 150px;">
							카드번호<input style="width:50px;" type="text" name="cardno1">-<input style="width:50px;" type="text" name="cardno2">-<input style="width:50px;" type="text" name="cardno3">-<input style="width:50px;" type="text" name="cardno4">
						</div>
						<div style="position: relative; left: 98px; top: 200px;">
							CVC<input style="width:245px;" type="text" name="cardno5">
						</div> 
						<div style="position: relative; left: 175px; top: 300px;">
							<a class="btn" href="index.jsp">등록하기</a>
						</div>					
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>