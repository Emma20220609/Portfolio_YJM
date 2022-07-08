<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
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
							<p><%=userid  %>님 환영합니다</p>
							
						</div>
						<div>	
							<ul class="myp">
								<li><a href="order.jsp">주문내역</a></li>
								<li><a href="mymenu.jsp">나의 메뉴</a></li>
								<li><a href="coupon.jsp">나의 쿠폰<span style="color:blue;">2개</span></a></li>
								<li><a href="money.jsp">나의 적립금<span style="color:blue;">400원</span></a></li>
								<li><a href="charge.jsp">예치금<span style="color:blue;">50000원</span></a></li>
								<li><a href="pay.jsp">결제수단 관리</a></li>
								<li><a href="userinfo.jsp">나의 정보</a></li>
							</ul>
							
						</div>
						<h1 class="myps"></h1>
						<p align="center">나의 쿠폰</p>
						<table align="center" border="1" style="width:700px;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >발급일자</td>
								<td class=myinfos style="width:30px; height:20px;" >쿠폰번호</td>
								<td style="width:100px;">내용 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-01-02 15:26:30</td>
								<td class=myinfos style="width:30px; height:20px;" >00004</td>
								<td style="width:100px;">첫가입쿠폰</td>
								<td class=myinfos style="width:70px;">5000원</td>
							
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-03-05 14:47:05 </td>
								<td class=myinfos style="width:30px; height:20px;" >00054</td>
								<td style="width:100px;">SNS이벤트쿠폰</td>
								<td class=myinfos style="width:70px;">5000원</td>
								
							</tr>
						
						</table>
						<div class="btnCommon type2">
							<a href="../nav/members.jsp" class="btnBlack">뒤로가기</a>
							
	   					</div>
							
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>