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
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if($("#note").val() == "")
		{
			alert("내용을 입력하세요.");
			$("#note").focus();
			return false;
		}	
		if(confirm("게시글을 변경하시겠습니까?") != 1)
		{
			return false;	
		}
	}
</script>

<%
	//--------------- 넘어온값 받기-------------------------------------------
	String no         = request.getParameter("no");
	String kind       = request.getParameter("kind");
	String cpage      = request.getParameter("page");
	String search_key = request.getParameter("search_key");
	
	if(kind   == null)  kind = "Q";
	if(cpage   == null)  cpage = "1";
	if(search_key  == null)  search_key = "";
	if(no == null)
	{
		%>
		<script>
			window.onload = function()
			{
				alert("올바른 게시물 정보가 아닙니다.");
				document.location = "../board/qna.jsp";
			}
		</script>
		<%
		return;
	}
%>
<%@ include file="../db/dbopen.jsp" %>
<%
	String sql="";
	sql = "select board_no,user_no,board_title,board_type,board_note ";
	sql += "from board ";
	sql += "where board_no = '"+ no +"' ";
	
	ResultSet result = stmt.executeQuery(sql);
	if( result.next() == false)
	{
		%>
		<script>
			window.onload = function()
			{
				alert("올바른 게시물 정보가 아닙니다.");
				document.location = "../board/qna.jsp";
				<%@ include file="../db/dbclose.jsp" %>
			}
		</script>
		<%
		return;
	}
	String board_no    = result.getString("board_no");
	String user_no     = result.getString("user_no");
	String board_title = result.getString("board_title");
	String board_type  = result.getString("board_type");
	String board_note  = result.getString("board_note");
%>
<!-- ------------------ 콘텐츠 시작------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:100px;"></div>
	<div class="submenu"><a href="../board/qna.jsp">질문과 답변</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
	<tr>
		<td style="padding:10px 10px 30px 30px">
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">글수정</span>
		</td>
	</tr>
	</table>		
	<form name="qnamodify" method="post" action="../modify/qnamodifyok.jsp" onsubmit="return DoCheck();"  enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%= board_no %>">
	<input type="hidden" name="kind" value="<%= kind %>">
	<input type="hidden" name="page" value="<%= cpage %>">
	<input type="hidden" name="search_key" value="<%= search_key %>">
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">제목</td>
				<td><input type="text" name="title" style="width:95%"  value="<%= board_title %>"></td>
			</tr>					
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">내용</td>
				<td><textarea name="note" style="width:95%; height:200px;"><%= board_note %></textarea></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">첨부파일</td>
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
					<input id="b" type="submit" value="완료">
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>					
	</form>	
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>