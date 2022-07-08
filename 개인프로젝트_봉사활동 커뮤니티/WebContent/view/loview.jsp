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
				alert("올바른 게시물 정보가 아닙니다.");
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
				alert("올바른 게시물 정보가 아닙니다.");
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
	int startdate 			= result.getInt("startdate");			//시작일과 현재날짜 차이
	int enddate 			= result.getInt("enddate");				//종료일과 현재날짜 차이
	
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
	<div class="submenu"><a href="../board/index.jsp">활동별 게시판</a></div>
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/loindex.jsp">지역별 게시판</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">글보기</span>
			</td>
		</tr>
		<tr>
			<td style="padding:10px 10px 30px 15px">
				<span style="color:#1D1FAB; font-size:15px;">[신청을 원하시는 분은 아래의 연락처로 문의하여 주시기 바랍니다]</span>
			</td>
		</tr>
	</table>
	<table border="1" style="width:80%; border-top: 1px solid #444444; border-collapse: collapse;">
		<tr>
			<td style="background-color:#f4f4f4; width:120px; height:40px;text-align:center;">진행여부</td>
			 <%
			 	if(board_proc.equals("C")) //글수정에서 강제 마감할때
			 	{
			 		%>
					<td colspan="4" style="text-align:center;background-color:#D55F64;font-weight:bold;">마감</td>
					<%
				}else if(startdate <= 0 && enddate > 0)      //시작일 < 현재 < 종료일
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:#63AFE5;font-weight:bold;">모집중</td>
					<%
				}else if(startdate > 0)			      //현재 < 시작일
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:orange;font-weight:bold;">모집예정</td>
					<%
				}else             //종료일 < 현재
				{
					%>
					<td  colspan="4" style="text-align:center;background-color:#D55F64;font-weight:bold;">마감</td>
					<%
				}
			 
			 %>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">제목</td>
			<td colspan="4" ><%= board_title %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">작성자</td>
			<td><%= board_name %></td>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">연락처</td>
			<td><%= board_phone %></td>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">모집기간</td>
			<td colspan="4" ><%= board_start %>~<%= board_end %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">지역</td>
			<td colspan="4" ><%= board_province %> <%= board_city %> <%= board_loca %></td>
		</tr>
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">첨부파일</td>
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
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">작성일</td>
			<td colspan="4" ><%= board_date %></td>
		</tr>	
		<tr>
			<td style="background-color:#f4f4f4; width:120px;height:25px;text-align:center;">조회수</td>
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
		<a href="../board/loindex.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">글목록</a>
		<%
			if(login_id != null)
			{
				if(login_autho.equals("A") || login_no.equals(user_no))
				{
					%>
					&nbsp;|&nbsp;
					<a href="../modify/lomodify.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">글수정</a>
					&nbsp;|&nbsp;
					<a href="../delete/lodelete.jsp?no=<%= no%>&page=<%= cpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= provin %>&area=<%= area %>">글삭제</a>
					<%
				}
			}
		%>
	</td>
</tr>

<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>