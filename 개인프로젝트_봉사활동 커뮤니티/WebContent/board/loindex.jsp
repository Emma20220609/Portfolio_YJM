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
	int curpage    = 0;  //현재 페이지 번호
	int startno    = 0;  //SQL limit 게시물 시작 번호
	int startBlock = 0;  //페이징 시작 블럭 번호
	int endBlock   = 0;  //페이징 끝 블럭 번호
	
	//--------------- 넘어온값 받기-------------------------------------------
	String no          = request.getParameter("no");
	String kind        = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	String menu_provin = request.getParameter("provin");
	String menu_area   = request.getParameter("area");
	String pkind       = request.getParameter("pkind");
	
	if(kind == null)        kind        = "L";
	if(cpage == null)       cpage       = "1";
	if(search_key == null)  search_key  = "";
	if(menu_provin == null) menu_provin = "";
	if(menu_area == null)   menu_area   = "";
	if(pkind == null)       pkind       = "C";
	
	//(3) 
	if( request.getParameter("page") != null)
	{
		curpage = Integer.parseInt(request.getParameter("page"));
	}else
	{
		curpage = 1;
	}
	
%>

<!-- -------------------콘텐츠 시작------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:100px;"></div>
	<div class="submenu"><a href="../board/index.jsp?menu_kind='A'">활동별 게시판</a></div>		
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/loindex.jsp?menu_kind='L'">지역별 게시판</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="height:40px">
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">지역별 게시판</span>
			</td>
		</tr>					
		<tr>
			<td>
				<form id="search" name="search" method="get" action="../board/loindex.jsp">
					<table border="0" style="width:88%; border-bottom: 1px solid grey">
						<tr>
							<td colspan=2 align="left">
								<select id="provin" name="provin" onchange="javascript:document.search.submit();">
									<option value="">::시도선택::</option>
									<option value="전라북도" <%= menu_provin.equals("전라북도") ? "selected" : "" %>>전라북도</option>
									<option value="전라남도" <%= menu_provin.equals("전라남도") ? "selected" : "" %>>전라남도</option>
								</select>
								<select id="area"  name="area" onchange="javascript:document.search.submit();">
									<option value="">::시군선택::</option>
									<%
									if(menu_provin.equals("전라북도"))
									{
										%>
											<option value="전주시" <%= menu_area.equals("전주시") ? "selected" : "" %>>전주시</option>	
											<option value="군산시" <%= menu_area.equals("군산시") ? "selected" : "" %>>군산시</option>
											<option value="남원시" <%= menu_area.equals("남원시") ? "selected" : "" %>>남원시</option>	
											<option value="김제시" <%= menu_area.equals("김제시") ? "selected" : "" %>>김제시</option>	
											<option value="정읍시" <%= menu_area.equals("정읍시") ? "selected" : "" %>>정읍시</option>	
											<option value="익산시" <%= menu_area.equals("익산시") ? "selected" : "" %>>익산시</option>	
										<%
									}else if(menu_provin.equals("전라남도"))
									{
										%>
											<option value="목포시" <%= menu_area.equals("목포시") ? "selected" : "" %>>목포시</option>	
											<option value="광양시" <%= menu_area.equals("광양시") ? "selected" : "" %>>광양시</option>
											<option value="여수시" <%= menu_area.equals("여수시") ? "selected" : "" %>>여수시</option>	
											<option value="순천시" <%= menu_area.equals("순천시") ? "selected" : "" %>>순천시</option>	
											<option value="나주시" <%= menu_area.equals("나주시") ? "selected" : "" %>>나주시</option>	
										<%
									}		
									%>
								</select>
							</td>
							<td colspan=5 align="right">
								<input type="text" size="10" id="search_key" name="search_key" value="<%= search_key %>">
								<a href="javascript:document.search.submit();">검색</a>
							</td>
						</tr>
						<tr height="10px"></tr>	
						<tr>
							<th style="background-color:#E8F2FE; width:60px; height:40px;">번호</th>
							<th style="text-align:center; background-color:#E8F2FE; height:40px;">활동명</th>
							<th style="background-color:#E8F2FE;width:120px; height:40px;">지역</th>
							<th style="background-color:#E8F2FE;width:80px; height:40px;">작성자</th>
							<th style="background-color:#E8F2FE;width:100px; height:40px;">작성일</th>
							<th style="background-color:#E8F2FE;width:70px; height:40px;">진행상태</th>						
							<th style="background-color:#E8F2FE;width:70px; height:40px;">조회수</th>	
						</tr>
						<%
							//where  구문을 작성한다.
							String where = "";
							where += "where board_type = '" + kind + "' ";
							if(!search_key.equals("")) 
							{
								where += "and (board_title like '%" + search_key + "%' ";
								where += "or board_note like '%" + search_key + "%' ";
								where += "or board_province like '%" + search_key + "%' ";
								where += "or board_city like '%" + search_key + "%' ";
								where += "or board_loca like '%" + search_key + "%') ";
							}
							if(!menu_provin.equals("")) 
							{
								//시도에서 검색
								where += "and board_province = '"+menu_provin+"' ";					
							}
							if(!menu_area.equals("")) 
							{
								//시군에서 검색
								where += "and board_city = '"+menu_area+"' ";					
							}
							
							//(4) 
							String sql = "";
							sql  = "select count(*) as count ";
							sql += "from board ";
							sql += where; 
							
							ResultSet result = stmt.executeQuery(sql);	
							result.next();
							total  = result.getInt("count");
							result.close();
							
							//(5)
							maxpage = total / 10;
							if( total % 10 != 0) maxpage++;
			
							sql  = "select board_no,board_type,board_title,board_loca,board_name,date(board_date) as board_date, ";
							sql += "board_proc,board_hit,board_province,board_city,board_start,board_end, ";
							sql += "datediff(board_start,curdate()) as startdate, ";
							sql += "datediff(board_end,curdate()) as enddate, ";
							sql += "(select count(comt_no) from comment where board_no = board.board_no) as comt_no "; 
							sql += "from board ";
							sql += where ;
							sql +="order by board_no desc ";
							
							//(2) 
							startno = (curpage - 1) * 10;
							//(1) 
							sql += "limit " + startno + ",10";	
							result = stmt.executeQuery(sql);	
							
							int seqno =  total - startno;
							
							while(result.next() == true)
							{
								String board_no   		= result.getString("board_no");
								String board_type 	 	= result.getString("board_type");
								String board_title		= result.getString("board_title");
								String board_loca  	 	= result.getString("board_loca");
								String board_name 		= result.getString("board_name");
								String board_date 		= result.getString("board_date");
								String board_proc 		= result.getString("board_proc");
								String board_hit   		= result.getString("board_hit");
								String board_province   = result.getString("board_province");
								String board_city       = result.getString("board_city");
								String board_start   	= result.getString("board_start");
								String board_end      	= result.getString("board_end");
								String comt_no      	= result.getString("comt_no");
								int startdate           = result.getInt("startdate");
								int enddate 			= result.getInt("enddate");
								
								//--------------- 검색어 색깔로 표시-------------------------------------------
								if (!search_key.equals(""))
								{
									board_title = board_title.replace(search_key,"<font color=orange>" + search_key + "</font>");
								}
								%>
								<tr id="tr">
									<td id="td"><%= seqno-- %></td>
									<td>
										<a href="../view/loview.jsp?no=<%= board_no%>&page=<%= curpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %>&pkind=<%= pkind %>" style="font-weight:bold;"><%= board_title %></a>
										<%
											if(!comt_no.equals("0"))
											{
												%> 
												<span style="color:#ff6600">(<%= comt_no %>)</span>
												<%
											}
										%>
									</td>
									<td id="td"><%= board_province %> <%= board_city %></td>
									<td id="td"><%= board_name %></td>
									<td id="td"><%= board_date %>
									<%
									
										if(board_proc.equals("C")) //글수정에서 강제 마감할때
									 	{
									 		%>
											<td style="text-align:center;background-color:#D55F64;font-weight:bold;">마감</td>
											<%
										}else if(startdate <= 0 && enddate > 0)
										{
											%>
											<td  style="text-align:center;background-color:#63AFE5;font-weight:bold;">모집중</td>
											<%
										}else if(startdate > 0)
										{
											%>
											<td  style="text-align:center;background-color:orange;font-weight:bold;">모집예정</td>
											<%
										}else 
										{
											%>
											<td  style="text-align:center;background-color:#D55F64;font-weight:bold;">마감</td>
											<%
										}
									%>
								<td id="td"><%= board_hit %></td>
							</tr>
							<%
						}
						//--------------- 조회된 자료가 없을때-------------------------------------------
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
				</form>	
			</td>
		</tr>
		<tr height="10px"></tr>	
		<tr>
			<td style="height:25px; text-align:left;">
			<%
				if(login_id == null)
				{
					%><a href="javascript:alert('로그인 해야 글쓰기가 가능합니다.');" id="write">글쓰기</a><%
				}else
				{
					%><a href="../write/lowrite.jsp?kind=<%=kind%>" id="write">글쓰기</a><%
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
					<a href="loindex.jsp?page=<%= startBlock - 1 %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %>">◀</a> 
					<%
				}	
				//(9)
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						%>
							<a href="loindex.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> ">
								<span style="color:white;background-color:#0070C0;font-weight:bold;"><%= pageno %></span>
							</a> | 
						<%
					}else
					{
						%><a href="loindex.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> "><%= pageno %></a> | <%
					}
					
				}	
				//(10)
				if(endBlock < maxpage)
				{
					%>
					<a href="loindex.jsp?page=<%= endBlock + 1 %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> ">▶</a> 
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