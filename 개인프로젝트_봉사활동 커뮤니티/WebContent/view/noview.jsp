<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<%@ include file="../db/dbopen.jsp" %>
<%
	String no          = request.getParameter("no");
	String kind   	   = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	
	if(kind   == null)  kind = "N";
	if(cpage   == null)  cpage = "1";
	if(search_key  == null)  search_key = "";
	if(no == null || no.equals(""))
	{
		%>
		<script>
			window.onload = function()
			{
				alert("올바른 게시물 정보가 아닙니다.");
				document.location = "../board/notice.jsp";
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
				alert("올바른 게시물 정보가 아닙니다.");
				document.location = "../board/notice.jsp";
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

	//--------------- 조회수 증가-------------------------------------------
	sql = "update board set board_hit = board_hit + 1 where board_no = " + no;
	stmt.executeUpdate(sql);

	//--------------- 게시물 내용 정리-------------------------------------------
	board_title = board_title.replace("<","&lt;");
	board_title = board_title.replace(">","&gt;");

	board_note = board_note.replace("<","&lt;");
	board_note = board_note.replace(">","&gt;");
	board_note = board_note.replace("\n","\n<br>");
%>
<!-- ------------------ 콘텐츠 시작------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:80px;"></div>
	<div class="submenu"><a href="../board/com.jsp">공유해요</a></div>
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/notice.jsp">공지사항</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">공지사항</span>
			</td>
		</tr>
	</table>
	<table border="1" style="width:80%; border-top: 1px solid #444444; border-collapse: collapse;">
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">제목</td>
			<td><%= board_title %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">작성자</td>
			<td><%= board_name %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">작성일</td>
			<td><%= board_date %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">조회수</td>
			<td><%= board_hit %></td>
		</tr>	
		<tr>
			<td colspan="2" style="height:100px">	
				<%= board_note %>
			</td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">첨부파일</td>
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
	</table>
	<table style="width:80%;">
		<tr height="30px"></tr>
		<tr>
			<td colspan="3" style="height:1px;background-color:#2B579A"></td>
		</tr>
		<tr>
			<td colspan=3 align="center" style="height:50px;">
				<a href="../board/notice.jsp?kind=<%= kind %>&no=<%= no %>&page=<%= cpage %>&search_key=<%= search_key %>">글목록</a>
			<%
			if(login_id != null)
			{
				if(login_autho.equals("A"))
				{
					%>
					&nbsp;|&nbsp;
					<a href="../modify/nomodify.jsp?kind=<%= kind %>&no=<%= no %>&page=<%= cpage %>&search_key=<%= search_key %>">글수정</a>
					&nbsp;|&nbsp;
					<a href="../delete/nodelete.jsp?kind=<%= kind %>&no=<%= no %>&page=<%= cpage %>&search_key=<%= search_key %>">글삭제</a>
					<%
				}
			}
			%>
			</td>
		</tr>																												
	</table>
<!-- ----------------------------------------------------------------------------------------- -->
<!-- 공지사항은 comment 필요 없음 -->
<%@ include file="../includes/tail.jsp" %>