<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="includes/head.jsp" %>
<%@ include file="db/dbopen.jsp" %>
<%
	String str = "";
	ArrayList<String> list = new ArrayList<String>();
	
	int MAX			   = (Integer) session.getAttribute("sel_count");		//총갯수	
	int menucount	   = (Integer) session.getAttribute("menucount");		//메뉴당 갯수
	int sel_price	   = (Integer) session.getAttribute("sel_price");		//총액
	
	System.out.println("sel_count"+MAX);
	System.out.println("menucount"+menucount);
	System.out.println("sel_price"+sel_price);
	System.out.println("sel_menu_"+0);
	
	for( int i = 0 ; i < MAX ; i++)
	{
		str = "sel_menu_" + i ;
		System.out.println(i);
		System.out.println(str);
		String tmp = (String) session.getAttribute(str);
		list.add(tmp);
		System.out.println(list.get(i));
	}
%>
<script>
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
		num = parseInt(stat);
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
		num = parseInt(stat);			
		num--;
		if( num < pMax )
		{
			//alert("더 이상 줄일 수 없습니다.");
			num = pMax;
		}			
	}

	$(subObj).text(num+"개");
	
	var price = $(obj).parent().next().find(".price").val();
	price = parseInt(price.replace(/,/g , ''));

	//합계 금액을 계산한다.
	var drinkcount = $(obj).parent().find(".drinkcount").text();
	drinkcount = parseInt(drinkcount);
	var sum_price = 0;
	sum_price = drinkcount * price;
	$(obj).parent().next().find(".sum_price").text(makeComma(sum_price)+"원");
	
	MakeTotal();
}

