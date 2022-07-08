<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>

<%

accountVO user = (accountVO)session.getAttribute("login");

if( user == null )
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = 'index.jsp';</script>");
	return;
}
%>
<%
int cart_count		= 0; 

if(session.getAttribute("cart_count") != null){
	
	cart_count = (Integer) session.getAttribute("cart_count");	//총액
};
System.out.println(cart_count);

if( cart_count == 0)
{
	response.getWriter().print("<script>alert('장바구니에 담긴 상품이 없습니다.'); location.href = '../order/index.jsp';</script>");
}

if(cart_count > 0 )
{
	for(int i = 0 ; i < cart_count ; i++)
	{
		String sel_option	= (String) session.getAttribute("sel_option"+i);
		String select_item 	= (String) session.getAttribute("select_item"+i);
		String total_price 	= (String) session.getAttribute("total_price"+i);
		
		
		
		System.out.println(cart_count);
		System.out.println(select_item);
		System.out.println(total_price);
		
		String[] option = sel_option.split(",");
		String[] items = select_item.split("@");
		
		String shot		= option[0];
		String syrup	= option[1];
		String count	= option[2];
		String size		= items[0];
		String name		= items[1];
		String price	= items[2];
		String pro_no	= items[3];
		
	}
	
}


%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js" ></script>
		<script src="../../PROTO/js/cart.js"></script>
		<script src="../js/common.js"></script>
	</head>
	<script>
		window.onload = function (){
			setText(("sum_price"),"총 결제금액 : "+ comma(getIntText("sum_price"))+" 원")
		}
		
		function shoppingdel(){
			
			if (confirm("장바구니를 비우시겠습니까?") == true) 
			{
				 window.open("shoppingdel.jsp");
			}
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
	</script>
	<body>
		<table border="0" align=center width=500px>
			<tr>
				<td>
					<a href="index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						장바구니
					</h2>
				</td>
			</tr>
			<tr>
				<td width="125px">
					<h3>음료/푸드</h3>
				</td>
			</tr>
			<div id="cartbody">
			<%
			int sum_price = 0;
			if(cart_count > 0 )
			{
				for(int i = 0 ; i < cart_count ; i++)
				{
					String sel_option	= (String) session.getAttribute("sel_option"+i);
					String select_item 	= (String) session.getAttribute("select_item"+i);
					String total_price 	= (String) session.getAttribute("total_price"+i);
					
					String temp_price = total_price.replace(",","");
					sum_price += Integer.parseInt(temp_price);
					
					
					String[] option = sel_option.split(",");
					String[] items = select_item.split("@");
					
					String shot		= option[0];
					String syrup	= option[1];
					String count	= option[2];
					String size		= items[0];
					String name		= items[1];
					String price	= items[2];
					String no	= items[3];
					
					int pro_no = Integer.parseInt(no);
					productsDTO	pdto = new productsDTO();
					productsVO	pro = null;
					pro = pdto.GetItem(pro_no);
					%>
					<tr>
						<td style="width:125px; height:80px">
						<a href="../order/view.jsp">
						<img style="border-radius:10px; width:auto; height:125px;"
							 src="../order/download.jsp?file=<%= pro.images().get(0).img_pname() %>&name=<%= pro.images().get(0).img_lname() %>">
						</a>		
							</td>
							<td colspan="3">
								<a id="cart_name" href="../order/view.jsp"><%= name %></a>
								<div id="cart_option" style="font-size:12px"><%= size %><div style="float:right"><%= price %></div></div>
								<div id="cart_op_price"  style="font-size:12px">시럽추가<div style="float:right"><%= syrup %>회</div></div>
								<div id="cart_op_price"  style="font-size:12px">샷추가<div style="float:right"><%= shot %>회</div></div>
								<p><div id="cart_count" ><div id="cart_price" style="float:right"><%= total_price %></div></div></p>
							</td>
					</tr>
					<%
				}
			}
			%>
			</div>
			<tr>
				<td colspan="4" style="border-top:10px; height:1px;background-color:#A6A6A6"></td>
			</tr>
			<tr>
				<td colspan="3">
					<h3><div style="float:right" id="sum_price"><%= sum_price %></div></h3>
				</td>
			</tr>
			<tr>
				<td>
				</td>
			</tr>
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 6rem;">
				<td width=500px align=center>
					<a class="btn re" href="javascript:shoppingdel();">장바구니 비우기</a><a class="btn" href="../order/payment.jsp">주문하기</a>
				</td>
			</tr>
		</table>
	</body>
</html>