<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<%@ page import="meta.dbms.*" %> 
<%@ page import="meta.vo.*" %>   
<%@ page import="meta.dto.*" %>
<%
	String pro_no = request.getParameter("pro_no");
	String hname = request.getParameter("hname");
	String ename = request.getParameter("ename");
	
	
	//값이 없거나 다를때 
	if( hname == null || hname.equals(""))
	{
		response.sendRedirect("index.jsp");
		return;
	}
	String sel = hname;

	//선택된 메뉴의 상품 리스트를 DB에서 읽고 객체를 생성한다.
	productsDTO	dto = new productsDTO();
	productsVO	pro = null;
	dto.GetProList(sel);

	//상품 리스트 갯수 산출
	int MAX = dto.GetTotal("pro");
	System.out.println("상품 리스트 갯수 : " + MAX);

	int count = 0;
	//상품 리스트 출력

%>
<style>
		div
		{
			width: 200px;
			height: 200px;
			display: inline-block;
			height:250px;
			width:230px;
			
		}
		
		.unselect
		{
			background-color: white;
		}
		
		.select
		{
			outline: 5px solid #085820;
		}		
</style>
<script src="./js/option.js"></script>
<!-- ==================================================================================================================== -->
<tr>
	<td style="background-color:white;padding:80px 0px 80px 0px" colspan=3>
		<form id="optionfrm" name="optionfrm" method="post" action="optionok.jsp">
		<input type="hidden" id="pro_no" name="pro_no" value="<%= pro_no %>">
		<input type="hidden" id="hname" name="hname" value="<%= hname %>">
		<table id="login" border="0" height="100%" width="90%" style="margin : auto; text-align:center">
			<tr>
				<td colspan="5" style="padding:30px 0px 0px 0px;"><h1>옵션을 선택해 주세요</h1></td>
			</tr>
			<%
			
			for(int i = 0 ; i < MAX ; i++ )
			{
				pro = dto.GetProItem(i);
			%>
			
			<td style="padding:35px 10px 50px 140px;width:100px">
								<table border=0>
									<tr>
										<td>
											<div id="drink" class="unselect" onclick="Select(this);">
												<input type="hidden" id="sel_menu" name="sel_menu" value="">
												<input type="hidden" id="drink_id" name="drink_id" value="<%= pro.name() %>">
												<input type="hidden" id="price" name="price" value="<%= pro.price()%>">
			<%
				if(pro.images().size() != 0)
				{
					for(imageVO item : pro.images())
					{
						%>
						<img style="border-radius:10px; width:200px; height:220px;"
						 src="download.jsp?file=<%= item.img_pname() %>&name=<%= item.img_lname() %>">
						<%
					}
				}
			%>
											</div>	
										<td>
									</tr>
									<tr>
										<td style="background-color:#D1DDE2; text-align:center;font-size: 2rem;" >
											<%= pro.name() %><br><%= pro.price() %>
										</td>
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
			<tr height="50px">
				<td style="font-size:20px;font-weight:bold;">샷 추가<br/>(기본 1샷)</td>
				<td style="font-size:25px;">
					<input type="button" id="minus1" value="-"><span id="shot" style="display:inline-block; width:100px" >1</span><input type="button" id="plus1" value="+">
				</td>
			</tr>
			<tr height="50px">
				<td style="font-size:20px;font-weight:bold;">시럽  추가</td>
				<td style="font-size:25px;">
					<input type="button" id="minus2" value="-"><span id="syrup" style="display:inline-block; width:100px">0</span><input type="button" id="plus2" value="+">
				</td>
			</tr>
			<tr height="50px">
				<td style="font-size:20px;font-weight:bold;">수량</td>
				<td style="font-size:25px;">
					<input type="button" id="minus3" value="-"><span id="drinkcount" style="display:inline-block; width:100px">1</span><input type="button" id="plus3" value="+">
				</td>
			</tr>
			<tr height="50px">
				<td style="font-size:20px;font-weight:bold;">가격</td>
				<td>
					<input type="hidden" id="p" name="p" value="0">
					<input style="height:30px; 	font-size:25px;	font-weight:bold;text-align:right; width:155px;" type="text" readonly id="drinkprice" value="0">
				</td>
			</tr>
			<tr height="20px"></tr>
			<tr>
				<td colspan=3 style="padding:0px 0px 10px 0px;"><input type="submit" value="담기"  id="yes" onclick="Option();"> <span style="display:inline-block; width:330px"></span> <span><a id="no" href="drinkmenu.jsp">취소</a></span></td>
			</tr>
		</table>
		</form>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>
