<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String orderlist = request.getParameter("order_tocard");
	//System.out.println(orderlist);
	int MAX	= (Integer) session.getAttribute("sel_count");

%>
<!-- ------------------------------------------------------------------------------ -->
<tr>
	<td style="background-color:white;padding:150px 0px 150px 0px" colspan=3>
		<form name="orderfrm" id="orderfrm" method="post" action="receipt.jsp" >
		<input type="hidden" name="order" id="order" value="<%=orderlist%>">
		<table id="login" border="0" height="900" width="700" style="margin : auto; text-align:center">
			<tr>
				<td colspan="2"><h2>카드결제</h2></td>
			</tr>
			<tr>
				<td colspan="2"><img src="images/insertcard.jpg" width="400" height="400"></td>
			</tr>
			<tr>
				<td colspan=2><h3>카드를 넣어 주세요</h3></td>
			</tr>
			<tr>
				<td width="350px"><input type="submit" id="yes" value="완료" ></td>
			</tr>
		</table>
		</form>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>