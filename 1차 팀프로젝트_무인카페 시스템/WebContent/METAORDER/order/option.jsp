<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>   
<%@ page import="meta.dto.*" %>
<%
request.setCharacterEncoding("UTF-8");

String hname	= request.getParameter("hname");
String size = request.getParameter("name");  

System.out.println(size);

menuDTO dto = new menuDTO();
productVO vo = dto.ProRead(hname);

%>
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
	</head>
	<body>
		<table border="0" align=center width=500px>
			<tr>
				<td>
					<a href="orderok.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<%= hname %>
					</h2>
				</td>
			</tr>
			<tr>
				<td width="125px">
					사이즈
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<%= size %>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="orderok.jsp">옵션</a>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="option.jsp?size=<%= size %>&op=c">커피</a>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="option.jsp?size=<%= size %>&op=s">시럽</a>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="option.jsp?size=<%= size %>&op=b">베이스</a>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="option.jsp?size=<%= size %>&op=i">얼음</a>
				</td>
			</tr>
			<tr style="overflow: hidden;position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 12rem;">
							<td width=117px align=center>
								<input type="button" value="-"> 0 <input type="button" value="+">
							</td>
							<td width=300px align=center>
								1,000원
							</td>
						</tr>
						
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 6rem;">
				<td style="width:150px;"align=center>
					<a href="#"><img src="../img/unlike.png"></a>
				</td>
				<td align=center>
					<a class="btn re" href="index.jsp">담기</a>
				</td>
				<td align=center>
					<a class="btn" href="payment.jsp">주문하기</a>
				</td>
			</tr>
		</table>
	</body>
</html>