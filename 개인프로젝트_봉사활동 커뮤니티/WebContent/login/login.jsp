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
			alert("���̵� �Է��ϼ���.");
			$("#userid").focus();
			return;
		}
		if($("#userpw").val() == "")
		{
			alert("��й�ȣ�� �Է��ϼ���.");
			$("#userpw").focus();
			return;
		}
		
		//id, pwȮ��
		$.ajax({
			type : "post",
			url : "../login/loginok.jsp",
			dataType: "html",
			data: 
			{
				//data�� loginok�� ����
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
					$("#loginmsg").html("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
				<span style="font-weight:bold; color:#10457D;font-size:19px;"><h4><u>�α���</u></h4></span>
			</td>
		</tr>																		
	</table>
	<form id="login" name="login" method="post" action="../login/loginok.jsp">
		<table style="width:60%;margin-left: auto; margin-right: auto;">
			<tr height="30">
				<td style="width:130px;">���̵� (*)</td>
				<td><input type="text" id="userid" name="userid" style="width:30%"></td>
			</tr>
			<tr height="30">
				<td>��й�ȣ (*)</td>
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
					<a href="javascript:Login();" id="loginbtn">�α���</a>
				</td>							
			</tr>																															
		</table>
	</form>
<!-- -------------------------------------------- -->
<%@ include file="../includes/tail.jsp" %>