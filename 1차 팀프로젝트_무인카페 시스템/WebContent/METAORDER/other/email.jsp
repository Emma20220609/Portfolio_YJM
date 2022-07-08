<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<link type="text/css" rel="stylesheet" href="../css/email.css">
		<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
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
					이메일문의
				</h2>
			</td>
		</tr>
		<tr>
			<td>
				<header>이메일 문의하기</header>
				<form id="email" class="topBefore" method="get" action="emailsendok.jsp">
					<input name="name" id="name" type="text" placeholder="NAME">
					<input name="email" id="email" type="text" placeholder="E-MAIL">
					<textarea name="message" id="message" type="text" placeholder="MESSAGE"></textarea>
					<input id="submit" type="submit" value="GO!">
				</form>
		    </td>
	    </tr>
    </table>
	</body>