<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>

<%
System.out.println(loginVO.pay_str());
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
						<p align="center">결제수단 관리</p>
						<table class="boardhan"align="center" border="1" style="width:800px;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td>
								
				                    <input type="radio" name="pay" value="credit" <%= loginVO.pay_str().equals("신용카드") ? "checked" : "" %>>신용/체크카드
								<input type="radio" name="pay" value="cash" <%= loginVO.pay_str().equals("예치금")?"checked":"" %>>예치금</td>
								<input type="radio" name="pay" value="cash" <%= loginVO.pay_str().equals("적립금")?"checked":"" %>>적립금</td>
								</td>
				                  
								<td>
									<div class=""><a href="card.jsp" class="btnCommon">카드등록</a></div>
									<div class=""><a href="deposit.jsp" class="btnCommon">예치금충전</a></div>
									<div class=""><a href="money.jsp" class="btnCommon">적립금보기</a></div>
								</td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td>
								<td>
								</td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td>
								<td>
								</td>
							</tr>
							
							
						</table>
						<div class="btnCommon type2">
							<a href="../nav/members.jsp" class="btnBlack">변경</a>
							<a href="#none" class="btnGray" onclick="history.go(-1); return false;">취소</a>
	   					</div>
				</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>