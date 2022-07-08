<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>

<script>
function DoCheck()
{
	if($("#title").val() == "")
	{
		alert("������ �Է��ϼ���.");
		$("#title").focus();
		return false;
	}
	if($("#provin").val() == "")
	{
		alert("�õ��� �����ϼ���.");
		$("#provin").focus();
		return false;
	}	
	if($("#area").val() == "")
	{
		alert("�ñ��� �����ϼ���.");
		$("#area").focus();
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
		alert("�������� �����Ϻ��� �����ϴ�");
		$("#p_end").focus();
		return false;
	}
	if(confirm("�Խñ��� �����Ͻðڽ��ϱ�?") != 1)
	{
		return false;	
	}
}
</script>

<%
	//--------------- �Ѿ�°� �ޱ�-------------------------------------------
	String no         = request.getParameter("no");
	String cpage   	  = request.getParameter("page");
	String kind 	  = request.getParameter("kind");
	String search_key = request.getParameter("search_key");
	String province   = request.getParameter("provin");
	String area       = request.getParameter("area");
	
	if(kind == null)       kind       = "L";
	if(cpage == null)      cpage      = "1";
	if(search_key == null) search_key = "";
	if(province == null)   province   = "";
	if(area == null)       area       = "";
	if(no == null)
	{
		%>
		<script>
			window.onload = function()
			{
				alert("�ùٸ� �Խù� ������ �ƴմϴ�.");
				document.location = "../board/loindex.jsp";
			}
		</script>
		<%
		return;
	}
%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//---------------------�Խù� �ڷḦ ��ȸ -----------------------------------
	String sql="";
	sql = "select board_no,user_no,board_title,board_loca,board_province,board_city,board_phone, ";
	sql += "board_type,board_note,board_start,board_end,board_proc ";
	sql += "from board ";
	sql += "where board_no = '"+ no +"' ";
	
	ResultSet result = stmt.executeQuery(sql);
	if( result.next() == false)
	{
		%>
		<script>
			window.onload = function()
			{
				alert("�ùٸ� �Խù� ������ �ƴմϴ�.");
				document.location = "../board/loindex.jsp";
				<%@ include file="../db/dbclose.jsp" %>
			}
		</script>
		<%
		return;
	}
	String board_no         = result.getString("board_no");
	String user_no     		= result.getString("user_no");
	String board_title 		= result.getString("board_title");
	String board_loca  		= result.getString("board_loca");
	String board_phone 		= result.getString("board_phone");
	String board_type  		= result.getString("board_type");
	String board_note  		= result.getString("board_note");
	String board_start 		= result.getString("board_start");
	String board_end   		= result.getString("board_end");
	String board_proc  		= result.getString("board_proc");
	String board_province   = result.getString("board_province");
	String board_city  		= result.getString("board_city");
	
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
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">�ۼ���</span>
		</td>
	</tr>
	</table>		
	<form name="lomodify" method="post" action="../modify/lomodifyok.jsp" onsubmit="return DoCheck();" enctype="multipart/form-data">
		<input type="hidden" name="no" value="<%= board_no %>"> 
		<input type="hidden" name="cpage" value="<%= cpage %>">
		<input type="hidden" name="kind" value="<%= kind %>">
		<input type="hidden" name="search_key" value="<%= search_key %>">
		<input type="hidden" name="province" value="<%= province %>">
		<input type="hidden" name="area" value="<%= area %>">	
		
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><input type="text" id="title" name="title" style="width:95%"  value="<%= board_title %>"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td>
					<select id="provin" name="provin" onchange="javascript:document.search.submit();">
						<option value="">::�õ�����::</option>
						<option value="����ϵ�" <%= board_province.equals("����ϵ�") ? "selected" : "" %>>����ϵ�</option>
						<option value="���󳲵�" <%= board_province.equals("���󳲵�") ? "selected" : "" %>>���󳲵�</option>
					</select>
					<select id="area"  name="area" onchange="javascript:document.search.submit();">
							<option value="">::�ñ�����::</option>
							<%
							if(board_province.equals("����ϵ�"))
							{
								%>
									<option value="���ֽ�" <%= board_city.equals("���ֽ�") ? "selected" : "" %>>���ֽ�</option>	
									<option value="�����" <%= board_city.equals("�����") ? "selected" : "" %>>�����</option>
									<option value="������" <%= board_city.equals("������") ? "selected" : "" %>>������</option>	
									<option value="������" <%= board_city.equals("������") ? "selected" : "" %>>������</option>	
									<option value="������" <%= board_city.equals("������") ? "selected" : "" %>>������</option>	
									<option value="�ͻ��" <%= board_city.equals("�ͻ��") ? "selected" : "" %>>�ͻ��</option>	
								<%
							}else if(board_province.equals("���󳲵�"))
							{
								%>
									<option value="������" <%= board_city.equals("������") ? "selected" : "" %>>������</option>	
									<option value="�����" <%= board_city.equals("�����") ? "selected" : "" %>>�����</option>
									<option value="������" <%= board_city.equals("������") ? "selected" : "" %>>������</option>	
									<option value="��õ��" <%= board_city.equals("��õ��") ? "selected" : "" %>>��õ��</option>	
									<option value="���ֽ�" <%= board_city.equals("���ֽ�") ? "selected" : "" %>>���ֽ�</option>	
								<%
							}		
							%>
						</select>
					<input type="text" id="region" name="region" style="width:95%" value=<%=board_loca %>>
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����ó</td>
				<td><input type="text" id="phone" name="phone" style="width:95%"  value=<%= board_phone %>></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td>
					<select name="dboard">
						<option value="A" <%= board_type.equals("A") ? "selected" : "" %>>Ȱ���� �Խ��� 
						<option value="L" <%= board_type.equals("L") ? "selected" : "" %>>������ �Խ���
					</select>
				</td>
			</tr>						
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">����</td>
				<td><textarea id="note" name="note" style="width:95%; height:200px;"><%= board_note %></textarea></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">�����Ⱓ</td>
				<td>
					<input type="date" id="p_start" name="p_start" min="2022-04-04" max="2025-12-31" value="<%= board_start%>">
					&nbsp;~&nbsp;
					<input type="date" id="p_end" name="p_end" min="2022-04-04" max="2025-12-31" value="<%= board_end%>">
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">���࿩��</td>
				<td>
					<input type="radio" name="pkind" value="O" <%= board_proc.equals("O") ? "checked" : "" %>>������
					<input type="radio" name="pkind" value="C" <%= board_proc.equals("C") ? "checked" : "" %>>����
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">÷������</td>
			<td>
					<%
						sql = "select attach_pname,attach_lname ";
						sql += "from attach ";
						sql += "where board_no ='"+ no +"' ";
						result =  stmt.executeQuery(sql);
						while(result.next() == true)
						{
							String attach_pname   = result.getString("attach_pname");
							String attach_lname   = result.getString("attach_lname");
							%>
							<a href="../view/download.jsp?file=<%= attach_pname%>&name=<%= attach_lname%>"><%= attach_lname%></a><br>
							<%
						}
					%>
					<input name="attach1" type="file" style="width:95%">
					<input name="attach2" type="file" style="width:95%">
					<input name="attach3" type="file" style="width:95%">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<div style="height:30px;"></div>
					<input id="b" type="submit" value="�Ϸ�">
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>					
	</form>	
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>