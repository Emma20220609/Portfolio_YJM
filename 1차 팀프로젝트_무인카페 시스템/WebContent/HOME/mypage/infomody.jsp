<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<!--Container-->

<script>
function DoModify()
{
	if(confirm("변경된 정보를 저장하시겠습니까?") != 1)
	{
		return;	
	}
	$("#frmModify").submit();
}
</script>
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
						<p align="center">회원 정보</p>
						<form id="frmModify" name="frmModify" method="post" action="infomodyok.jsp">
							<table align="center" border="1" style="width:600px;" class="myinfo">
								<tr>
									<td class=myinfos style="width:70px; height:20px;" >닉네임</td>
									<td><input type="text" id="nickname" name="nickname" value="<%=loginVO.nickname() %>"></td>
									<td class=myinfos style="width:80px; height:20px;">이메일</td>
									<td><input type="text" id="em" name="em"  value="<%=loginVO.em() %>"></td>
								</tr>
								<tr>
									<td class=myinfos style="width:70px; height:20px;" >아이디</td>
									<td><input type="text" id="id" name="id"  value="<%=loginVO.id() %>"></td>
									<td class=myinfos style="width:80px; height:20px;">휴대전화</td>
									<td><input type="text" id="hp" name="hp"  value="<%=loginVO.hp() %>"></td>
								</tr>
								<tr>
									<td class=myinfos style="width:70px;">성별</td>
									<td style="width:100px;">
									<input type="radio" name="gender" value="1" <%= loginVO.gen().equals("1") ? "checked" : "" %>>남
									<input type="radio" name="gender" value="0"<%= loginVO.gen().equals("0") ? "checked" : "" %>>여</td>
									<td class=myinfos style="width:80px;">생년월일</td>
									<td><input type="text" id="age" name="age"  value="<%=loginVO.age() %>"></td>
								</tr>
							</table>
						</form>	
						<div class="btnCommon type2">
							<a href=javascript:DoModify(); class="btnBlack">수정 완료</a>
						</div>	
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>