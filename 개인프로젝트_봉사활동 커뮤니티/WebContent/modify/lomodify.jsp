<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>

<script>
function DoCheck()
{
	if($("#title").val() == "")
	{
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	if($("#provin").val() == "")
	{
		alert("시도를 선택하세요.");
		$("#provin").focus();
		return false;
	}	
	if($("#area").val() == "")
	{
		alert("시군를 선택하세요.");
		$("#area").focus();
		return false;
	}	
	if($("#region").val() == "")
	{
		alert("지역을 입력하세요.");
		$("#region").focus();
		return false;
	}	
	if($("#phone").val() == "")
	{
		alert("연락처을 입력하세요.");
		$("#phone").focus();
		return false;
	}	
	if($("#note").val() == "")
	{
		alert("내용을 입력하세요.");
		$("#note").focus();
		return false;
	}	
	if($("#p_start").val() == "")
	{
		alert("기간을 입력하세요.");
		$("#p_start").focus();
		return false;
	}	
	if($("#p_end").val() == "")
	{
		alert("기간을 입력하세요.");
		$("#p_end").focus();
		return false;
	}	
	if($("#p_end").val() <= $("#p_start").val())
	{
		alert("종료일이 시작일보다 빠릅니다");
		$("#p_end").focus();
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
				alert("올바른 게시물 정보가 아닙니다.");
				document.location = "../board/loindex.jsp";
			}
		</script>
		<%
		return;
	}
%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//---------------------게시물 자료를 조회 -----------------------------------
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
				alert("올바른 게시물 정보가 아닙니다.");
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
		<td style="padding:10px 10px 30px 30px">
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">글수정</span>
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
				<td style="width:120px; text-align:center; background-color:#F2F4F5">제목</td>
				<td><input type="text" id="title" name="title" style="width:95%"  value="<%= board_title %>"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">지역</td>
				<td>
					<select id="provin" name="provin" onchange="javascript:document.search.submit();">
						<option value="">::시도선택::</option>
						<option value="전라북도" <%= board_province.equals("전라북도") ? "selected" : "" %>>전라북도</option>
						<option value="전라남도" <%= board_province.equals("전라남도") ? "selected" : "" %>>전라남도</option>
					</select>
					<select id="area"  name="area" onchange="javascript:document.search.submit();">
							<option value="">::시군선택::</option>
							<%
							if(board_province.equals("전라북도"))
							{
								%>
									<option value="전주시" <%= board_city.equals("전주시") ? "selected" : "" %>>전주시</option>	
									<option value="군산시" <%= board_city.equals("군산시") ? "selected" : "" %>>군산시</option>
									<option value="남원시" <%= board_city.equals("남원시") ? "selected" : "" %>>남원시</option>	
									<option value="김제시" <%= board_city.equals("김제시") ? "selected" : "" %>>김제시</option>	
									<option value="정읍시" <%= board_city.equals("정읍시") ? "selected" : "" %>>정읍시</option>	
									<option value="익산시" <%= board_city.equals("익산시") ? "selected" : "" %>>익산시</option>	
								<%
							}else if(board_province.equals("전라남도"))
							{
								%>
									<option value="목포시" <%= board_city.equals("목포시") ? "selected" : "" %>>목포시</option>	
									<option value="광양시" <%= board_city.equals("광양시") ? "selected" : "" %>>광양시</option>
									<option value="여수시" <%= board_city.equals("여수시") ? "selected" : "" %>>여수시</option>	
									<option value="순천시" <%= board_city.equals("순천시") ? "selected" : "" %>>순천시</option>	
									<option value="나주시" <%= board_city.equals("나주시") ? "selected" : "" %>>나주시</option>	
								<%
							}		
							%>
						</select>
					<input type="text" id="region" name="region" style="width:95%" value=<%=board_loca %>>
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">연락처</td>
				<td><input type="text" id="phone" name="phone" style="width:95%"  value=<%= board_phone %>></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">구분</td>
				<td>
					<select name="dboard">
						<option value="A" <%= board_type.equals("A") ? "selected" : "" %>>활동별 게시판 
						<option value="L" <%= board_type.equals("L") ? "selected" : "" %>>지역별 게시판
					</select>
				</td>
			</tr>						
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">내용</td>
				<td><textarea id="note" name="note" style="width:95%; height:200px;"><%= board_note %></textarea></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">모집기간</td>
				<td>
					<input type="date" id="p_start" name="p_start" min="2022-04-04" max="2025-12-31" value="<%= board_start%>">
					&nbsp;~&nbsp;
					<input type="date" id="p_end" name="p_end" min="2022-04-04" max="2025-12-31" value="<%= board_end%>">
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">진행여부</td>
				<td>
					<input type="radio" name="pkind" value="O" <%= board_proc.equals("O") ? "checked" : "" %>>모집중
					<input type="radio" name="pkind" value="C" <%= board_proc.equals("C") ? "checked" : "" %>>마감
				</td>
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