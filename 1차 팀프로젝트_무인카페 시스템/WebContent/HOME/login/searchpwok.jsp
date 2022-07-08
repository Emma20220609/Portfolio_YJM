<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%@ page import="meta.mail.*" %>
<%
request.setCharacterEncoding("UTF-8");

String id	= request.getParameter("id");
String hp	= request.getParameter("phone");
String em	= request.getParameter("em");


accountDTO dto	= new accountDTO();
accountVO  vo	= dto.Searchpw(id, em, hp);
MailDTO	   mdto	= new MailDTO();


if(id == null ||id.equals("") || hp == null ||hp.equals("") || em == null ||em.equals(""))
{
	System.out.println("ERROR");
	
	return;
}
else
{
	System.out.println("OK");
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
			<h2 class="page_tit">비밀번호 찾기</h2>
			
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
										if(vo == null)
										{
											%>일치하는 정보가 없습니다!<%
										}else
										{
											%>임시 비밀번호를 회원님의 메일<%= vo.em()  %>로 보냈습니다!<%
												mdto.MailSend(em);
												dto.UpdatePW(id, mdto.uuid);
										}
										%>
										</span></label>
							            
							            
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