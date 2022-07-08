<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.util.*" %>
<%

SearchVO searchvo = new SearchVO(request);
%>
<script>

/*function ValidCheckForm()
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
}*/
function DoSubmit()
{

	alert("아이디찾기를 진행합니다.");
	$("#searchid").submit();


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
			<h2 class="page_tit">아이디찾기</h2>

			<div class="outer tint">
				<div class=" xans-member-login">
						<h3 class="hidden">이름 휴대전화번호로 찾기</h3>

						<!--로그인 -->
					<div id="contents">
						<form id="searchid" name="searchid" action="searchidok.jsp" method="post">
							<div class="xans-element- xans-member xans-member-login ">
								<div class="login">
									<fieldset>
										<select name="id_search_type" >
											<option value="name"<%= searchvo.getId_search_type().equals("name") ? "selected" : "" %>>이름으로 찾기</option>
											<option value= "hp"	<%= searchvo.getId_search_type().equals("hp") ? "selected" : "" %>>전화번호로 찾기</option>
										</select>
										<input id="str" name="str" value="">
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