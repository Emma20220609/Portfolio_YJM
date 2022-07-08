<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.dbms.*" %> 
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
<%@ include file="includes/head.jsp" %>
<script>
	function del()
	{
		if (confirm("주문을 취소하시겠습니까?") == true) 
		{
			 window.open("logout.jsp");
		}
	}
	
	$(function(){
		var num = $("#sel_price").val()
	    	//아이디 tag인 태그의 text를 읽어온다 
		num2 = $.numberWithCommas(parseInt(num));
		$("#sel_price").val(num2);
	})
	$.numberWithCommas = function (x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
	
</script>
<!-- ==================================================================================================================== -->
<tr style="background-color:white;">
	<td colspan="4">
		<table border=0  style="margin : auto; text-align:center; width:100%">
			<tr>
				<td style="padding:60px 80px 50px 40px; width:180px">
					<table border=0>
						<tr>
						<%
						//메뉴 리스트 VO DTO 생성
						productsDTO	dto = new productsDTO();
						productsVO	pro = null;
						//메뉴 리스트 생성
						dto.GetMenuList();
						//메뉴 리스트 갯수 산출
						int MAX = dto.GetTotal("menu");
						System.out.println("메뉴 리스트 갯수 : " + MAX);
						//메뉴 리스트 출력
						int count = 0;
						for(int i = 0 ; i < MAX ; i++ )
						{
							pro = dto.GetMenuItem(i);
							dto.GetProList(pro.hname());
							productsVO	proIMG = dto.GetProItem(0);
						%>
									<td style="padding:60px 10px 50px 180px;width:100px">
										<table border=0>
											<tr>
												<td>
													<a href="option.jsp?hname=<%= proIMG.hname() %>&ename=<%= proIMG.ename() %>&pro_no=<%= proIMG.pro_no() %>">
													<img style="border-radius:10px; width:auto; height:230px;"
														 src="download.jsp?file=<%= proIMG.images().get(0).img_pname() %>&name=<%= proIMG.images().get(0).img_lname() %>">
													</a>
												</td>
											</tr>
											<tr>
												<td style="background-color:#D1DDE2;font-size:2rem;"><%= proIMG.hname() %><br></td>
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
						</tr>
					</table>
				</td>
		</tr>
		<tr height="100px"></tr>
	</table>
	
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