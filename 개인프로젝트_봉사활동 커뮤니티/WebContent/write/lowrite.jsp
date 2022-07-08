<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<script>
	window.onload = function()
	{
		$("#title").focus();
	}
	
	function DoCheck()
	{
		if($("#title").val() == "")
		{
			alert("������ �Է��ϼ���.");
			$("#title").focus();
			return false;
		}
		if($("#region").val() == "")
		{
			alert("������ �Է��ϼ���.");
			$("#region").focus();
			return false;
		}	
		if($("#phone").val() == "")
		{
			alert("����ó�� �Է��ϼ���.");
			$("#phone").focus();
			return false;
		}	
		if($("#note").val() == "")
		{
			alert("������ �Է��ϼ���.");
			$("#note").focus();
			return false;
		}	
		if($("#p_start").val() == "")
		{
			alert("�Ⱓ�� �Է��ϼ���.");
			$("#p_start").focus();
			return false;
		}	
		if($("#p_end").val() == "")
		{
			alert("�Ⱓ�� �Է��ϼ���.");
			$("#p_end").focus();
			return false;
		}	
		if($("#p_end").val() <= $("#p_start").val())
		{
			alert("�Ⱓ�� ��Ȯ���� �ʽ��ϴ�");
			$("#p_end").focus();
			return false;
		}
		if(confirm("���ο� �Խñ��� �����Ͻðڽ��ϱ�?") != 1)
		{
			return false;	
		}
	}
</script>

<%
	String kind = request.getParameter("kind");
	if(kind == null) kind = "L";
%>

<!-- ------------------ ������ ����------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
		<div style="height:80px;"></div>
		<div class="submenu"><a href="../board/index.jsp">Ȱ���� �Խ���</a></div>
		<div style="height:5px;"></div>
		<div class="submenu" ><a href="../board/loindex.jsp">������ �Խ���</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 30px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">�۾���</span>
			</td>
		</tr>
	</table>		
	<form name="lowrite" method="post" action="../write/lowriteok.jsp" onsubmit="return DoCheck();" enctype="multipart/form-data">
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><input type="text" id="title" name="title" style="width:95%"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td colspan=2 align="left">
					<script>
						function GetArea()
						{
							var provin = $("#provin").val();
							
							$.ajax({
								type : "GET",
								url: "../area/area.jsp?id=" + provin,
								dataType: "HTML",
								success : function(data) 
								{
									$("#area").html(data);
								},
							});				
						}
						
					</script>
					<select id="provin" name="provin" onchange="GetArea();">
						<option value="">::�õ�����::</option>
						<option value="����ϵ�">����ϵ�</option>
						<option value="���󳲵�">���󳲵�</option>
					</select>
					<select id="area"  name="area">
						<option value="">::�ñ�����::</option>
					</select>
					<input type="text" id="region" name="region" style="width:95%">
				</td>	
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����ó</td>
				<td><input type="text" id="phone" name="phone" style="width:95%"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td>
					<select name="dboard">
						<option value= "A" <%= kind.equals("A") ? "selected" : "" %>>Ȱ���� �Խ��� 
						<option value= "L" <%= kind.equals("L") ? "selected" : "" %>>������ �Խ���		
					</select>
				</td>
			</tr>						
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><textarea id="note" name="note" style="width:95%; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">�����Ⱓ</td>
				<td>
					<input type="date" id="p_start" name="p_start" min="2022-04-04" max="2025-12-31">
					&nbsp;~&nbsp;
					<input type="date" id="p_end" name="p_end" min="2022-04-04" max="2025-12-31">
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">÷������</td>
				<td><input id="attach" name="attach" type="file" style="width:95%"></td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<div style="height:20px;"></div>
					<input id="loginbtn" type="submit" value="�Ϸ�">
					<a id="loginbtn"  href="../board/loindex.jsp">���</a>
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>			
	</form>	
	<!-- ----------------------------------------------------------------------------------------- -->
	<%@ include file="../includes/tail.jsp" %>