<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<script>
	window.onload=function()
	{
		$("#email").focus();
	}

</script>
	
<!-- ------------------ 콘텐츠 시작------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 20px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">문의하기</span>
			</td>
		</tr>	
	</table>	
	<form name="contact" action="../mail/sendMail.jsp" method="post">	
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5; height:35px;">이메일</td>
				<td><input type="text"  id="email"  name="email" style="width:80%;"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5; height:35px;">제목</td>
				<td><input type="text" id="title" name="title" style="width:80%;"></td>
			</tr>					
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">문의사항</td>
				<td><textarea id="note" name="note" style="width:80%; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<div style="height:30px;"></div>
					<%
					if(login_id != null)
					{
						%>
						<input id="loginbtn" type="submit" value="문의하기">
						<a id="loginbtn"  href="../main/index.jsp">취소</a>
						<%				
					}
					%>
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>					
	</form>	
<!-- ----------------------------------------------------------------------------------------- -->	
<%@ include file="../includes/tail.jsp" %>