<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%
	request.setCharacterEncoding("UTF-8");

String hname = request.getParameter("hname");

System.out.println("view jsp request parameta : hname = " + hname);

//값이 없거나 다를때
if( hname == null || hname.equals("")|| !hname.equals(hname ))
{
	response.sendRedirect("index.jsp");
	return;
}
//기존  DTO VO
menuDTO dto = new menuDTO();
meta.vo.productVO vo = dto.ProRead(hname);
System.out.println("view jsp create productVO vo");


//제품 이미지를 지원하는 DTO VO
productsDTO	pdto = new productsDTO();
productsVO	pro = null;
pdto.GetProList(hname);
productsVO	proIMG = pdto.GetProItem(0);
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
					<a href="index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr>
				<td align="center">
					<img style="border-radius:10px; width:auto; height:300px;"
							 src="download.jsp?file=<%= proIMG.images().get(0).img_pname() %>&name=<%= proIMG.images().get(0).img_lname() %>">
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<%= proIMG.hname() %><br>
						<%= proIMG.ename() %><br>
					</h2>
					<h4>
						<%= proIMG.proinfo() %><br>
					</h4>
					<h3>
						<%= proIMG.price() %> 원<br>
					</h3>
				</td>
			</tr>
			<tr>
				<td>
					<a href="nutrition.jsp?hname=<%= vo.getHname() %>&nutr=t">제품 영양 정보</a>
				</td>
			</tr>
			<tr style=" position:fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 12rem;">
				<td align=center width="500px">
					<a class="btn" href="orderok.jsp?hname=<%= vo.getHname() %>">주문하기</a>
				</td>
			</tr>
		</table>
	</body>
</html>