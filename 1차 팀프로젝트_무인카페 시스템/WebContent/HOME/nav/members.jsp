<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head2.jsp" %>
<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K05.png" alt="MENU"></p>
			<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> Members<span class="arr"></span>마이페이지</p>
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
						<div class="board-list">	
							<ul class="myp">
								<li><a href="../mypage/order.jsp">주문내역</a></li>
								<li><a href="../mypage/mymenu.jsp">나의 메뉴</a></li>
								<li><a href="../mypage/coupon.jsp">나의 쿠폰<span style="color:blue;">2개</span></a></li>
								<li><a href="../mypage/money.jsp">나의 적립금<span style="color:blue;">400원</span></a></li>
								<li><a href="../mypage/charge.jsp">예치금<span style="color:blue;">50000원</span></a></li>
								<li><a href="../mypage/pay.jsp">결제수단 관리</a></li>
								<li><a href="../mypage/userinfo.jsp">나의 정보</a></li>
							</ul>
							
							
						</div>
						<h1 class="myps"></h1>
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>