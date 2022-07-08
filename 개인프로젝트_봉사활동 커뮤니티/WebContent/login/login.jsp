<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<!-- -------------------------------------------- -->
<script>
	window.onload=function()
	{
		$("#userid").focus();
	}
	
	function Login()
	{		
		if($("#userid").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if($("#userpw").val() == "")
		{
			alert("비밀번호를 입력하세요.");
			$("#userpw").focus();
			return;
		}
		
		//id, pw확인
		$.ajax({
			type : "post",
			url : "../login/loginok.jsp",
			dataType: "html",
			data: 
			{
				//data를 loginok로 보냄
				 id: $("#userid").val(),
			     pw: $("#userpw").val()
			},
			success : function(data) 
			{
				data = data.trim();
				if(data == "yes")
				{
					document.location = "../main/index.jsp";
				}else
				{
					$("#loginmsg").html("아이디 또는 비밀번호가 일치하지 않습니다.");
					$("#loginmsg").css("color","red");
				}
			}
		});
	}
</script>
<td style="width:200px" valign="top"></td>
<td style="width:5px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 20px 360px">
				<span style="font-weight:bold; color:#10457D;font-size:19px;"><h4><u>로그인</u></h4></span>
			</td>
		</tr>																		
	</table>
	<form id="login" name="login" method="post" action="../login/loginok.jsp">
		<table style="width:60%;margin-left: auto; margin-right: auto;">
			<tr height="30">
				<td style="width:130px;">아이디 (*)</td>
				<td><input type="text" id="userid" name="userid" style="width:30%"></td>
			</tr>
			<tr height="30">
				<td>비밀번호 (*)</td>
				<td><input type="password" id="userpw" name="userpw"  style="width:30%"></td>
			</tr>
			<tr height="30">
				<td colspan="3"><span id="loginmsg"></span></td>
			</tr>
			<tr height="30px"></tr>
			<tr>
				<td colspan="3" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<tr height="60">
				<td colspan="2" style="text-align:center;">
					<a href="javascript:Login();" id="loginbtn">로그인</a>
				</td>							
			</tr>																															
		</table>
	</form>
<!-- -------------------------------------------- -->
<%@ include file="../includes/tail.jsp" %>