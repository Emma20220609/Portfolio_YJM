<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String str = request.getParameter("str");
String type = request.getParameter("id_search_type");
System.out.println(str);
System.out.println(type);
//String name = request.getParameter("name");
//String phonenumber = request.getParameter("phonenumber");


accountDTO dto = new accountDTO();
accountVO  search = dto.Searchid(str, type);

if(str == null ||str.equals("") || type == null ||type.equals(""))
{
	out.println("ERROR");
	
	return;
}
else
{
	out.println("OK");
}



%>

<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K06.png" alt="MENU"></p>
			<p class="page_path"><a href="..index.jsp">HOME</a><span class="arr"></span>로그인</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">아이디찾기</h2>
			
			<div class="outer tint">
				<div class=" xans-member-login">
						<h3 class="hidden">이름 휴대전화번호로 찾기</h3>
	
						<!--로그인 -->
					<div id="contents">
						<form id="login" name="" action="loginok.jsp" method="post">
							<div class="xans-element- xans-member xans-member-login ">
								<div class="login">
									<fieldset>
										<label><span>
										
										<%
										if(search == null)
										{
											%>일치하는 아이디가 없습니다!<%
										}else
										{
											%>회원님의 아이디는 " <%= search.id() %>" 입니다!<%
										}
										%>
										</span></label>
							            
							            <strong><a href="login.jsp">로그인하기</a></strong>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
						
				</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>