<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//--------------- 로그인 정보 얻어오기-------------------------------------------
	String login_id    = (String) session.getAttribute("id");
	String login_no    = (String) session.getAttribute("user_no");
	String login_name  = (String) session.getAttribute("user_name");
	String login_autho = (String) session.getAttribute("user_autho");
%>
<!---------------------- header부분-------------------------- -->
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="EUC-KR">
		<title>VLOVE</title>
		 <link rel="stylesheet" href="../css/board.css"/> 
	</head>
	<body>
		<table border="0" width="70%" align="center">
			<tr>
				<td colspan="3" style="height:60px;">
					<table border="0" style="width:100%; height:60px;">
						<tr>
							<td style="text-align:right;" colspan=5>
								<%
								if(login_id == null)
								{
									%>
									<a href="../join/join.jsp" id="joinbtn">회원가입</a>
									&nbsp;&nbsp;
									<a href="../login/login.jsp" id="loginbtn">로그인</a>
									&nbsp;&nbsp;

									<%
								}else
								{
									%>
									( <%= login_name %> )님 환영합니다
									<%
									if( login_autho.equals("A") )
									{
										%>[ 관리자 ]<%
									}
									%>
									&nbsp; |
									<a href="../login/logout.jsp" id="logoutbtn">로그아웃</a>
									<%
								}
								%>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../main/index.jsp">
									<img src="../images/logo.png" width="250" height="250" alt="로고이미지">
								</a>
							</td>
			               	<td>
			               		<nav id="nav">
				               		<ul class="menu">
				               			<li><a href="../board/index.jsp">Destinations</a></li>
				               			<li><a href="../board/com.jsp">Community</a></li>
				               			<li><a href="../board/contact.jsp">Contact</a></li>
				               			<li><a href="../board/qna.jsp">QnA</a></li>
				               		</ul>
				               	</nav>
			               	</td>
						</tr>
					</table>
					<img src="../images/vol.jpg" width="100%" height="200" alt="메인이미지">	
				</td>
			</tr>
			<tr>
				<td>
					<!-- -------------------index 콘텐츠 시작------------------------------------------------------------------------------------ -->
					<table border="0" width="100%">
						<tr height="50px"></tr>
						<tr>
							<td ><a href="../board/notice.jsp"><span style="font-weight:bold; color:#1D1FAB; font-size:20px; padding: 10px 10px 10px 30px">공지사항</span></a></td>
						</tr>
						<tr height="30px"></tr>
						<tr>
							<td>
								<table style="width:85%; margin-left: auto; margin-right: auto;">
									<tr>
										<th style="background-color:#E8F2FE; width: 60px;" id="td">구분</th>
										<th style="background-color:#E8F2FE;" id="td">제목</th>
										<th style="background-color:#E8F2FE;width: 120px;" id="td">작성자</th>
										<th style="background-color:#E8F2FE;width: 120px;" id="td">작성일</th>						
									</tr>
									<%
									String sql = "";
									sql  = "select board_no,board_type,board_title,board_name,date(board_date) as board_date,board_hit ";
									sql += "from board ";
									sql += "where board_type = 'N' ";
									sql +="order by board_no desc ";
									sql += "limit 0,5";
									ResultSet result = stmt.executeQuery(sql);
									
									while(result.next() == true)
									{

										String board_no    = result.getString("board_no");
										String board_type  = result.getString("board_type");
										String board_title = result.getString("board_title");
										String board_name  = result.getString("board_name");
										String board_date  = result.getString("board_date");
									%>
										<tr>
											<td id="td">[공지]</td>
											<td><a href="../view/noview.jsp?no=<%= board_no%>"><%=board_title %></a></td>
											<td id="td"><%=board_name %></td>
											<td id="td"><%=board_date %></td>
										</tr>
									<%
									}
									%>
									
									
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height="50px"></tr>
			<tr>
				<td>
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;padding: 10px 10px 10px 30px">포토 갤러리</span>
				(주기적으로 관리자가 갤러리를 수동으로 업데이트 합니다.)
				</td>
			</tr>
			<tr height="20px"></tr>
			<tr>
				<td>
					<span id="up"><img src="../images/vol1.png" width="230" height="230"></span>
					<span id="up"><img src="../images/vol2.jpg" width="230" height="230"></span>
					<span id="up"><img src="../images/vol3.jpg" width="230" height="230"></span>
					<span id="up"><img src="../images/vol4.jpg" width="230" height="230"></span>
					<span id="up"><img src="../images/vol5.jpg" width="230" height="230"></span>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<!-- -------------------index 콘텐츠 종료------------------------------------------------------------------------------------ -->
			<tr>
				<td colspan="5">
					<div style="padding: 0px 10px 10px 10px; background-color:#f4f4f4" >
					<a href="../main/index.jsp">
					<img src="../images/logo.png" width="150" height="150" alt="로고이미지"><br>
					</a>
					관리자: 문양주<br>
					전화번호: 010.3332.4544<br>
					E-mail: abcde@gmail.com<br>
					Copyright 2022 All rights reserved.
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<%@ include file="../db/dbclose.jsp" %>