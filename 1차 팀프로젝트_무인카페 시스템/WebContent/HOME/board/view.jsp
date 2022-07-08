<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>




<%@ include file="../include/head2.jsp" %>
<%

SearchVO searchVO = new SearchVO(request);//생성자에 REQUEST값 넘겨주면  search VO에서 받음
String no = request.getParameter("no");

if( no == null || no.equals(""))
{
	%>
	<script>
		window.onload = function()
		{
			alert("올바른 게시물 정보가 아닙니다.");
			document.location = "bindex.jsp";
		}
	</script>
	<%
	return;
}
BoardDTO dto = new BoardDTO();
int No = Integer.parseInt(no);
boardVO vo = dto.Read(No, true);
%>
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

					<!-- 공지사항 테이블 -->

					<table class="board-list" border="1" style="width:100%;">
						<tr>
							<td style="width:120px;">제목</td>
							<td><%= vo.getBoard_title() %></td>
						</tr>
						<tr>
							<td style="width:120px;">작성자</td>
							<td><%= vo.getno() %></td>
						</tr>
						<tr>
							<td style="width:120px;">작성일</td>
							<td><%= vo.getBoard_date() %></td>
						</tr>
						<tr>
							<td style="width:120px;">조회수</td>
							<td><%= vo.getBoard_hit() %>회</td>
						</tr>
						<tr>
							<td colspan="2">
								<%= vo.getBoard_note() %>
							</td>
						</tr>
						
						<%
						if(vo.getAttachs()!=null)
						{
							for(attachVO attach : vo.getAttachs())
							{
						%>
						<tr>	
							<td style="width:120px;">첨부파일</td>
							<td>
								<a href="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>"><%= attach.getAtt_lname() %></a><br>
								<img src="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>">
							</td>
						</tr>
						<%
							}
						}	
						%>
					</table>
						<div class="btnCommon type2">

							<!--<a href="#none" class="btnGray" onclick="history.go(-1); return false;">글목록</a>  -->
							<a href="bindex.jsp?<%= searchVO.GetPageLink(searchVO.getCurpage()) %>" class="btnGray">글목록</a>
							<a href="modify.jsp?no=<%= no %>&<%= searchVO.GetPageLink(searchVO.getCurpage()) %>" class="btnBlack">수정</a>
							<a href="delete.jsp?no=<%= no %>&<%= searchVO.GetPageLink(searchVO.getCurpage()) %>" class="btnBlack">삭제</a>
		   				</div>




						</table><!--END 공지사항 테이블 -->

					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>