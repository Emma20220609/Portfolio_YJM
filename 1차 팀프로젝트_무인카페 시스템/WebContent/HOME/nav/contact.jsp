<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head2.jsp" %>
<link type="text/css" rel="stylesheet" href="../css/email.css">
<script>
	function DoSubmit()
	{
		if(confirm("메일을 전송하시겠습니까 ?") !=1)
		{
			return false;
		}	
		return true;
	}


</script>
<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K04.png" alt="contact"></p>
			<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> Contact<span class="arr"></span>이메일 문의하기</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">e-mail 문의하기</h2>
			
			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">e-mail 문의하기</h3>

					<!-- 이메일 문의 폼 -->
				
					<form id="form" name="form" class="topBefore" method="post" action="sendok.jsp" onsubmit="javascript:return DoSubmit();">
					 	<input id="title" 	name="title" type="text" placeholder="NAME">
					 	<input id="to" name="to" type="text" placeholder="E-MAIL">
					 	<textarea id="note" name="note" type="text" placeholder="MESSAGE"></textarea>
				  		<input id="submit" type="submit" value="SEND!">
					</form>
				
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>