<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%



accountVO vo = new accountVO();
accountDTO dto = new accountDTO();





if(loginVO !=null)
{
 userid = loginVO.id();
 String email =loginVO.em();
 loginVO.pw();
 loginVO.hp();
 
}

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
						<P align="center">[<%= userid  %>]님의 회원정보 입니다.</P>
					</div>
						<!--<div>	
							<ul class="myp">
								<li><a href="order.jsp">주문내역</a></li>
								<li><a href="mymenuok.jsp">나의 메뉴</a></li>
								<li><a href="money.jsp">나의 적립금<span style="color:blue;">400원</span></a></li>
								<li><a href="charge.jsp">예치금<span style="color:blue;">50000원</span></a></li>
								<li><a href="pay.jsp">결제수단 관리</a></li>
								<li><a href="userinfo.jsp">나의 정보</a></li>
							</ul>
							
						</div>  -->
						<h1 class="myps"></h1>
						<table class="boardhan"  border="1" style="width:600px;" class="myinfo">
							<tr>
								<td class=myinfos style="width:150px; height:20px;" >닉네임</td>
								<td style="width:150px;"><%=loginVO.nickname() %></td>
								<td class=myinfos style="width:80px; height:20px;">이메일</td>
								<td style="width:100px;"><%=loginVO.em() %></td>
							</tr>
							<tr>
								<td class=myinfos style="width:150px; height:20px;" >아이디</td>
								<td style="width:150px;"><%=loginVO.id() %></td>
								<td class=myinfos style="width:80px; height:20px;">휴대전화</td>
								<td style="width:100px;"><%=loginVO.hp() %></td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">성별</td>
								<td style="width:100px;">
									<input type="radio" name="gender" value="man" <%= loginVO.gen().equals("1") ? "checked" : "" %> >남
									<input type="radio" name="gender" value="woman" <%= loginVO.gen().equals("0") ? "checked" : "" %>>여</td>
								<td class=myinfos style="width:80px;">생년월일</td>
								<td style="width:100px;"><%=loginVO.age() %></td>
							</tr>
						</table>
							<h1 class="myps"></h1>
						<p align="center">고객님이 선호하는 메뉴</p>
						<table  class="boardhan" border="1" style="width:70%;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >이미지</td>
								<td style="width:100px;">메뉴명 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								<td style="width:30px; text-align:center;">선택
								<input type="checkbox" id="ckall" name="ckall"></td>
								
							</tr>
							

							
							<tr>
								<td class=myinfos style="width:70px;"><span class="img-w50"><img src="https://silverwoods.synology.me:8081/productimage/americano222.png" alt=""></span></td>
								<td style="width:100px;">아메리카노</td>
								<td class=myinfos style="width:70px;">1500원</td>
								<td style="text-align:center;">
					
								<input type="checkbox" name="chkno" value="">
					
							</td>
							</tr>
							  
						</table>
						<h1 class="myps"></h1>
						
						<P align="center">[<%= userid  %>]님의 주문내역 입니다.</P>
						<table class="boardhan" border="1" style="width:700px;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >주문일자</td>
								<td style="width:100px;">내용 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								<td style="width:30px;">결제수단 </td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-01-02 15:26:30</td>
								<td style="width:100px;">아메리카노Ice</td>
								<td class=myinfos style="width:70px;">1500원</td>
								<td style="width:30px;">신용카드 </td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-03-05 14:47:05 </td>
								<td style="width:100px;">카페라테Ice</td>
								<td class=myinfos style="width:70px;">2000원</td>
								<td style="width:30px;">신용카드 </td>
							</tr>
						</table>
						<h1 class="myps"></h1>
						
						<P align="center">[<%= userid  %>]님의 사용가능한 적립금액은 총 <span style="color:blue;"><%=loginVO.point() %>원</span>입니다.</P>
						<p align="center">적립내역</p>
						<table class="boardhan"  border="1" style="width:600px;" class="myinfo">
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
								<td style="width:100px;">200원</td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-03-05 </td>
								<td style="width:100px;">P15234</td>
								<td class=myinfos style="width:70px; height:20px;">제품구매적립</td>
								<td style="width:70px;">200원</td>
								
							</tr>
						</table>
						<h1 class="myps"></h1>
						<P align="center">[<%= userid  %>]님의 사용가능한 예치금액은 총 <span style="color:blue;"><%=loginVO.deposit() %>원</span>입니다.</P>
						<p align="center">예치금 충전내역</p>
						<table class="boardhan"  border="1" style="width:70%;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >충전일자</td>
								<td style="width:100px;">내용 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-01-02 15:26:30</td>
								<td style="width:100px;">신용카드</td>
								<td class=myinfos style="width:70px;">50000원</td>
							
							</tr>
							<tr>
								<td class=myinfos style="width:70px;">2022-03-05 14:47:05 </td>
								<td style="width:100px;">계좌 이체</td>
								<td class=myinfos style="width:70px;">10000원</td>
							</tr>
						</table>
						<h1 class="myps"></h1>
						<p align="center">결제수단 관리</p>
						<table class="boardhan"border="1" style="width:800px;" class="myinfo">
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td>
				                    <input type="radio" name="pay" value="credit" <%= loginVO.pay_str().equals("신용카드") ? "checked" : "" %>>신용/체크카드
								</td>
								<td>
									<div class=""><a href="card.jsp" class="btnCommon">카드등록</a></div>
								</td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td><input type="radio" name="pay" value="cash" <%= loginVO.pay_str().equals("예치금") ? "checked" : "" %>>예치금</td>
								<td>
									<div class=""><a href="deposit.jsp" class="btnCommon">예치금충전</a></div>
								</td>
							</tr>
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >결제방식</td>
								<td><input type="radio" name="pay" value="cash" <%= loginVO.pay_str().equals("적립금") ? "checked" : "" %>>적립금</td>
								<td>
									<div class=""><a href="money.jsp" class="btnCommon">적립금보기</a></div>
								</td>
							</tr>
						</table>
						<div class="btnCommon type2">
							<a href="infomody.jsp" class="btnBlack">정보 수정</a>
							<a href="../index.jsp" class="btnGray">메인으로</a>
						</div>	
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>