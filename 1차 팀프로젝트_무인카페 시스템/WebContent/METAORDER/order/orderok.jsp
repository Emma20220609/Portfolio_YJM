<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>   
<%@ page import="meta.dto.*" %>

<%

accountVO user = (accountVO)session.getAttribute("login");

if( user == null )
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = 'index.jsp';</script>");
	return;
}

request.setCharacterEncoding("UTF-8");

String hname	= request.getParameter("hname");

//System.out.println("orderok jsp request parameta : hname = " + hname);

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

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js"></script>
		<script src="../js/common.js"></script>		
		<script src="../js/cart.js"></script>
	</head>
	<body>
	<script>
	
	//이전값
	var oldObj = null;
	
	function select(obj)
	{
		//document.getElementById('sel').className = "sel cup size"
		//alert("test");
		//alert($(obj).find("#sel").attr("class"));
		//$(obj).find("#sel").removeClass("cup size");
		
		if(oldObj == obj) return;
		
		//이 전에 선택이 되어있을 때
		if( oldObj != null)
		{
			//기존의 선택을 제거
			$(oldObj).find("#sel").removeClass("sel cup size");
			$(oldObj).find("#sel").addClass("cup size");
			$("#shot").html("0");
		}
		//클릭한 자식의 #sel 아이디에 클래스를 설정
		$(obj).find("#sel").removeClass("cup size");
		$(obj).find("#sel").addClass("sel cup size");
		
		var value = $(obj).find("#menu_price").val();
		$("#basic_price").val(value);
		$("#div_price").html(value + "원");
		
		oldObj = obj;

		var info = $(obj).find("#menu_item").val();
		$("#select_item").val(info);
		
		MakeSum();		
	}
	
	//옵션값을 보내기
	function Option()
	{
		var select_item = $("#select_item").val();javascript:void(0);
		var basic_price = $("#basic_price").val();javascript:void(0);
		basic_price = parseInt(basic_price);
		if(basic_price == 0)
		{
			alert("제품을 선택하여 주세요.");
			return;	
		}
		
		var datalist = "";
		
		$("#shot").each(
			function()
			{
				var shot	= document.getElementById("shot").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += shot;				
			}
		);
		$("#syrup").each(
			function()
			{
				var syrup	= document.getElementById("syrup").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += syrup;				
			}
		);
		$("#count").each(
			function()
			{
				var count	= document.getElementById("count").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += count;			
			}
		);
		
		$("#sel_option").val(datalist);
		document.option.submit();
	}
	
	//옵션값을 보내기
	function putItemIntoCart()
	{
		var select_item = $("#select_item").val();javascript:void(0);
		var basic_price = $("#basic_price").val();javascript:void(0);
		basic_price = parseInt(basic_price);
		if(basic_price == 0)
		{
			alert("제품을 선택하여 주세요.");
			return;	
		}
		
		var datalist = "";
		
		$("#shot").each(
			function()
			{
				var shot	= document.getElementById("shot").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += shot;				
			}
		);
		$("#syrup").each(
			function()
			{
				var syrup	= document.getElementById("syrup").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += syrup;				
			}
		);
		$("#count").each(
			function()
			{
				var count	= document.getElementById("count").innerHTML;
				if(datalist != "") datalist += ",";
				datalist += count;			
			}
		);
		
		$("#sel_option").val(datalist);
		
		$.ajax({
			type : "post",
			url: "cart.jsp",
			dataType: "html",
			data: 
			{
				sel_option:$("#sel_option").val(),
				select_item:$("#select_item").val(),
				total_price:$("#total_price").val()
		    },	
			success : function(data) 
			{
				data = data.trim();
				window.location.href = "../other/shopping.jsp";
			}
		});
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
			SetItem(this,"-",1);			
		});
		
		$('#plus3').click(function(){
			SetItem(this,"+",10);
		});
	});	
	
	//pID : 객체 ID
	//pMode : + 또는 -
	function SetItem(obj,pMode,pMax)
	{
		var subObj = null;
		var num  = 0;
		
		
		var basic_price = $("#basic_price").val();
		basic_price = parseInt(basic_price);
		if(basic_price == 0)
		{
			alert("제품을 선택하여 주세요.");
			return;	
		}
		
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
	
	//주문 총액을 계산한다.
	function MakeSum()
	{
		/*
		var basic_price = $("#basic_price").val();
		basic_price = parseInt(basic_price);
		if(basic_price == 0)
		{
			return;	
		}
		
		//합계 금액을 계산한다.
		var count = $("#count").text();
		count = parseInt(count);
		var sum_price = 0;
		sum_price = count * basic_price;
		$("#div_price").html("결제금액: " + comma(sum_price) + "원");
		*/
		
		//가격 계산하기 (샷*500 + 단품가격)*수량
		//var iPrice = (opt1 * 500 + sPrice) * opt3 ;
		
		//setText("div_price","결제금액: " + comma(getIntVal("basic_price") * getIntText("count") + (getIntText("shot") * 500)) + "원");
		setText("div_price","결제금액: " + comma(((getIntText("shot") * 500)+getIntVal("basic_price"))*getIntText("count")) + "원");
		setVal("total_price", comma(((getIntText("shot") * 500)+getIntVal("basic_price"))*getIntText("count")));
		
	}
	
	
	
	</script>
		<div id="strURL"></div>
		<form id="option" name="option" method="get" action="payment.jsp">
		<table border="0" align=center width=500px>
			<tr>
				<td>
					<a href="view.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<%= vo.getHname() %>
					</h2>
				</td>
			</tr>
			<tr>
				<td style="height:80px; ">
					<h3>사이즈</h3>
				</td>
			</tr>
			<tr align="center">
						
			<%
				int total = list.GetProTotal(hname); 
				//System.out.println(total);
				list.GetproList(hname);
				for(int i=0; i < list.GetProTotal(hname); i++)
				{
					vo = list.GetMenu(i);
				%>
				<td>
					<a href="javascript:void(0);" onclick="select(this);">
						<div id="sel" class="cup size" style="font-size:14px;" ><%= vo.getDiv_name() %>
							<%
							String info = vo.getDiv_name() + "@" + hname + "@" + vo.getPro_price() + "@" + vo.getPro_no();
							%>
							<input type="hidden" id="menu_item" name="menu_item" value="<%= info %>" >
							<input type="hidden" id="select_item" name="select_item" value="" >
							<input type="hidden" id="menu_price" name="menu_price" value="<%= vo.getPro_price() %>" >
							<input type="hidden" id="sel_option" name="sel_option" value="" >
							<div>
								<img src="../img/size.png"></div><div style="font-size:12px;"><%=vo.getVolume() %><%= vo.getUnit() %>
							</div>
						</div>
					</a>
				</td>
				<%
			}
			%>
			</tr>
			<tr>
				<td style="height:80px; ">
					<h3>옵션</h3>
				</td>
			</tr>
			<tr>
				<td style=" height:80px">
					<h3>샷</h3>
				</td>
				<td colspan="3" align="right">
					<input style="width:30px; height:30px; font-size:20px; " id="minus1" type="button" value="-">
					 <span id="shot" >0</span> 
					<input style="width:30px; height:30px; font-size:20px; " id="plus1" type="button" value="+">
				</td>
			</tr>
			<tr>
				<td style=" height:80px">
					<h3>시럽</h3>
				</td>
				<td colspan="3" align="right">
					<input style="width:30px; height:30px; font-size:20px; " id="minus2" type="button" value="-">
					 <span id="syrup">0</span> 
					<input style="width:30px; height:30px; font-size:20px; " id="plus2" type="button" value="+">
				</td>
			</tr>
			<tr style="overflow: hidden;position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 12rem;">
							<td width=117px align=center>
								<input style="width:30px; height:30px; font-size:20px; " id="minus3" type="button" value="-">
								 <span id="count" >1</span> 
								<input style="width:30px; height:30px; font-size:20px; " id="plus3" type="button" value="+">
							</td>
							<td width=300px align=center>
								<input type="hidden" id="basic_price" name="basic_price" value="0">
								<input type="hidden" id="total_price" name="total_price" value="0">
								<div id="div_price">제품을 선택하세요.</div>
							</td>
						</tr>
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 6rem;">
				<td style="width:150px;"align=center>
					<a href="#"><img src="../img/unlike.png"></a>
				</td>
				<td align=center>
					<a class="btn re" href="javascript:putItemIntoCart();">담기</a>
				</td>
				<td align=center><!-- payment.jsp?name=<%= vo.getDiv_name() %>&hname=<%= hname %> -->
					<a class="btn" href="javascript:Option();">주문하기</a>
				</td>
			</tr>
		</table>
		</form>
		
		<div id="cartbody"></div>
	</body>
</html>