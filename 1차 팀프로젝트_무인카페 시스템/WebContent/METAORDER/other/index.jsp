<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="other_include/header.jsp" %>
			<tr style="height:250px;">
				<td colspan="4" valign=top style="box-shadow: 5px 5px 5px 5px gray;">
					<div style="border-radius:10px; float:left; box-shadow: 5px 5px 5px 5px gray; line-height:100px;text-align:center; width:200px; height:100px;margin-top:5px;margin-left:46px;">
						<a href="receipt.jsp">영수증</a>
					</div>
					<div style="border-radius:10px; float:left; box-shadow: 5px 5px 5px 5px gray; line-height:100px;text-align:center; width:200px; height:100px;margin-top:5px;">
						<a href="../order/mymenu.jsp">나만의 메뉴</a>
					</div>
					<div style="border-radius:10px; float:left; box-shadow: 5px 5px 5px 5px gray; line-height:100px;text-align:center; width:200px; height:100px;margin-top:5px;margin-left:46px;">
						<a href="privacy.jsp">개인정보 관리</a>
					</div>
					<div style="border-radius:10px; float:left; box-shadow: 5px 5px 5px 5px gray; line-height:100px;text-align:center; width:200px; height:100px;margin-top:5px;">
						<a href="idinfo.jsp">계정정보</a>
					</div>
				</td>
			</tr>
			<tr style="height:50px; ">
				<td colspan="4">
					<h4>
						Pay
					</h4>
				</td>
			</tr>
			<tr align="center">
				<td>
					<a href="deposit.jsp"><img src="../img/deposit.png">예치금 확인</a>
				</td>
				<td>
					<a href="depositcharging.jsp"><img src="../img/depositcharging.png">예치금 충전</a>
				</td>
				<td>
					<a href="../pay/payplus.jsp"><img src="../img/card.png">카드등록</a>
				</td>
				<td>
					<a href="reserves.jsp"><img src="../img/check.png">적립금 확인</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="height:1px;background-color:#cccccc"></td>
			</tr>
			<tr style="height:50px; ">
				<td colspan="4">
					<h4>
						Order
					</h4>
				</td>
			</tr>
			<tr align="center">
				<td>
					<a href="shopping.jsp"><img src="../img/shopping.png">장바구니</a>
				</td>
				<td>
					<a href="history.jsp"><img src="../img/history.png">히스토리</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="height:1px;background-color:#cccccc"></td>
			</tr>
			<tr style="height:50px; ">
				<td colspan="4">
					<h4>
						고객지원
					</h4>
				</td>
			</tr>
			<tr align="center">
				<td>
					<a href="maps.jsp"><img src="../img/place.png">매장정보</a>
				</td>
				<td>
					<a href="email.jsp"><img src="../img/email.png">이메일문의</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#cccccc"></td>
			</tr>
			<tr align="center">
				<td colspan="4">
					<%
					if( user == null ) 
					{
					
						%><a href="../main/login.jsp">로그인</a><%
					}else
					{
						%><a href="logout.jsp">로그아웃</a><%
					}
					%>
				</td>
			</tr>
<%@ include file="other_include/footer.jsp" %>