//전체 메뉴갯수, 금액 변경
function MakeTotal()
{
	var total_count	= 0;
	var finalprice	= 0;
	var total		= 0;
	
	var list = $(".itemlist .items").each(function(){
		total_count	+= parseInt($(this).find(".drinkcount").text());
		total		+= parseInt($(this).find(".sum_price").text().replace(",",""));
	});
	document.getElementById("total").innerText=makeComma(total);
	document.getElementById("finalprice").innerText=makeComma(total);
	document.getElementById("total_count").innerText=total_count;
}
//포인트 사용
$(document).ready(function(){
  $("#usepoint").change(function(){
  	
  	var finalprice = document.getElementById("finalprice").innerText;
		finalprice = parseInt(finalprice.replace(",",""));
		var point = document.getElementById("point").innerText;
		point = parseInt(point.replace(",",""));
		
      if($("#usepoint").is(":checked"))
      {
			finalprice = finalprice - point;
			document.getElementById("finalprice").innerText=makeComma(finalprice);
      }else 
      {
			finalprice = finalprice + point;
			document.getElementById("finalprice").innerText=makeComma(finalprice);
      }
  });
});
//콤마 추가하기
function makeComma(num)
{
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
$(function(){
	var num = $("#finalprice"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#finalprice").text(num2);
	
	var num = $("#total"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#total").text(num2);
	
	var num = $("#deposit"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#deposit").text(num2);
	
	var num = $("#point"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#point").text(num2);
})

$.numberWithCommas = function (x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

function Order()
{
	//alert("a");
	var datalist = "";

	var optionlist = $(".optionlist").parent().find(".optionlist").text();
	if(datalist != "") datalist += "/";
	datalist += optionlist;	

	var drinkcount =  $(".drinkcount").parent().find(".drinkcount").text();
	if(datalist != "") datalist += "/";
	datalist += drinkcount;		
	
	var sum_price = $(".sum_price").parent().find(".sum_price").text();
	if(datalist != "") datalist += "/";
	datalist += sum_price;	
	
	
	$(".total").each(
			function()
			{
				var total = document.getElementById("total").innerText;
				if(datalist != "") datalist += "/";
				datalist += total;			
			}
		);
	$(".finalprice").each(
		function()
		{
			var finalprice = document.getElementById("finalprice").innerText;
			if(datalist != "") datalist += "/";
			datalist += finalprice;			
		}
	);
	$(".deposit").each(
		function()
		{
			var deposit = document.getElementById("deposit").innerText;
			if(datalist != "") datalist += "/";
			datalist += deposit;									
		}
	);
	$(".point").each(
		function()
		{
			var point = document.getElementById("point").innerText;
			if(datalist != "") datalist += "/";
			datalist += point;				
		}
	);
	
	//alert(datalist);
	$("#order").val(datalist);
	$("#order_tocard").val(datalist);
	<%
	if(id == null || id.equals(""))
	{
		%>
		document.orderform_tocard.submit();
		<%
	}else
	{
		%>
		Check();
		<%
	}	
	%>
}
//잔액체크
function Check()
{	
	var deposit	   = document.getElementById("deposit").innerText;
	deposit = parseInt(deposit.replace(",",""));
	//alert(deposit);
	var finalprice = document.getElementById("finalprice").innerText;
	finalprice = parseInt(finalprice.replace(",",""));
	//alert(finalprice);
	if(deposit < finalprice)
	{
		alert("잔액이 부족합니다. 카드결제를 이용해주세요.");
		document.orderform_tocard.submit();
	}else if(deposit > finalprice)
	{
		document.orderform.submit();
	}else
	{
		//alert("a");
		document.orderform_tocard.submit();
	}
}
</script>
<!-- ==================================================================================================================== -->
<tr>
	<td colspan="5" style="background-color:white;text-align:center;padding:150px 0px 150px 0px"><h1>주문확인</h1>
	<form id="orderform" name="orderform" method="post" action="receipt.jsp">
		<input type="hidden" name="order" id="order" value="">
		<table id="login" border="0" height="900" width="900" style="margin : auto; text-align:center">
			<tr height="400">
				<td colspan="2">
					<table border=0 width="80%" height="80%" style="margin : auto; text-align:center; font-size: 2rem;" class="itemlist">
						<tr height="5px">
							<td>제품</td>
							<td>수량</td>
							<td>금액</td>
						</tr>
						<%
							if(MAX <= 0) out.println("선택한 상품이 없습니다");
						
							else
							{
								for(int i=0; i < MAX; i++) 
								{									
									String[] items = list.get(i).split("/");
									%>
 									<tr height="10" class="items">
										<td height="10px" class="optionlist"  id="optionlist">
											<input type="hidden" id="pro_no" name="pro_no" id="pro_no" value="<%=items[0]%>">
											<b><%= items[1] %> : <%= items[2] %> </b><br>샷:<%= items[3] %>:시럽:<%= items[4] %>,
										</td>
										
										<td>
											<input type="button" class="minus" value="-" onclick="SetItem(this,'-',0)">
											<span class="drinkcount" id="drinkcount" style="display:inline-block; width:100px"><%= items[5] %>개</span>
											<input type="button" class="plus" value="+" onclick="SetItem(this,'+',30)">
											
										</td>
										<td>
											<input type="hidden" class="price" id="price" name="price" value="<%= items[7] %>">
											<span class="sum_price" id="sum_price<%= i %>"><%= items[6] %>원</span>
										</td>
									</tr>
								<%
								}
							}
						%>
					</table>
				</td>
			</tr>
			<tr><td colspan=2>-------------------------------------------------------------------------------------------</td></tr>
			<tr>
				<td> <h2>총 금액</h2></td>
				<td> 
					<h4><span id="total" class="total"><%= sel_price %></span>원</h4>
				</td>
			</tr>
				<%
					if(id == null || id.equals(""))
					{
						%>
							<tr><td colspan=2>-------------------------------------------------------------------------------------------</td></tr>
							<tr>
								<td><h2>총 수량</h2></td>
								<td>
									<h2><span id="total_count" class="total_count"><%= menucount %></span>개</h2>
								</td>
							</tr>
							<tr>
								<td><h2>결제 금액</h2></td>
								<td>
									<h2><span id="finalprice" class="finalprice"><%= sel_price %></span>원</h2>
								</td>
							</tr>
							<tr>
								<td width="350px">
									<span><a id="yes" onclick="Order();" >결제하기</a></span>
								</td>
								<td><span><a id="no" href="drinkmenu.jsp">취소</a></span></td>
							</tr>
						<%
					}else
					{
						String sql = "";
						sql  = " select ";
						sql += " deposit, ";
						sql += " point, ";
						sql += " pay_method ";
						sql += " from account ";
						sql += " where fno = '"+user.fno()+"' ";
						ResultSet result = stmt.executeQuery(sql);
						
						while(result.next() == true)
						{
							String deposit     = result.getString("deposit");
							String point       = result.getString("point");
							String pay_method  = result.getString("pay_method");
							%>
							<tr>
								<td style="font-size:1.5rem;"> 예치금 잔액</td>
								<td style="font-size:1.5rem;"><span id="deposit" class="deposit"><%=deposit %></span>원</td>
							</tr>
							<tr>
								<td style="font-size:1.5rem;"> 현재 적립금</td>
								<td style="font-size:1.5rem;"><span id="point" class="point"><%=point %></span> 포인트 <input type="checkbox" name="usepoint" id="usepoint">사용하기</td>
							</tr>
							<tr><td colspan=2>-------------------------------------------------------------------------------------------</td></tr>
							<tr>
								<td><h2>총 수량</h2></td>
								<td><h2><span id="total_count" class="total_count"><%= menucount %></span>개</h2></td>
							</tr>
							<tr>
								<td><h2>결제 금액</h2></td>
								
								<td><h2><span id="finalprice" class="finalprice"><%= sel_price %></span>원</h2></td>
							</tr>
							<tr>
								<td>
									<span><a id="yes" onclick="Order();" >결제하기</a></span>
								</td>
								<td>
									<span><a id="no" href="drinkmenu.jsp">취소</a></span>
								</td>
							</tr>
							<%
						}	
					}	
				%>
		</table>
		</form>
		<form id="orderform_tocard" name="orderform_tocard" method="post" action="card.jsp">
			<input type="hidden" name="order_tocard" id="order_tocard" value="">
		</form>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>
<%@ include file="db/dbclose.jsp" %>