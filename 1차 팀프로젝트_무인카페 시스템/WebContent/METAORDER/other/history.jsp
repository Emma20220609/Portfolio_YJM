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
<% 
			
String detail = request.getParameter("detail"); 
if(detail == null) detail = "n";			

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
				<td colspan="3" align=center>
					<h3>
						<div style="float:left"><a href="index.jsp"><img src="../img/back.png"></a></div>
						히스토리
					</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color:#A6A6A6;" align=center>
					메뉴 주문
				</td>
			</tr>
			<tr>
				<td colspan="4">
			 		<div>
						<select style="width:500px; text-align:center; " name="type">
							<option value="paymentall">주문상태(전체)</option>
							<option value="paymentcom">결제완료</option>
							<option value="ready">준비완료</option>
							<option value="paymentcan">결제취소</option>
						</select>
					</div>
				</td>
			</tr>
			<tr style="background-color:#A6A6A6;">
				<td colspan="4">
					<div style="float:left">2022.04.04 ~ 2022.05.03</div>
					<div style="float:right">
						<a href="<%= detail.equals("y") ? "history.jsp" : "history.jsp?detail=y" %>">상세조회</a>
					</div>
				</td>
			</tr>
			<%
			if(detail.equals("y"))
			{
				%>
				<tr>
					<td align=center width=175px>
						<a href="#">1개월</a>
					</td>
					<td align=center width=175px>
						<a href="#">1년</a>
					</td>
					<td align=center width=175px>
						<a href="#">기간설정</a>
					</td>
				</tr>
				<tr>
					<td align=center colspan="4">
						<form method="post"name="checkdate" action="">
							<input type="date" name="checkdate1" value="2022-04-06"> ~		
							<input type="date" name="checkdate2" value="2022-05-06">
						</form>		
						<p>●최근 5년까지의 이력만 조회 가능합니다.</p>	
					</td>
				</tr>
				<tr>
					<td align=center colspan="4">
						<a href="#">조회</a>
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
				<%	
			}else
			{
				%>
				<tr>
					<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
				</tr>
				<tr style="height:800px;" align=center>
					<td colspan="4">
						조회 결과가 없습니다.
					</td>
				</tr>
				<%
			}
			%>	
		</table>
	</body>
</html>