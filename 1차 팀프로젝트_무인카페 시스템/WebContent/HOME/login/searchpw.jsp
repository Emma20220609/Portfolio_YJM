<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%@ page import="meta.util.*" %>
<%


%>
<script>

function ValidCheckForm()
{
	var mReturnFlag = true;
	$("input[must]").each(function()
	{
		if( $(this).attr("must") != "")
		{
			if( $(this).val() == "")
			{
				alert($(this).attr("must"));
				$(this).focus();
				mReturnFlag = false;
				return false;
			}
		}
	});
	return mReturnFlag;
}
function DoSubmit()
{
	if( ValidCheckForm() == false) return;
	alert("비밀번호 찾기를 진행합니다.");
	$("#searchpw").submit();


}


</script>
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
						<form id="searchpw" name="searchpw" action="searchpwok.jsp" method="post">
							<div class="xans-element- xans-member xans-member-login ">
								<div class="login">
									<fieldset>
										<label class="id"><span>ID</span><input must="아이디는 필수 입력입니다" id="id" name="id"  class="inputTypeText" value="" type="text"></label>
							            <label class="phone"><span id=>PHONE NUMBER</span><input must="전화번호를 입력하세요" id="phone" name="phone" value="" ></label>
										<label class="em"><span id=>E-MAIL</span><input must="이메일을 입력하세요" id="em" name="em"   value="" ></label>
										<strong><a href="javascript:DoSubmit();">찾기</a></strong>
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