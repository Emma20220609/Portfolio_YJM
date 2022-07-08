<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>   
<%@ page import="meta.dto.*" %>    
<%

request.setCharacterEncoding("UTF-8");
//orderok 에서 선택된 음료 주문에 대한 값을 받아옴
String select_item	= request.getParameter("select_item");
String sel_option	= request.getParameter("sel_option");
String total_price	= request.getParameter("total_price");

//값이 없거나 다를때 
if( select_item == null || select_item.equals("")|| sel_option==null || sel_option.equals("") || total_price==null || total_price.equals(""))
{
	response.sendRedirect("index.jsp");
	return;
}
/*
out.print(sel_option + "<br>");
out.print(total_price + "<br>");
out.print(select_item + "<br>");
*/

//샷, 시럽, 음료개수
String [] option = sel_option.split(",");

//out.print("shot = " + option[0] +" syrup = " + option[1]+ " 음료개수 = "+ option[2] + "<br>"); 

//사이즈, 이름, 기본가격
String [] item = select_item.split("@");
//out.println("size = " + menu[0] + " name = " + menu[1] + " 기본가격 = " + menu[2] );

String size		=	item[0] ;
String name		=	item[1];
String price	=	item[2];
String no		=	item[3];
String shot		=	option[0];
String syrup	=	option[1];
String count	=	option[2];

int pro_no = Integer.parseInt(no);
productsDTO	pdto = new productsDTO();
productsVO	pro = null;
pro = pdto.GetItem(pro_no);

//넘어온 총 주문정보
String payInfo	=	size + "@" + name + "@" + price + "@" + shot + "@" + syrup + "@" + count + "@" + total_price + "@" + no;


%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<script>
		function DoPayMent()
		{
			
			$.ajax({
				type : "post",
				url: "paymentok.jsp",
				dataType: "html",
				data: 
				{
					payInfo:$("#payInfo").val(),
					selPay:$("#selPay").val()
			    },	
				success : function(data) 
				{
					data = data.trim();
					if(data == data)
					{
			            // Contents 영역 교체
			            $('#contents').html(data);
					}else
					{
						alert (data);
					}
				}
			});	
			
		}
	</script>
	
	<body>
		<div id="contents" >
		<table border="0" align=center width=500px>
		<tr>
			<td>
				<a href="orderok.jsp"><img src="../img/back.png"></a>
			</td>
		</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						결제하기
					</h2>
				</td>
			</tr>
			<tr>
				<td width="125px">
					<h3>결제수단</h3>
				</td>
			</tr>
			<tr>
				<td width="125px">
					<select name="selPay" id="selPay">
						<option value="card">신용카드</option>
						<option value="deposit">예치금</option>
						<option value="point">적립금</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<h3>주문내역</h3>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px " rowspan="5" >
					<img width="125px" src="download.jsp?file=<%= pro.images().get(0).img_pname() %>&name=<%= pro.images().get(0).img_lname() %>">
				</td>
				<td id="name"colspan="3" >
					<%= name %>
				</td>
				<td id="price" align=right>
					<%= price %>원
				</td>
			</tr>
			<tr>
				<td colspan="3">
					수량
				</td>
				<td  id="count" align=right>
					<%= count %>
				</td>
			</tr>
			<tr>
				<td colspan="3" >
					사이즈 
				</td>
				<td id="size" align=right>
					<%= size %>
				</td>
			</tr>
			<tr>
				<td id="shot" colspan="3" >
					샷 
				</td>
				<td align=right>
					<%= shot %>
				</td>
			</tr>
			<tr>
				<td id="syrup" colspan="3" >
					시럽 
				</td>
				<td colspan="2" align=right>
					<%= syrup %>
				</td>
				  
			</tr>
			<tr>
				<td>
					<input type="hidden" id="payInfo" id="payInfo" value="<%= payInfo %>">
				</td>
			</tr>
			<tr style="overflow: hidden;position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 12rem;">
							<td width=112px align=center>
								최종 결제 금액
							</td>
							<td id="total_price" width=380px align=right>
								<%= total_price %> 원
							</td>
			</tr>
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 6rem;">
				<td width=500px align=center>
					<a class="btn" href="javascript:DoPayMent();"><%= total_price %>원 결제하기</a>
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>