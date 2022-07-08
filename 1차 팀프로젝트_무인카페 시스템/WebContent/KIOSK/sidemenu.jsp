<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");	
	
	SearchVO searchVO = new SearchVO(request);
	ListDTO  listDTO  = new ListDTO();
	
	int sel_count = 0; 
	int sel_price = 0;
	int menucount = 0;
	
	sel_count = (Integer) session.getAttribute("sel_count");	//총갯수
	sel_price = (Integer) session.getAttribute("sel_price");	//총액
	menucount = (Integer) session.getAttribute("menucount");	
	
	if( sel_count < 0 ) {sel_count = 0;}
	if( sel_price < 0 ) {sel_price = 0;}
	if( menucount < 0 ) {menucount = 0;}
	
	
	
%>
<script>
	function del()
	{
		if (confirm("주문을 취소하시겠습니까?") == true) 
		{
			 window.open("logout.jsp");
		}
	}
</script>
<!-- ==================================================================================================================== -->
<tr style="background-color:white;">
	<td colspan="4">
		<table border=0  style="margin : auto; text-align:center; width:100px">
			<tr>
				<td rowspan="3" style="font-size:50px; padding:0px 150px 0px 0px">◀</td>
				<td style="padding:60px 80px 50px 40px; width:180px">
					<table border=0>
						<tr>
							<td><input type="image" src="images/side1.jpg" height="160px" width="160px"></td>
						</tr>
						<tr>
							<td style="background-color:#D1DDE2">크로아상 <br/> 3,000</td>
						</tr>
					</table>
				</td>
				<td style="padding:60px 10px 50px 180px;width:100px">
					<table border=0>
						<tr>
							<td><input type="image" src="images/side2.jpg" height="160px" width="160px"></td>
						</tr>
						<tr>
							<td style="background-color:#D1DDE2">소금빵 <br/> 2,500</td>
						</tr>
					</table>
				</td>
				<td rowspan="3" style="font-size:50px; padding:0px 0px 0px 150px">▶</td>
			</tr>
			<tr>
				<td style="padding:60px 10px 50px 40px;width:100px">
					<table border=0>
						<tr>
							<td><input type="image" src="images/side5.jpg" height="160px" width="160px"></td>
						</tr>
						<tr>
							<td style="background-color:#D1DDE2">초코 조각 케이크 <br/> 3,500</td>
						</tr>
					</table>
				</td>
				<td style="padding:60px 10px 50px 180px;width:100px">
					<table border=0>
						<tr>
							<td><input type="image" src="images/side4.jpg" height="160px" width="160px"></td>
						</tr>
						<tr>
							<td style="background-color:#D1DDE2">딸기 조각 케이크 <br/> 3,500</td>
						</tr>
					</table>
				</td>
			</tr>
			
		</table>
	</td>
</tr>
<tr>
	<td id="bar" height="80px" style="text-align:center; font-size:30px; padding:0px 0px 30px 0px;width:50%;">주문 수량</td>
	<td id="bar" style="width:100%; text-align:center;font-size:35px"><input type="text" readonly style="height:50px;width:70%;text-align:right; font-size:30px;font-weight:bold;" value="<%= menucount %>">&nbsp;&nbsp;개 </td>					
</tr>
<tr>
	<td id="bar" height="80px" style="text-align:center;font-size:30px;padding:0px 0px 30px 0px">주문 금액</td>
	<td id="bar" style="width:100%; text-align:center;font-size:35px"><input id="sel_price" type="text" readonly style="height:50px;width:70%;text-align:right; font-size:30px;font-weight:bold;" value="<%= sel_price %>">&nbsp;&nbsp;원 </td>
</tr>
<tr>
	<td id="bar"  rowspan="2" style="padding:30px 10px 0px 100px"><a id="orderbtn" href="order.jsp">주문확인</a></td>
	<td id="bar"  rowspan="2" style="padding:30px 10px 0px 150px"><a id="cancelbtn" href="#" onclick="del()">취<br/>소</a></td>				
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>