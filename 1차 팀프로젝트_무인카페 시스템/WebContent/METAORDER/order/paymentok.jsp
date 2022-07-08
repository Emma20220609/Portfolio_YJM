<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%

String payInfo = request.getParameter("payInfo");
String selPay = request.getParameter("selPay");

//System.out.println("payInfo= " + payInfo);
//System.out.println(selPay);


String[] Info = payInfo.split("@");

/*
out.print("사이즈 = " + Info[0] +" 이름 = " + Info[1]+ " 기본가격 = "+ Info[2] + "<br>");
out.print("shot = " + Info[3] +" syrup = " + Info[4]+ " 음료개수 = "+ Info[5] + "<br>");
out.print("가격 합계 = " + Info[6] + "<br>");
*/

String	size	=	Info[0];
String	name	=	Info[1];
String	price	=	Info[2];
String	shot	=	Info[3];
String	syrup	=	Info[4];
String	count	=	Info[5];
String	tprice	=	Info[6];
String	no		=	Info[7];

int pro_no = Integer.parseInt(no);
productsDTO	pdto = new productsDTO();
productsVO	pro = null;
pro = pdto.GetItem(pro_no);

//데이터베이스로 주문처리하기
orderDTO oDTO = new orderDTO();
orderVO dVO = new orderVO();



%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
	</head>
	<body>
		<div id="contents" >
		<table border="0" align=center width=500px>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						결제완료
					</h2>
				</td>
			</tr>
			<tr>
				<td width="125px">
					<h3>결제수단</h3>
				</td>
			</tr>
			<tr>
				<td width="125px">
					<div>
					<%
						if(selPay.equals("card"))
						{
							%>신용카드<%
						}else if(selPay.equals("deposit"))
						{
							%>예치금<%
						}else
						{
							%>적립금<%
						}
					%> 
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<h3>주문내역</h3>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px " rowspan="5" >
					<img width="125px" src="download.jsp?file=<%= pro.images().get(0).img_pname() %>&name=<%= pro.images().get(0).img_lname() %>">
				</td>
				<td id="name"colspan="3" >
					<%= name %>
				</td>
				<td id="price" align=right>
					<%= price %>원
				</td>
			</tr>
			<tr>
				<td colspan="3">
					수량
				</td>
				<td  id="count" align=right>
					<%= count %>
				</td>
			</tr>
			<tr>
				<td colspan="3" >
					사이즈 
				</td>
				<td id="size" align=right>
					<%= size %>
				</td>
			</tr>
			<tr>
				<td id="shot" colspan="3" >
					샷 
				</td>
				<td align=right>
					<%= shot %>
				</td>
			</tr>
			<tr>
				<td id="syrup" colspan="3" >
					시럽 
				</td>
				<td colspan="2" align=right>
					<%= syrup %>
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="payInfo" id="payInfo" value="<%= payInfo %>">
				</td>
			</tr>			
			<tr style="overflow: hidden;position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 12rem;">
							<td width=112px align=center>
								<h4>최종 결제 금액</h4>
							</td>
							<td width=380px align=right>
								<%= tprice %> 원
							</td>
						</tr>
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 6rem;">
				<td width=500px align=center>
					<a class="btn" href="index.jsp">결제완료</a>
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>