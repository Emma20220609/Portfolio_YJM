<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="board_include/header.jsp" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%

SearchVO searchVO = new SearchVO();
searchVO.setSearchVO(request);

String no = request.getParameter("no");
if( no == null || no.equals(""))
{
	%>
	<script>
		window.onload = function()
		{
			alert("올바른 게시물 정보가 아닙니다.");
			document.location = "../main/index.jsp";
		}
	</script>
	<%
	return;
}

int bno = Integer.parseInt(no);

BoardDTO dto = new BoardDTO();
boardVO  vo  = dto.Read(bno, true);

%>
					<h2>
						<%
						if(vo.getBoard_kind().equals("01"))
						{
							%>공지사항<%
						}else if(vo.getBoard_kind().equals("02"))
						{
							%>이벤트 & 뉴스<%
						}else
						{
							%>설문<%
						}
					 	%>
					</h2>
				</td>
			</tr>
			<tr style="position:box;">
				<td colspan="4" style="box-shadow: 5px 5px 5px 5px gray;">
					<div style="display: flex; vertical-align:top;">
						<h3><%= vo.getBoard_title() %></h3>
					</div>
					<div style="position:static;">
						<div style="float:left; padding-top:10px; padding-left:10px; padding-right:10px; ">
							<p><%= vo.getBoard_note() %></p>
						</div>
					</div>
					<%
					if(vo.getAttachs()!=null)
					{
						for(attachVO attach : vo.getAttachs())
						{
							%>
							<div style="position:box;">
								<div style="padding-top:10px; padding-left:5px; padding-right:5px; vertical-align:top;">
									<img src="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>" width="500px">
								</div>
							</div>
							<%
						}
					}
					%>
				</td>
			</tr>
<%@ include file="board_include/footer.jsp" %>
