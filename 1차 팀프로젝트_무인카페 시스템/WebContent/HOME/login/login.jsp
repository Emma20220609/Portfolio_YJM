<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%


//session.setAttribute("id",null);
//session.setAttribute("name",null);
%>
<script>
window.onload = function()
	{
		$("#id").focus();
	}
	
	function DoLogin()
	{
		if($("#id").val() == "" || $("#id").val() == null)
			
		{
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if($("#pw").val() == "")
		{
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		
		//로그인 처리
		$.ajax({
			type : "post",
			url: "loginok.jsp",
			dataType: "html",
			data: 
			{
				id: $("#id").val(),
				pw: $("#pw").val()
		    },	
			success : function(data) 
			{
				data = data.trim();
				
				if(data == "OK")
				{
					document.location = "../index.jsp";
				}else
				{
					
					$("#spanMsg").html("아이디 또는 비밀번호가 일치하지 않습니다.");
					$("#spanMsg").css("color","red");
					$("#id").focus();
				}
			}
		});	
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
			<h2 class="page_tit">로그인</h2>
			
			<div class="outer tint">
				<div class=" xans-member-login">
						<h3 class="hidden">로그인</h3>
	
						<!--로그인 -->
					<div id="contents">
						<form id="login" name="" action="loginok.jsp" method="post">
							<div class="xans-element- xans-member xans-member-login ">
								<div class="login">
									<fieldset>
										<label class="id"><span>ID</span><input id="id" name="id"  class="inputTypeText" placeholder="" value="test" type="text"></label>
							            <label class="password"><span id="spanMsg">PASSWORD</span><input id="pw" name="pw"  autocomplete="off" value="1231" type="password"></label>
							            <strong><a href="javascript:DoLogin();">LOGIN</a></strong>
							            <ul>
											<li><a href="searchid.jsp">search id</a></li>
											<li><a href="searchpw.jsp">search password</a></li>
											<li style="margin:10px 0 0;"><span><a href="../join/join.jsp">join member</a></span></li>
										</ul>
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