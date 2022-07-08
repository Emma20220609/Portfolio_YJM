<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head2.jsp" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");

//상품 이미지를 포함하는 상품용 DTO VO 사용
productsDTO	pdto	= new productsDTO();
productsVO	product	= null;
//상품 리스트를 생성한다
pdto.GetProList();
%>
<script src="../js/menu.js"></script>
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
		<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> MENU</p>
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
				//아이템 갯수를 얻음
				int MAX = pdto.GetTotal("pro");
				for(int i=0; i< MAX; i++)
				{
					product = pdto.GetProItem(i);
					String style = "";
					String msg = "";
					if(product.flag_sell().equals("0"))
					{
						style = "style='filter: grayscale(100%)'";
						msg = "판매중지";
					}
				%>
					<li>
						
						<a href="javascript:void(0);" onclick="addfav(this);" id="btnGray" class="unselect">★</a>
							<input type="hidden"  id="fav_name" name="fav_name" value="<%= product.name() %>">
							<input type="hidden"  id="fav_price" name="fav_price" value="<%= product.price() %>">
							<input type="hidden"  id="fav_no" name="fav_no" value="<%= product.pro_no() %>">
							<input type="hidden"  id="fav_hname" name="fav_hname" value="<%= product.hname() %>">
						<span class="favmenu">
						<%
						if(product.images().size() != 0)
						{
							for(imageVO items : product.images())
							{
								%>
								<img src="download.jsp?file=<%= items.img_pname() %>&name=<%= items.img_lname() %>" 
								<%= style %>
								><br>
								<%
							}
						}
						%>
						<!-- <img src="https://silverwoods.synology.me:8081/productimage/americano.png" alt=""></span> -->
						<p><%= msg %></p>
						<p class="unselect"><%= product.name() %></p>
						<p><%= product.ename() %><br></p>
						<p><%= product.price() %><br></p>
						<p><%= product.hname() %><br></p>
						
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
								<p><%= product.name() %><br /></p>
							</div>
						</div>					
					</li>
				<%
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