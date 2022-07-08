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
						
						
						<h1 class="myps"></h1>
						<P align="center">[<%= userid  %>]님의 사용가능한 예치금액은 총 <span style="color:blue;"><%=loginVO.deposit() %>원</span>입니다.</P>
						<p align="center">충전하기(가상계좌입금)</p>
							
						 <form class="form">
						    <fieldset>
						      <label for="card-number">(주)메타벅스커피코리아  <br>신한:115-445-787979</label>
						    </fieldset>
						    <fieldset>
						    <label for="deposit">입금액</label>
						    <select id="deposit">
						          <option></option>
						          <option>5000원</option>
						          <option>10000원</option>
						          <option>15000원</option>
						          <option>20000원</option>
						          <option>25000원</option>
						          <option>30000원</option>
						          <option>35000원</option>
						          <option>40000원</option>
						          <option>45000원</option>
						          <option>50000원</option>
						       </select>
						    </fieldset>	
						    <fieldset>
						      <label for="card-holder">입금자명</label>
						      <input type="text" id="card-holder" />
						    </fieldset>
						  </form>
						
													
							<div class="btnCommon type2">
								<a href="../members.html" class="btnBlack">입금</a>
								<a href="#none" class="btnGray" onclick="history.go(-1); return false;">취소</a>
	   						</div>
	   						
				</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>