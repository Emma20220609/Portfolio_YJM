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
<tr style="background-color:white;" >
	<td colspan=4 style="padding:0px 0px 50px 0px">
		<table border=0 >
			<tr>
				<td style="text-align:right"><h1>※ 회원정보 변경은 홈페이지를 이용해 주세요</h1></td>
			</tr>
			<tr>
				<td colspan="3" style="padding:0px 0px 0px 30px"><h1>내가 자주 주문한 메뉴</h1></td>
			</tr>
			<tr >
				<td style="padding:10px 10px 0px 0px" height="30px">
					<table border=0>
						<tr>
						<%
						int total = listDTO.GetMenuTotal();
			
						listDTO.GetMenuList(searchVO.getCurpage());
						int count = 0;
						int size = listDTO.GetMenuTotal();
						int seqno = total - (searchVO.getCurpage() - 1) * 10;
						for(int i=0; i < size; i++)
						{
							meta.vo.productVO vo = listDTO.GetMenu(i);
							%>
									<td style="padding:60px 10px 50px 180px;width:100px">
										<table border=0>
											<tr>
												<td style="font-size: 2rem;">
													<a href="option.jsp?hname=<%=vo.getDef_hname() %>&ename=<%=vo.getDef_ename() %>&pro_no=<%=vo.getDef_no() %>">
													<img src="images/drink2.jpg" height="180px" width="170px">
													</a>
												</td>
											</tr>
											<tr>
												<td style="background-color:#D1DDE2; font-size: 2rem;"><%=vo.getDef_hname() %><br></td>
											</tr>
											<tr>
												<td style="font-size: 2rem;">☆즐겨찾기</td>
											</tr>
										</table>
									</td>
								<%
								if(count!=0 && count%2==1)
								{
									%></tr><tr><%
								}
								count++;
							}		
							%>
						
					</table>
				</td>
				
			</tr>
		</table>
	</td>
</tr>
<tr style="background-color:white;">
	<td colspan=4 height="230px" style="padding:0px 0px 0px 0px">
		<table>
			<tr>
				<td style="padding:0px 0px 0px 30px"><h1>즐겨찾는 메뉴</h1></td>
			</tr>
			<tr>
				<td style="padding:10px 10px 30px 170px">
					<table border=0>
						<tr>
							<td><a href="option.jsp"><img src="images/drink3.jpg" height="160px" width="160px"></a></td>
						</tr>
						<tr>
							<td style="background-color:#D1DDE2; font-size:2rem;">아메리카노 <br/> 2,500</td>
						</tr>
						<tr>
							<td style="font-size: 2rem;">★즐겨찾기</td>
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