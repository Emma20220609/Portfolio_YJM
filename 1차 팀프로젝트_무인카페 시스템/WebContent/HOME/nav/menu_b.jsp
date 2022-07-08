<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head2.jsp" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");

SearchVO searchVO = new SearchVO(request);
ListDTO  listDTO  = new ListDTO(searchVO);
productsDTO pdto = new productsDTO();
productsVO product= null;
pdto.GetProList();

int MAX = pdto.GetTotal("pro");
System.out.println(MAX);
for(int i=0; i< MAX; i++)
{
	product = pdto.GetProItem(i);
}

System.out.println(product.hname());



%>
<script>
window.onload= function()
{
}

//선호메뉴 선택
function addfav(obj)
{
	var cls = $(obj).attr("class");
	
	if(cls == "select")
	{
		//선택 해제
		alert("선호하는 메뉴를 취소합니다");
		$(obj).removeClass("select");
		$(obj).addClass("unselect");
		
	}else
	{
		//선택
		
		alert("선호하는 메뉴를 선택합니다");
		$(obj).removeClass("unselect");
		$(obj).addClass("select");
		
	}

}
//선호메뉴 값 보내기
function favSend()
{
	var datalist="";
	$(".select").each(function(){
	
		/*
		var value = $(this).parent().find("#fav_name").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		
		var value = $(this).parent().find("#fav_price").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		
		var value = $(this).parent().find("#fav_no").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		*/
		var value = $(this).parent().find("#fav_hname").val();
		//alert(value);
		if(datalist != "") datalist += ",";
		datalist += value;	
		
		var value = $(this).parent().find("#fav_price").val();
		if(datalist != "") datalist += "#";
		datalist += value;
		//alert(value);
		
		
	});
	alert(datalist);
	if(datalist=="")
	{
		alert("선택된 메뉴가 없습니다");
		return;
	}	
	$("#fav_menu").val(datalist);
	
	document.favForm.submit();
	
}

</script>
<style>
a.unselect
{
	color: green;
	font-size:15px;
}

a.select
{
	color: red;
	font-size:15px;
}		


</style>
<!--Container-->
<div id="container">
	<div class="sv_wrap K01">
		<p class="sv_tit"><img src="../image/tit_K02.png" alt="MENU"></p>
		<p class="page_path"><a href="index.html">HOME</a><span class="arr"></span> MENU</p>
	</div>
	<!-- Content-->
	<div class="content">
		<h2 class="page_tit">MENU</h2>
		<div class="outer pt20 pb20 tint">
			<div class="inner">
		<form id="favForm" name="favForm" method="post" action="../mypage/mymenu.jsp">
			<input type="hidden" id="fav_menu" name="fav_menu" value="">
				<ul class="menu_list">
				<%
				//게시물의 갯수를 얻는다.
				//int total = listDTO.GetProTotal();
				//System.out.println(total);
				
				//listDTO.GetproList(searchVO.getCurpage());
				listDTO.GetHomeMenu(searchVO.getCurpage());

				//int size = listDTO.GetProTotal();
				//int seqno = total - (searchVO.getCurpage() - 1) * 10;
				//ArrayList<productVO> list = listDTO.GetHomeMenulist();
				ArrayList<productVO> list = listDTO.GetHomeMenulist();
				for(productVO item : list)
				{
					%>
					<li>
						
						<a href="javascript:void(0);" onclick="addfav(this);" id="btnGray" class="unselect">★</a>
							<input type="hidden"  id="fav_name" name="fav_name" value="<%=item.getName()%>">
							<input type="hidden"  id="fav_price" name="fav_price" value="<%=item.getPrice()%>">
							<input type="hidden"  id="fav_no" name="fav_no" value="<%=item.getPro_no()%>">
							<input type="hidden"  id="fav_hname" name="fav_hname" value="<%=item.getHname()%>">
						<span class="favmenu">
						<%
						if(product.images().size() != 0)
						{
							for(imageVO items : product.images())
							{
								%>
								<img src="download.jsp?file=<%= items.img_pname() %>&name=<%= items.img_lname() %>"><br>
								<%
							}
						}
						%>
						<!-- <img src="https://silverwoods.synology.me:8081/productimage/americano.png" alt=""></span> -->
						<p class="unselect"><%= item.getName()  %></p>
						<p><%= item.getEname() %><br></p>
						<p><%= item.getPrice()   %><br></p>
						<p><%= item.getHname()   %><br></p>
						
						<!--<p>Solo(22ml)/0.75 fl oz<br>  -->
						<div class="desc">
							<div class="cell">
								<p class="price">
								1회제공량 기준<br>
								열량(kcal)10<br>
								당류(g)-<br>
								나트륨(mg)-<br>
								단백질(g)1<br>
								포화지방(g)-<br>
								카페인(mg)160</p>
								<p><%= item.getName() %><br /></p>
							</div>
						</div>					
					</li><%
				}
				
				
				
				%>	
				<div>
				</form>
				<span> <a href="javascript:favSend();" class="btnBlack">선호메뉴 등록</a></span>						
				</div>
				</ul>
				
					
					
			</div><!-- END Inner -->
		</div><!-- END Outer -->

	</div><!-- END Content -->
</div><!--END Container-->

<%@ include file="../include/tail.jsp" %>