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
			<tr style="height:100px;">
				<td align=center>
					<h3>
						<div style="float:left"><a href="index.jsp"><img src="../img/back.png"></a></div>
						전자영수증
					</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color:#A6A6A6;">
					ⓘ종이 영수증을 원하시면 파트너에게 요청해주세요.
				</td>
			</tr>
			<tr style="background-color:#A6A6A6;">
				<td colspan="4">
			 		<div style="float:left">총 0 건</div>
			 		<div style="float:right">사용 합계 0원</div>
				</td>
			</tr>
			<tr style="background-color:#A6A6A6;">
				<td colspan="4">
					<div style="float:left">2022.04.04 ~ 2022.05.03</div>
					<div style="float:right">
						<a href="receiptdetail.jsp">상세조회</a>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr style="height:800px;" align=center>
				<td colspan="4">
					조회 결과가 없습니다.
				</td>
			</tr>
		</table>
	</body>
</html>