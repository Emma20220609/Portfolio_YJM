<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_include/header.jsp" %>
		<table align=center width=500px>
			<tr style="height:100px;">
				<td colspan="4">
					<h2 class="title">
						안녕하세요.
						<br>
						메타벅스입니다.
					</h2>
				</td>
			</tr>
			<tr style="height:200px; ">
				<td colspan="4" style="box-shadow: 5px 5px 5px 5px gray;">
					<%
					if( user == null )
					{
						%>
						메타벅스 리워드<br>
						회원 신규 가입 첫 구매시,<br>
						무료음료 혜택을 드려요!<br>
						<br>
						<br><a class="btn" href="login.jsp">로그인</a><%
					}else
					{
						%>
						카드 등록 후 <br>
						다양한 혜택을 누려보세요!<br>
						<br>
						<br><a class="btn" href="../pay/index.jsp">카드등록</a><%
					}
					%>
				</td>
			</tr>
			<tr style="height:50px;">
				<td colspan="4">
					<a href="../board/noticelist.jsp">What's New</a>
				</td>
			</tr>
			<%
			int total = listDTO.GetTotal();
			BoardDTO boardDTO	= new BoardDTO();

			listDTO.GetList(searchVO.getCurpage());

			int size = listDTO.GetListTotal();
			int seqno = total - (searchVO.getCurpage() - 1) * 10;
			for(int i=0; i < 3; i++)
			{
				boardVO vo = listDTO.GetItem(i);
				boardVO voForImg  = boardDTO.Read(vo.getBoard_no(), false);
				%>
				<tr>
					<td align=center colspan="4" style="box-shadow: 5px 5px 5px 5px gray; ">
						<%
						if(voForImg.getAttachs().size() != 0 )
						{
							attachVO attach = voForImg.getAttachs().get(0);
							%>
							<div style="width:500px; height:300px; overflow: hidden;">
							<a href="../board/event.jsp?<%= searchVO.GetViewLink(vo.getBoard_no(), vo.getBoard_kind()) %>">
								<img src="../board/download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>" width="500px" height=auto>
							</a>
							</div>
							<%
						}
							%>
					</td>
				</tr>
				<%
			}
			%>
<%@ include file="main_include/footer.jsp" %>