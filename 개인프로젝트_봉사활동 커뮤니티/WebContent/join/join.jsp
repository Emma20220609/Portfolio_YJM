<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<!-- -------------------������ ���� ------------------------------------------------------------------------------------ -->
<script>
	var idDuplicated = false;  //id�� �ߺ��� �ƴϸ�
	
	window.onload = function()
	{
		$("#id").focus();
		
		$("#id").keyup(function(){
			idDuplicated = false;
			
			var id = $("#id").val();
			if(id == "")
			{
				$("#spanMsg").html("���̵� �Է��ϼ���.");
				return;
			}
	
			$.ajax({
				type : "get",
				url: "idcheck.jsp?id=" + id,
				dataType: "html",
				success : function(data) 
				{
					data = data.trim();
					if(data == "001")
					{
						$("#msg").html("���̵� ��ȸ �����Դϴ�.");
					}
					if(data == "002")
					{
						$("#msg").html("�ߺ��� �ƾƵ��Դϴ�.");
						$("#msg").css("color","red");
						IsDuplicated = true;
					}else
					{
						$("#msg").html("��� ������ ���̵��Դϴ�.");
						$("#msg").css("color","blue");
					}					
				}
			});				
		});
	}
	
	function Submit()
	{
		if($("#id").val() == "")
		{
			alert("���̵� �Է��ϼ���.");
			$("#id").focus();
			return;
		}
		if($("#pw").val() == "")
		{
			alert("��й�ȣ�� �Է��ϼ���.");
			$("#pw").focus();
			return;
		}
		if($("#pw").val() != $("#pwcheck").val())
		{
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			$("#pw").focus();
			return;
		}	
		if($("#name").val() == "")
		{
			alert("�̸��� �Է��ϼ���.");
			$("#name").focus();
			return;
		}
		$.ajax({
			type : "get",
			url : "capchaok.jsp",
			dataType : "html",
			success : function(capcha) //�Ѿ�� capcha�ڵ�
			{
				capcha = capcha.trim();
				if($("#capcha").val() == capcha)
				{
					if(confirm("ȸ�������� �Ͻðڽ��ϱ�?") != 1)
					{
						return;
					}
					$("#join").submit();
				}else
				{
					alert("�ڵ� ȸ������ ���� �ڵ尡 ��ġ���� �ʽ��ϴ�.")
				}
			}
		});
		
	}
</script>
<td style="width:200px" valign="top"></td>
<td style="width:5px"></td>
<td>
	<form id="join" name="join" method="post" action="../join/joinok.jsp">
		<table border="0" style="width:100%">
			<tr>
				<td style="padding:10px 10px 20px 390px">
					<span style="font-weight:bold; color:#10457D;font-size:19px"><h4><u>ȸ������</u></h4></span>
				</td>
			</tr>																		
		</table>
		<table style="width:60%;margin-left: auto; margin-right: auto;">
			<tr height="30">
				<td style="width:130px;">���̵� (*)</td>
				<td>
					<input type="text" id="id" name="id" style="width:50%">&nbsp&nbsp
					<span id="msg">���̵� �Է��ϼ���.</span>
				</td>
			</tr>
			<tr height="30">
				<td>��й�ȣ (*)</td>
				<td><input type="password" id="pw" name="pw" style="width:50%"></td>
			</tr>
			<tr height="30">
				<td>��й�ȣ Ȯ�� (*)</td>
				<td><input type="password" id="pwcheck" name="pwcheck" style="width:50%"></td>
			</tr>			
			<tr height="30">
				<td>�̸� (*)</td>
				<td><input type="text" id="name" name="name"  style="width:50%"></td>
			</tr>		
			<tr height="30">
				<td>���� (*)</td>
				<td>
					<input type="radio" name="gender" value="M" checked>����
					<input type="radio" name="gender" value="F">����
				</td>
			</tr>		
			<tr height="50">
				<td>���ɺо�</td>
				<td>
					<input type="checkbox" value="1:������ȣ" name="interest"  checked>������ȣ
					<input type="checkbox" value="2:�ڿ���ȣ" name="interest">�ڿ���ȣ	
					<input type="checkbox" value="3:�αǺ�ȣ" name="interest">�αǺ�ȣ	
					<input type="checkbox" value="4:�ؿܺ���" name="interest">�ؿܺ���	
					<input type="checkbox" value="5:��ȸ����" name="interest">��ȸ����		
					<input type="checkbox" value="6:���ر�ȣ" name="interest">���ر�ȣ					
				</td>
			</tr>
			<tr height="30px"></tr>	
			<tr>
				<td width="150px">�ڵ�ȸ�����Թ���: </td>
				<td>
					<table border="0">
						<tr>
							<td>
								<img src="capcha.jsp">
							</td>
							<td>
								<input type="text" id="capcha" name="capcha" size="12">
							</td>
						<tr>
					</table>							
				</td>
			</tr>			
			<tr height="30px"></tr>	
			<tr>
				<td colspan="3" style="height:1px;background-color:#2B579A"></td>
			</tr>	
			<tr height="50">
				<td colspan="2" style="text-align:center;">
					<a id="joinbtn" href="javascript:Submit();" >���ԿϷ�</a>
					<a id="joinbtn" href="../main/index.jsp">���</a>
				</td>							
			</tr>																															
		</table>
	</form>
<!-- ----------------------------------------------------------------------------------------------------------- -->
<%@ include file="../includes/tail.jsp" %>