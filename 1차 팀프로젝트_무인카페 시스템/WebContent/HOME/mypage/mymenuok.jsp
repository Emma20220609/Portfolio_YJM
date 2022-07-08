<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../include/head3.jsp" %>
<%
//request.setCharacterEncoding("UTF-8");

//String    fav_menu = request.getParameter("fav_menu");
//String [] fav_ary  = fav_menu.split(",");

/*
for(String item : fav_ary)
{
	//out.print("아이템:"+item + "<br>");
	
	String [] fav = item.split("#");
	
	out.print("제품이름:" + fav[0] + "<br>");
	out.print("제품가격:" + fav[1] + "<br>");
	
}
*/


%>

<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K05.png" alt="MENU"></p>
			<p class="page_path"><a href="/">HOME</a><span class="arr"></span> Members<span class="arr"></span>마이페이지</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">마이페이지</h2>
			
			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">마이페이지</h3>

					<!--마이페이지 -->
						<div class="myp">
							<p><%= userid  %>님 환영합니다</p>
						</div>
						<div>	
							<ul class="myp">
								<li><a href="order.jsp">주문내역</a></li>
								<li><a href="mymenu.jsp">나의 메뉴</a></li>
								<li><a href="money.jsp">나의 적립금<span style="color:blue;">400원</span></a></li>
								<li><a href="charge.jsp">예치금<span style="color:blue;">50000원</span></a></li>
								<li><a href="pay.jsp">결제수단 관리</a></li>
								<li><a href="userinfo.jsp">나의 정보</a></li>
							</ul>
							
						</div>
						<h1 class="myps"></h1>
						<p align="center">고객님이 선호하는 메뉴</p>
						<table  class="boardhan"align="center" border="1" style="width:70%;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >이미지</td>
								<td style="width:100px;">메뉴명 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								<td style="width:30px; text-align:center;">선택
								<input type="checkbox" id="ckall" name="ckall"></td>
								
							</tr>
							

							
							<tr>
								<td class=myinfos style="width:70px;"><span class="img-w50"><img src="../image/food/icelatte.jpg" alt=""></span></td>
								<td style="width:100px;">카페라떼</td>
								<td class=myinfos style="width:70px;">1500원</td>
								<td style="text-align:center;">
					
								<input type="checkbox" name="chkno" value="">
					
							</td>
							</tr>
							  
						</table>
						<div class="btnCommon type2">
							<a href="../nav/members.jsp" class="btnBlack">뒤로가기</a>
							<a href="#none" class="btnGray" onclick="history.go(-1); return false;">메뉴삭제</a>
	   					</div>
					
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>