<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String orderlist = request.getParameter("order");
	int MAX	= (Integer) session.getAttribute("sel_count");



	
%>
<!-- ==================================================================================================================== -->
<tr>
	<td style="background-color:white;padding:80px 0px 150px 0px" colspan=3>
		<table border="0" height="900" width="700" style="margin : auto; text-align:center">
			<tr>
				<td colspan="2"><h1>주문이 완료되었습니다</h1></td>
			</tr>
			<tr>
				<td colspan=2>
					<table border=0 style="margin : auto; text-align:center; width:80%; height:80%">
						<tr>
							<td colspan=3><h1>Metabucks</h1></td>
						</tr>
						<tr><td height="10px"></td></tr>
						<tr>
							<td colspan=3 style="text-align:left">(영수증)</td>
						</tr>
						<tr>
							<td colspan=3 style="text-align:right">전북 전주시 덕진구 백제대로 572</td>
						</tr>
						<tr>
							<td colspan=3 style="text-align:right">010-1111-1111</td>
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr>
							<td colspan=3><h2>주문번호 256</h2></td>
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						
						<%
							String [] ary = orderlist.split("/");		
							String [] menulist = ary[0].split(",");
							String [] menucount = ary[1].split("개");
							String [] menuprice = ary[2].split("원");
							for(int i=0; i<menulist.length-1; i++)
							{
								%>
								<tr></tr>
								<tr>
									<td style="width:250px"><%=menulist[i] %></td>
									<td><%=menucount[i] %></td>
									<td><%=menuprice[i] %></td>
								</tr>	
								<%
							}
						%>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr >
							<td><h4>합계</h4></td>
							<td>-</td>
							<td><h4><%=ary[3]%></h4></td>
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr>
							<td>포인트사용</td>
							<td>-</td>
							<%
								if(id == null || id.equals(""))
								{
									%>
									<td>-</td>
									<%
								}else
								{
									%>
									<td><%=ary[6]%></td>
									<%
								}	
							%>
							
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr>
							<td><h3>결제금액</h3></td>
							<td>-</td>
							<td>
								<h3><%=ary[4]%></h3>
							</td>
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr>
							<td>적립</td>
							<td>-</td>
							<td>700</td>
						</tr>
						<tr><td colspan=3>-----------------------------------------------------------------------------------</td></tr>
						<tr>
							
							<td>결제수단</td>
							<td>-</td>
							<%
								if(id == null || id.equals(""))
								{
									%>
									<td>카드</td>
									<%
								}else
								{
									%>
									<td>예치금</td>
									<%
								}	
							%>
							
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="350px"><span><a id = "yes" href="logout.jsp">확인</a></span></td>
			</tr>
		</table>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>