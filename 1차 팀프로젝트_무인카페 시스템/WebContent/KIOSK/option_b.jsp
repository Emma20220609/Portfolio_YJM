drinkmenu.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<%@ page import="meta.dbms.*" %> 
<%@ page import="meta.vo.*" %>   
<%@ page import="meta.dto.*" %>
<%
	String pro_no = request.getParameter("pro_no");
	String hname = request.getParameter("hname");
	String ename = request.getParameter("ename");
	
	ListDTO list = new ListDTO();
	menuDTO dto = new menuDTO();
	productVO vo = dto.ProRead(hname);
	
	//값이 없거나 다를때 
	if( hname == null || hname.equals("")|| !hname.equals(hname))
	{
		response.sendRedirect("index.jsp");
		return;
	}
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
			background-color: green;
		}
		
		.select
		{
			outline: 5px solid #085820;
		}		
</style>
<script>
	//선택하기
	var prevObj = null;
	function Select(obj)
	{
		if( prevObj == obj) return;
		
		if( prevObj != null)
		{
			//기존 선택한 거 제거
			$(prevObj).removeClass("select");
			$(prevObj).addClass("unselect");				
		}
		$(obj).removeClass("unselect");
		$(obj).addClass("select");
		
		var value = $(obj).find("#drink_id").val();
		$("#sel_menu").val(value);
		prevObj = obj;
		
		var price = $(obj).find("#price").val();
		document.getElementById("drinkprice").value= makeComma(price);
		document.getElementById("p").value= price;
	}
	
	//옵션값 보내기
	function Option()
	{
		var datalist = "";
		$("#pro_no").each(
			function()
			{
				var pro_no = document.getElementById("pro_no").value;
				if(datalist != "") datalist += "/";
				datalist += pro_no;		
			}
		);
		$("#hname").each(
			function()
			{
				var hname = document.getElementById("hname").value;
				if(datalist != "") datalist += "/";
				datalist += hname;			
			}
		);
		$(".select").each(
			function()
			{
				var value = $(this).find("#drink_id").val();
				if(datalist != "") datalist += "/";
				datalist += value;			
			}
		);
		$("#shot").each(
			function()
			{
				var shot = document.getElementById("shot").innerHTML;
				if(datalist != "") datalist += "/";
				datalist += shot;									
			}
		);
		$("#syrup").each(
			function()
			{
				var syrup = document.getElementById("syrup").innerHTML;
				if(datalist != "") datalist += "/";
				datalist += syrup;				
			}
		);
		$("#drinkcount").each(
				function()
				{
					var drinkcount = document.getElementById("drinkcount").innerHTML;
					if(datalist != "") datalist += "/";
					datalist += drinkcount;				
				}
			);
		
		$("#drinkprice").each(
			function()
			{
				var drinkprice = document.getElementById("drinkprice").value;
				if(datalist != "") datalist += "/";
				datalist += drinkprice;		
			}
		);
		$("#p").each(
			function()
			{
				var price = document.getElementById("p").value;
				if(datalist != "") datalist += "/";
				datalist += makeComma(price);
			}
		);
		if($("#drinkprice").val() == "0")
		{
			alert("매뉴를 선택하세요.");
			
		}
		$("#sel_menu").val(datalist);
		document.selForm.submit();
	}

	
	//수량 증가감소
	$(function(){
		$('#minus1').click(function(){
			SetItem(this,"-",1);
		});
		
		$('#plus1').click(function(){
			SetItem(this,"+",5);
		});
		$('#minus2').click(function(){
			SetItem(this,"-",0);			
		});
		
		$('#plus2').click(function(){
			SetItem(this,"+",5);
		});		
		$('#minus3').click(function(){
			SetItem(this,"-",0);			
		});
		
		$('#plus3').click(function(){
			SetItem(this,"+",30);
		});		
	});	
	
	//pID : 객체 ID
	//pMode : + 또는 -
	function SetItem(obj,pMode,pMax)
	{
		var subObj = null;
		var num  = 0;
		if( pMode == "+" )
		{
			subObj = $(obj).prev();
			stat = $(subObj).text();
			num = parseInt(stat,10);			
			num++;
			if( num > pMax )
			{
				//alert("더 이상 늘일 수 없습니다.");
				num = pMax;
			}
		}else if( pMode == "-")
		{
			subObj = $(obj).next();
			stat = $(subObj).text();
			num = parseInt(stat,10);			
			num--;
			if( num < pMax )
			{
				//alert("더 이상 줄일 수 없습니다.");
				num = pMax;
			}			
		}
		$(subObj).text(num);
		
		MakeSum();
	}
	
	//가격합계
	function MakeSum()
	{	
		//alert("sum");
		
		var price = $("#p").val();
		price = parseInt(price.replace(/,/g , ''));
		//alert(price);
		if(price == 0)
		{
			return;	
		}
		
		//합계 금액을 계산한다.
		var drinkcount = $("#drinkcount").text();
		drinkcount = parseInt(drinkcount);
		//alert(drinkcount);
		var sum_price = 0;
		sum_price = drinkcount * price;
		//alert(sum_price);
		document.getElementById("drinkprice").value=makeComma(sum_price);
	
	}
	
	function makeComma(num)
	{
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
</script>
<!-- ==================================================================================================================== -->
<tr>
	<td style="background-color:white;padding:150px 0px 150px 0px" colspan=3>
		<form id="optionfrm" name="optionfrm" method="post" action="optionok.jsp">
		<input type="hidden" id="pro_no" name="pro_no" value="<%= pro_no %>">
		<input type="hidden" id="hname" name="hname" value="<%= hname %>">
		<table id="login" border="0" height="900" width="100%" style="margin : auto; text-align:center">
			<tr>
				<td colspan="5"><h2>옵션을 선택해 주세요</h2></td>
			</tr>
			<tr>
			<%
				int total = list.GetProTotal(hname); 
				int count = 0;
				//System.out.println(total);
				list.GetproList(hname);
				for(int i=0; i < list.GetProTotal(hname); i++)
				{
					vo = list.GetMenu(i);
				%>
				<td style="padding:60px 10px 50px 180px;width:100px">
						<table border=0>
							<tr>
								<td>
									<div id="drink" class="unselect" onclick="Select(this);">
										<input type="hidden" id="sel_menu" name="sel_menu" value="">
										<input type="hidden" id="drink_id" name="drink_id" value="<%=vo.getDiv_name()%>">
										<input type="hidden" id="price" name="price" value="<%=vo.getPro_price()%>">
										<img src="images/drink1.jpg" height="250px" width="230px">
										<br>
									</div>	
								<td>
							</tr>
							<tr>
								<td style="background-color:#D1DDE2" >
									<%=vo.getDiv_name() %><%=vo.getPro_price() %>
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
				
			</tr>
			<tr>
				<td style="font-size:20px;font-weight:bold;">샷 추가<br/>(기본 1샷)</td>
				<td style="font-size:25px;">
					<input type="button" id="minus1" value="-"><span id="shot" style="display:inline-block; width:100px" >1</span><input type="button" id="plus1" value="+">
				</td>
				<td style="font-size:20px;font-weight:bold;">수량</td>
				<td style="font-size:25px;">
					<input type="button" id="minus3" value="-"><span id="drinkcount" style="display:inline-block; width:100px">1</span><input type="button" id="plus3" value="+">
				</td>
			</tr>
			<tr>
				<td style="font-size:20px;font-weight:bold;">시럽  추가</td>
				<td style="font-size:25px;">
					<input type="button" id="minus2" value="-"><span id="syrup" style="display:inline-block; width:100px">0</span><input type="button" id="plus2" value="+">
				</td>
				<td style="font-size:20px;font-weight:bold;">가격</td>
				<td>
					<input type="hidden" id="p" name="p" value="0">
					<input style="height:30px; 	font-size:25px;	font-weight:bold;text-align:right;" type="text" readonly id="drinkprice" value="0">
				</td>
			</tr>
			<tr height="50px"></tr>
			<tr>
				<td width="350px" colspan=3><input type="submit" value="담기"  id="yes" onclick="Option();"></td>
				<td><span><a id="no" href="drinkmenu.jsp">취소</a></span></td>
			</tr>
		</table>
		</form>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>
