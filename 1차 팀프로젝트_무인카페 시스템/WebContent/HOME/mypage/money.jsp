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
							<p><%= userid  %>님 환영합니다</p>
						
						</div>
						
						<h1 class="myps"></h1>
						
						<P align="center">[<%= userid  %>]님의 사용가능한 적립금액은 총 <span style="color:blue;"><%=loginVO.point() %>원</span>입니다.</P>
						<p align="center">적립내역</p>
						<table class="boardhan" align="center" border="1" style="width:600px;" class="myinfo">
						<tr>
							<td class=myinfos style="width:70px; height:20px;" >거래일자</td>
							<td style="width:100px;">주문번호</td>
							<td class=myinfos style="width:70px; height:20px;">내용</td>
							<td style="width:100px;">적립금</td>
						</tr>
						<tr>
							<td class=myinfos style="width:70px;">2022-01-02</td>
							<td style="width:100px;"></td>
							<td class=myinfos style="width:70px;">첫가입적립금</td>
							<td style="width:100px;">5000원</td>
						</tr>
						<tr>
							<td class=myinfos style="width:70px;">2022-03-05 </td>
							<td style="width:100px;">P15234</td>
							<td class=myinfos style="width:70px; height:20px;">제품구매적립</td>
							<td style="width:70px;">200원</td>
							
						</tr>
					
					</table>
					<div class="btnCommon type2">
						<a href="userinfo.jsp" class="btnBlack">뒤로가기</a>
					</div>
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>