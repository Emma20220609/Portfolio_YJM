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
	String no          = request.getParameter("no");
	String kind        = request.getParameter("kind");
	String cpage   	   = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	String provin      = request.getParameter("provin");
	String area        = request.getParameter("area");
	
	if(kind == null) kind = "L";
	if(cpage   == null)  cpage    = "1";
	if(search_key  == null)  search_key   = "";
	if(provin == null) provin = "";
	if(area == null) area = "";
	if(no == null || no.equals(""))
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
	
	String sql = "";
	sql = "select board_proc,user_no,board_type,board_title,board_name,board_phone,board_start,board_end, ";
	sql += "board_loca,board_date,board_hit,board_note,board_province,board_city, ";
	sql += "datediff(board_start,curdate()) as startdate, ";
	sql += "datediff(board_end,curdate()) as enddate ";
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
				document.location = "../board/loindex.jsp";
			}
		</script>
		<%@ include file="../db/dbclose.jsp" %>
		<%
		return;
	}
	String board_proc   	= result.getString("board_proc");
	String user_no      	= result.getString("user_no");
	String board_type   	= result.getString("board_type");
	String board_title  	= result.getString("board_title");
	String board_name   	= result.getString("board_name");
	String board_phone  	= result.getString("board_phone");
	String board_start  	= result.getString("board_start");
	String board_end    	= result.getString("board_end");
	String board_loca   	= result.getString("board_loca");
	String board_date   	= result.getString("board_date");
	String board_hit   		= result.getString("board_hit");
	String board_note      	= result.getString("board_note");
	String board_province   = result.getString("board_province");
	String board_city       = result.getString("board_city");
	int startdate 			= result.getInt("startdate");			//�����ϰ� ���糯¥ ����
	int enddate 			= result.getInt("enddate");				//�����ϰ� ���糯¥ ����
	
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
	<div class="submenu"><a href="../board/index.jsp">Ȱ���� �Խ���</a></div>
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/loindex.jsp">������ �Խ���</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">�ۺ���</span>
			</td>
		</tr>
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="color:#1D1FAB; font-size:15px;">[��û�� ���Ͻô� ���� �Ʒ��� ����ó�� �����Ͽ� �ֽñ� �ٶ��ϴ�]</span>
			</td>
		</tr>
	</table>
	<table border="1" style="width:80%; border-top: 1px solid #444444; border-collapse: collapse;">
		<tr>
			<td style="background-color:#f4f4f4; width:120px; height:40px;text-align:center;">���࿩��</td>
			 <%
			 	if(board_proc.equals("C")) //�ۼ������� ���� �����Ҷ�
			 	{
			 		%>
					<td colspan="4" style="text-align:center;background-color:#D55F64;font-weight:bold;">����</td>
					<%
				}else if(startdate <= 0 && enddate > 0)      //������ < ���� < ������
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:#63AFE5;font-weight:bold;">������</td>
					<%
				}else if(startdate > 0)			      //���� < ������
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:orange;font-weight:bold;">��������</td>
					<%
				}else             //������ < ����
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:#D55F64;font-weight:bold;">����</td>
					<%
				}
			 
			 %>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">����</td>
			<td colspan="4" ><%= board_title %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">�ۼ���</td>
			<td><%= board_name %></td>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">����ó</td>
			<td><%= board_phone %></td>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">�����Ⱓ</td>
			<td colspan="4" ><%= board_start %>~<%= board_end %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">����</td>
			<td colspan="4" ><%= board_province %> <%= board_city %> <%= board_loca %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">÷������</td>
			<td colspan="4" >
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
			<td colspan="4" ><%= board_date %></td>
		</tr>	
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">��ȸ��</td>
			<td colspan="4" ><%= board_hit %></td>
		</tr>	
		<tr>
			<td colspan="4" style="height:100px">	
				<%= board_note %>
			</td>
		</tr>																											
	</table>
	
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../comment/comment.jsp" %>

<tr>
	<td colspan="4" align="center" style="height:50px;">
		<a href="../board/loindex.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">�۸��</a>
		<%
			if(login_id != null)
			{
				if(login_autho.equals("A") || login_no.equals(user_no))
				{
					%>
					&nbsp;|&nbsp;
					<a href="../modify/lomodify.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">�ۼ���</a>
					&nbsp;|&nbsp;
					<a href="../delete/lodelete.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">�ۻ���</a>
					<%
				}
			}
		%>
	</td>
</tr>

<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>