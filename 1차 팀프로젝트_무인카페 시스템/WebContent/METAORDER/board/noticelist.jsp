<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("UTF-8");

SearchVO searchVO	= new SearchVO(request);
ListDTO  listDTO	= new ListDTO(searchVO);
Paging   paging		= new Paging(searchVO);
BoardDTO boardDTO	= new BoardDTO();


%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<link type="text/css" rel="stylesheet" href="../css/page.css">
	</head>
	<body>
		<table align=center width=500px>
			<tr>
				<td>
					<a href="../main/index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						What's New
					</h2>
				</td>
			</tr>
			<tr style="height:800px; position:relative;">
				<td colspan="4" style="box-shadow: 5px 5px 5px 5px gray;">
					<div style="position:absolute; top:0%; left:1%;">
					<form id="search" name="search" method="get" action="noticelist.jsp">
						<select style="width:490px;" name="search_kind" onchange="document.search.submit();">
							<option value=""	<%= (searchVO.getKind().equals("") ? "selected" : "") %>>전체</option>
							<option value="01"	<%= (searchVO.getKind().equals("01") ? "selected" : "") %>>공지사항</option>
							<option value="02"	<%= (searchVO.getKind().equals("02") ? "selected" : "") %>>이벤트&뉴스</option>
							<option value="03"	<%= (searchVO.getKind().equals("03") ? "selected" : "") %>>설문</option>
						</select>
					</form>

					<%
					//게시물의 갯수를 얻는다.
					int total = listDTO.GetTotal();

					listDTO.GetMoList(searchVO.getCurpage());

					int size = listDTO.GetListTotal();
					int seqno = total - (searchVO.getCurpage() - 1) * 10;
					for(int i=0; i < size; i++)
					{
						boardVO vo = listDTO.GetItem(i);
						boardVO voForImg  = boardDTO.Read(vo.getBoard_no(), false);
						%>
							<div style="padding-top:10px ; widht:125px; height:75px; overflow:hidden; ">
								<a href="event.jsp?<%= searchVO.GetViewLink(vo.getBoard_no(), vo.getBoard_kind()) %>">
						<%
						if(voForImg.getAttachs().size() != 0 )
						{
							attachVO attach = voForImg.getAttachs().get(0);
							%>
								<img style="border-radius:10px; width:125px; height:auto; " src="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>" width="100px" height="100px">
							<%
						}
						%>
								</a>
								<div style="padding-top:10px;display:inline-block;vertical-align:top;" ><a style="font-weight:bold;"href="event.jsp?<%= searchVO.GetViewLink(vo.getBoard_no(), vo.getBoard_kind()) %>"><%= vo.getBoard_title() %></a><p style="font-size:13px"><%= vo.getBoard_date() %></p></div>
							</div>
						<%
					}
					
//						dto.Read(vo.getBoard_no(), true);
					if(total == 0)
					{
						%>
						<tr>
							<td colspan="5" style="background-color:#f4f4f4;height:80px;text-align:center;">
								조회된 자료가 없습니다.
							</td>
						</tr>
						<%
					}
					%></div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; padding-top:10px; ">
				<%
				paging.setTotal(total, searchVO.getCurpage());
						
				if(paging.getStartBlock() != 1)
				{
					%>	
					<a href="noticelist.jsp?<%= searchVO.GetPageLink(paging.getStartBlock() - 1) %>">이전 블럭</a> |	
					<%
				}
				
				for(int pageno = paging.getStartBlock(); pageno <= paging.getEndBlock(); pageno++)
				{
					if(searchVO.getCurpage() == pageno)
					{
						%><div class="page_nation"><a class="active" href="noticelist.jsp?<%= searchVO.GetPageLink(pageno) %>"><%= pageno %></a></div><%
					}else
					{
						%><div class="page_nation"><a href="noticelist.jsp?<%= searchVO.GetPageLink(pageno) %>"><%= pageno %></a></div><%
					}
				}	
				
				if(paging.getEndBlock() != paging.getMaxpage())
				{
					%>	
					<a href="noticelist.jsp?<%= searchVO.GetPageLink(paging.getEndBlock() + 1) %>">다음 블럭</a> |	
					<%
				}
				%>
				</td>
			</tr>
<%@ include file="board_include/footer.jsp" %>