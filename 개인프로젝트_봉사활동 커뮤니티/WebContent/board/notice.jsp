<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<%@ include file="../db/dbopen.jsp" %>
<%
	//한글처리
	request.setCharacterEncoding("euc-kr");

	//--------------- 페이징 변수 선언-------------------------------------------
	int total      = 0;  //전체 게시물 갯수
	int maxpage    = 0;  //최대 페이지 갯수
	int curpage    = 1;  //현재 페이지 번호
	int startno    = 0;  //SQL limit 시작 번호
	int startBlock = 0;  //페이징 시작 블럭 번호
	int endBlock   = 0;  //페이징 끝 블럭 번호
	
	//--------------- 넘어온값 받기-------------------------------------------
	String no          = request.getParameter("no");	//view에서 넘어온 값   
	String kind        = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	
	if(kind == null)       kind       = "N";
	if(cpage == null)      cpage      = "1";
	if(search_key == null) search_key = "";
	
	//(3).
	if( request.getParameter("page") != null)
	{
		//넘어온 page 값을 정수형 curpage 로 변환한다. 
		curpage = Integer.parseInt(request.getParameter("page"));
	}else
	{
		//넘어온 page 값이 없으므로 현재 페이지 번호를 1로 설정한다. 
		curpage = 1;
	}
%>

<!-- -------------------콘텐츠 시작 ------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:100px;"></div>
	<div class="submenu"><a href="../board/com.jsp">공유해요</a></div>
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/notice.jsp">공지사항</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="height:40px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">공지사항</span>
			</td>
		</tr>						
		<tr>
			<td>
				<table border="0" style="width:85%;border-bottom: 1px solid grey">
					<tr>
						<td colspan=6 align="right">
							<form id="search" name="search" method="get" action="../board/notice.jsp">
								<input type="text" size="10" id="search_key" name="search_key" value="<%= search_key %>">
								<a href="javascript:document.search.submit();">검색</a>
							</form>
						</td>
					</tr>
					<tr height="10px"></tr>	
					<tr>
						<th style="background-color:#E8F2FE; width: 60px;" id="td">구분</th>
						<th style="background-color:#E8F2FE;" id="td">제목</th>
						<th style="background-color:#E8F2FE;width: 100px;" id="td">작성자</th>
						<th style="background-color:#E8F2FE;width: 100px;" id="td">작성일</th>	
						<th style="background-color:#E8F2FE;width: 80px;" id="td">조회수</th>							
					</tr>
					<%
						//where  구문을 작성한다.
						String where = "";
						where += "where board_type = '" + kind + "' ";
						if(!search_key.equals("")) 
						{
							//제목 + 내용에서 검색
							where += "and (board_title like '%" + search_key + "%' ";
							where += "or board_note like '%" + search_key + "%') ";
						}
							
						//(4)
						String sql = "";
						sql += "select count(*) as count ";
						sql += "from board ";
						sql += where; 
						
						ResultSet result = stmt.executeQuery(sql);
						result.next();
						total = result.getInt("count");
						result.close();
						
						//(5)
						maxpage = total / 10;
						if( total % 10 != 0) maxpage++;
					
						sql = "select board_no,board_type,board_title,board_name,date(board_date) as board_date,board_hit ";
						sql += "from board ";
						sql += where ;
						sql +="order by board_no desc ";
						//(2)
						startno = (curpage - 1) * 10;
						
						//(1)
						sql += "limit " + startno + ",10";
						result = stmt.executeQuery(sql);
						int seqno = total - startno;
						
						while(result.next() == true)
						{
							String board_no   		= result.getString("board_no");
							String board_type 	 	= result.getString("board_type");
							String board_title		= result.getString("board_title");
							String board_name 		= result.getString("board_name");
							String board_date 		= result.getString("board_date");
							String board_hit   		= result.getString("board_hit");
							
							//--------------- 검색어 색깔로 표시-------------------------------------------
							if (!search_key.equals(""))
							{
								board_title = board_title.replace(search_key,"<font color=orange>" + search_key + "</font>");
							}
							String notice = "공지";
							%>
							<tr id="tr">
								<td id="td">[<%= notice %>]</td>
								<td><a href="../view/noview.jsp?no=<%= board_no%>&page=<%= curpage%>&kind=<%= kind%>&search_key=<%= search_key%>" style="font-weight:bold;"><%= board_title %></a></td>
								<td id="td"><%= board_name %></td>
								<td id="td"><%= board_date %></td>
								<td id="td"><%= board_hit %></td>
							</tr>
							<%
						}
						if(total == 0)
						{
							%>
							<tr>
								<td colspan="7" style="background-color:#f4f4f4;height:100px;text-align:center;">
									조회된 자료가 없습니다.
								</td>						
							</tr>					
							<%
						}				
					%>
				</table>
			</td>
		</tr>
		<tr height="10px"></tr>	
		<tr>
			<td style="height:25px; text-align:left;">
			<%
				if(login_id != null)
				{
					if(login_autho.equals("A"))
					{
						%>
						<a href="../write/nowrite.jsp" id="write">글쓰기</a>
						<%				
					}
				}
			%>	
			</td>
		</tr>
		<tr height="30px"></tr>	
		<tr>
			<td style="text-align:center;">
			<%
				//(7)
				startBlock = ( (curpage - 1)  / 10) * 10 + 1; 
				endBlock   = startBlock + 10 - 1; 
				
				//(8)
				if( endBlock > maxpage)
				{
					endBlock = maxpage;
				}
				
				//(11)
				if(startBlock != 1)
				{
					%>
					<a href="notice.jsp?page=<%= startBlock - 1 %>&kind=<%= kind %>&search_key=<%= search_key %> ">◀</a> 
					<%
				}	
				
				//(9)
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						%>
							<a href="notice.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %> ">
								<span style="color:white;background-color:#0070C0;font-weight:bold;"><%= pageno %></span>
							</a> | 
						<%
					}else
					{
						%><a href="notice.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %> "><%= pageno %></a> | <%
					}
					
				}	
				
				//(10)
				if(endBlock < maxpage)
				{
					%>
					<a href="notice.jsp?page=<%= endBlock + 1 %>&kind=<%= kind %>&search_key=<%= search_key %> ">▶</a> 
					<%
				}	
			%>
			</td>
		</tr>
		<tr height="25px"></tr>		
	</table>
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>