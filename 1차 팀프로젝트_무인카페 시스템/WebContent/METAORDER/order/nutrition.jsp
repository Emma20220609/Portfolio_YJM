<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
String hname = request.getParameter("hname");
String nutr = request.getParameter("nutr");

nutritionDTO dto = new nutritionDTO(); 
nutriVO vo = new nutriVO();
dto.Read(2);

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
				<td colspan="3">
					<a href="view.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="3">
					<h2>
						제품 영양 정보
					</h2>
				</td>
			</tr>
			<tr align="center">
				<td style="width:150px; ">
					<a class="<%= nutr.equals("t") ? "btn nutr" : "" %>" href="nutrition.jsp?nutr=t">Tall</a>
				</td>
				<td style="width:150px; ">
					<a class="<%= nutr.equals("g") ? "btn nutr" : "" %>" href="nutr_grande.html">Grande</a>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>355ml(12 fl oz)</div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>칼로리<div style="float:right; ">10kcal</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>탄수화물<div style="float:right; ">2g</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>당류<div style="float:right; ">0g</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>나트륨<div style="float:right; ">5mg</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>단백질<div style="float:right; ">1g</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>지방<div style="float:right; ">0g</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>콜레스테롤<div style="float:right; ">0mg</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>트랜스지방<div style="float:right; ">0g</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>카페인<div style="float:right; ">150mg</div></div>
				</td>
			</tr>
			<tr>
				<td style="border-bottom:2px solid gray; padding-bottom:10px; padding-top:10px; "colspan="3">
					<div>포화지방<div style="float:right; ">0g</div></div>
				</td>
			</tr>
		</table>
	</body>
</html>