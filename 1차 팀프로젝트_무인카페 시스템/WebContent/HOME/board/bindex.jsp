<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>

<%
request.setCharacterEncoding("UTF-8");


SearchVO searchVO = new SearchVO(request);//생성자에 REQUEST값 넘겨주면  search VO에서 받음
ListDTO  listDTO  = new ListDTO(searchVO);//검색조건을 listDTO에 넘겨줌
Paging   paging   = new Paging(searchVO);
%>
<%@ include file="../include/head3.jsp" %>
<!--Container-->
	<div id="container">

		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K04.png" alt="contact"></p>
			<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> Contact<span class="arr"></span>공지사항</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">공지사항</h2>

			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">공지사항</h3>

					<!-- 검색 테이블 -->
					<table align="center" border="0" style="width:100%">
						<tr>
							<td align="center">
								<form id="search" name="search" method="get" action="bindex.jsp">
									<select name="search_kind" onchange="document.search.submit();">
										<option value=""   <%= searchVO.getKind().equals("") ? "selected" : "" %>>전체</option>
										<option value="01" <%= searchVO.getKind().equals("01") ? "selected" : "" %>>공지사항</option>
										<option value="02" <%= searchVO.getKind().equals("02") ? "selected" : "" %>>이벤트</option>
										<option value="03" <%= searchVO.getKind().equals("03") ? "selected" : "" %>>설문조사</option>

									</select>
									<select name="search_type">
										<option value="T" <%= searchVO.getType().equals("T") ? "selected" : "" %>>제목</option>
										<option value="C" <%= searchVO.getType().equals("C") ? "selected" : "" %>>내용</option>
										<option value="A" <%= searchVO.getType().equals("A") ? "selected" : "" %>>제목 + 내용</option>
									</select>
									<input type="text" size="10" id="search_key" name="search_key" value="<%= searchVO.getKeyword() %>">
									<a href="javascript:document.search.submit();"><img src="../image/search.png" height="15px"></a>
								</form>
							</td>

						</tr>
					</table>
					<!-- test 테이블 -->
					<!-- 일반 게시판 리스트 -->
					<table class="board-list">
						<thead>
							<tr>
								<th class="col-num">No.</th>
								<th>제목</th>
								<th class="col-writer">작성자</th>
								<th class="col-date">날짜</th>
								<th class="col-re">조회</th>
							</tr>
						</thead>
						<tbody>
							<%
								//게시물의 갯수를 얻는다.
								int total = listDTO.GetTotal();
	
								listDTO.GetList(searchVO.getCurpage());//arraylist에 게시물 넣음
	
								int size = listDTO.GetListTotal();
								int seqno = total - (searchVO.getCurpage() - 1) * 10;
								for(int i=0; i < size; i++)
								{
									boardVO vo = listDTO.GetItem(i);
									%>
							<tr>
								<td><%= seqno-- %></td>
								<td class="list-tit"><a href="view.jsp?<%= searchVO.GetViewLink(vo.getBoard_no(),vo.getBoard_kind()) %>"><%= vo.getBoard_title() %></a></td>
								<td>관리자</td>
								<td><%=vo.getBoard_date() %></td>
								<td><%=vo.getBoard_hit() %></td>
							</tr>
								<%
									}
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
									%>
							
						</tbody>
					</table><!-- END 일반 게시판 리스트 -->
					<div class="board-pager">
						<div class="paginate">
							<%
							paging.setTotal(total, searchVO.getCurpage());

							if(paging.getStartBlock() != 1)//시작블럭이 1이 아니면
							{
								%>
								<a href="bindex.jsp?<%= searchVO.GetPageLink(paging.getStartBlock() - 1) %>">이전 블럭</a> |
								<%
							}

							for(int pageno = paging.getStartBlock(); pageno <= paging.getEndBlock(); pageno++)
							{
								if(searchVO.getCurpage() == pageno)
								{
									%><a href="bindex.jsp?<%= searchVO.GetPageLink(pageno) %>"><span style= "font-weight: bold; text-align:center;"><%= pageno %></span></a>  
									<%
								}else
								{
									%><a href="bindex.jsp?<%= searchVO.GetPageLink(pageno) %>"><%= pageno %></a> 
									<%
								}
							}

							if(paging.getEndBlock() != paging.getMaxpage())//전체 페이지가 아니면
							{
								%>
								<a href="bindex.jsp?<%= searchVO.GetPageLink(paging.getEndBlock() + 1) %>">다음 블럭</a>
								<%
							}
							%>
							
						</div>
					</div>
						<table align="center" border="0" style="width:70%;" >
							<tr>
								<td  Style="text-align:right">
								<%
								if(userid == null)
								{
									%><a href="javascript:alert('로그인 해야 글쓰기가 가능합니다.');" class="btnlogout">글쓰기</a><%
								}else
								{
									%><a  href="../board/write.jsp?<%= searchVO.GetPageLink(searchVO.getCurpage()) %>" class="btn-normal-s">글쓰기</a><%
								}
								%>

								</td>
							</tr>
							<tr>
								<td style="text-align:center">
							</tr>
						</table>
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>