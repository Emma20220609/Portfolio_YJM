<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<script>
	window.onload = function()
	{
		$("#usernum").focus();
	}

	function DoLogin()
	{
		if($("#usernum").val() == "" || $("#usernum").val() == null)
			
		{
			alert("회원번호를 입력하세요.");
			$("#usernum").focus();
			return;
		}	
		
		//로그인 처리
		$.ajax({
			type : "post",
			url: "loginok.jsp",
			dataType: "html",
			data: 
			{
				usernum: $("#usernum").val()
		    },	
			success : function(data) 
			{
				data = data.trim();
				if(data == "OK")
				{
					document.location = "drinkmenu.jsp";
				}else
				{
					alert("회원번호가 일치하지 않습니다.");
				}
			}
		});	
	}
</script>
<!-- ==================================================================================================================== -->
<tr>
	<td style="background-color:white;padding:150px 0px 150px 0px" colspan=3>
		<form name="login" method="post" action="loginok.jsp" onsubmit="javascript:return false;">
		<table id="login" border="0" height="900" width="700" style="margin : auto; text-align:center">
			<tr>
				<td colspan="2"><h1 style="">로그인 하시겠습니까?</h1></td>
			</tr>
			<tr>
				<td colspan="2"><img src="images/barcode.png" width="400" height="90"></td>
			</tr>
			<tr>
				<td colspan=2><h1>바코드 또는 회원번호를 입력해주세요</h1></td>
			</tr>
			
			<tr>
				<td colspan=2><input type="text"
									 id="usernum"
									 name="usernum"
									 style="width: 37rem; height: 5rem;font-size: 5rem;font-weight:bold"
									 value="0220524265141">
				</td>
			</tr>
			
			<tr>
				<td width="350px"><a id="yes" href="javascript:DoLogin();">네</a></td>
				<td><span><a id="no" href="drinkmenu.jsp">아니오</a></span></td>
			</tr>
		</table>
		</form>
	</td>
<!-- ==================================================================================================================== -->
<%@ include file="includes/tail.jsp" %>