<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<%@ include file="../db/dbopen.jsp" %>

<script>
		window.onload = function()
		{
			$("#comt_note").focus();
		}
</script>
<%
	//--------------- ������ �ޱ�-------------------------------------------
	String no          = request.getParameter("no");
	String kind   	   = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	
	if(kind   == null)  kind = "C";
	if(cpage   == null)  cpage = "1";
	if(search_key  == null)  search_key = "";
	if(no == null || no.equals(""))
	{
		%>
		<script>
			window.onload = function()
			{
				alert("�ùٸ� �Խù� ������ �ƴմϴ�.");
				document.location = "../board/com.jsp";
			}
		</script>
		<%
		return;
	}
	String sql = "";
	sql = "select user_no,board_type,board_title,board_name,board_date,board_hit,board_note ";
	sql += "from board ";
	sql += "where board_no = '"+ no +"' ";
	
	//System.out.println(sql);
	ResultSet result = stmt.executeQuery(sql);
	if(result.next() == false)
	{
		%>
		<script>
			window.onload = function()
			{
				alert("�ùٸ� �Խù� ������ �ƴմϴ�.");
				document.location = "../board/com.jsp";
			}
		</script>
		<%@ include file="../db/dbclose.jsp" %>
		<%
		return;
	}
	String user_no      	= result.getString("user_no");
	String board_type   	= result.getString("board_type");
	String board_title  	= result.getString("board_title");
	String board_name   	= result.getString("board_name");
	String board_date   	= result.getString("board_date");
	String board_hit   		= result.getString("board_hit");
	String board_note      	= result.getString("board_note");

	//--------------- ��ȸ�� ����-------------------------------------------
	sql = "update board set board_hit = board_hit + 1 where board_no = " + no;
	stmt.executeUpdate(sql);

	//--------------- �Խù� ���� ����-------------------------------------------
	board_title = board_title.replace("<","&lt;");
	board_title = board_title.replace(">","&gt;");

	board_note = board_note.replace("<","&lt;");
	board_note = board_note.replace(">","&gt;");
	board_note = board_note.replace("\n","\n<br>");
%>
<!-- ------------------ ������ ����------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:80px;"></div>
	<div class="submenu"><a href="../board/com.jsp">�����ؿ�</a></div>
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/notice.jsp">��������</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">�ۺ���</span>
			</td>
		</tr>
	</table>
	<table border="1" style="width:80%; border-top: 1px solid #444444; border-collapse: collapse;">
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">����</td>
			<td><%= board_title %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">�ۼ���</td>
			<td><%= board_name %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">÷������</td>
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
			</td>
		</tr>	
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">�ۼ���</td>
			<td><%= board_date %></td>
		</tr>	
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">��ȸ��</td>
			<td><%= board_hit %></td>
		</tr>	
		<tr>
			<td colspan="2" style="height:100px">	
				<%= board_note %>
			</td>
		</tr>																											
	</table>
	
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../comment/comment.jsp" %>
<tr>
	<td colspan="4" align="center" style="height:50px;">
		<a href="../board/com.jsp?kind=<%= kind %>&no=<%= no %>&page=<%= cpage %>&search_key=<%= search_key %>">�۸��</a>
		<%
			if(login_id != null)
			{
				if(login_autho.equals("A") || login_no.equals(user_no))
				{
					%>
						&nbsp;|&nbsp;
						<a href="../modify/commodify.jsp?no=<%= no %>&kind=<%= kind %>&page=<%= cpage %>&search_key=<%= search_key %>">�ۼ���</a>
						&nbsp;|&nbsp;
						<a href="../delete/comdelete.jsp?no=<%= no %>&kind=<%= kind %>&page=<%= cpage %>&search_key=<%= search_key %>">�ۻ���</a>
					<%
				}
			}
		%>
	</td>
</tr>
<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>