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
		if($("#note").val() == "")
		{
			alert("������ �Է��ϼ���.");
			$("#note").focus();
			return false;
		}	
		if(confirm("���ο� �Խñ��� �����Ͻðڽ��ϱ�?") != 1)
		{
			return false;	
		}
	}
</script>
<%
	String kind   = request.getParameter("kind");
	if(kind == null) kind = "C";
%>
<!-- ------------------ ������ ����------------------------------------------------------------------------------------ -->
	<td style="width:200px" valign="top">
			<div style="height:80px;"></div>
			<div class="submenu"><a href="../board/com.jsp">�����ϱ�</a></div>
			<div style="height:5px;"></div>
			<div class="submenu" ><a href="../board/notice.jsp">��������</a></div>
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
	<form name="comwrite" id="comwrite" method="post" action="../write/comwriteok.jsp" onsubmit="return DoCheck();" enctype="multipart/form-data">
		<input type="hidden" id="board_type" name="board_type" value="C">
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><input type="text" id="title" name="title" style="width:95%"></td>
			</tr>						
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><textarea id="note" name="note" style="width:95%; height:200px;"></textarea></td>
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
					<a id="loginbtn"  href="../board/com.jsp">���</a>
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>					
	</form>	
	<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../includes/tail.jsp" %>