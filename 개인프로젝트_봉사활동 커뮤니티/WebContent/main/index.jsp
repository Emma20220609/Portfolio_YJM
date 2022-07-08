<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//--------------- �α��� ���� ������-------------------------------------------
	String login_id    = (String) session.getAttribute("id");
	String login_no    = (String) session.getAttribute("user_no");
	String login_name  = (String) session.getAttribute("user_name");
	String login_autho = (String) session.getAttribute("user_autho");
%>
<!---------------------- header�κ�-------------------------- -->
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
									<a href="../join/join.jsp" id="joinbtn">ȸ������</a>
									&nbsp;&nbsp;
									<a href="../login/login.jsp" id="loginbtn">�α���</a>
									&nbsp;&nbsp;

									<%
								}else
								{
									%>
									( <%= login_name %> )�� ȯ���մϴ�
									<%
									if( login_autho.equals("A") )
									{
										%>[ ������ ]<%
									}
									%>
									&nbsp; |
									<a href="../login/logout.jsp" id="logoutbtn">�α׾ƿ�</a>
									<%
								}
								%>
							</td>
						</tr>
						<tr>
							<td>
								<a href="../main/index.jsp">
									<img src="../images/logo.png" width="250" height="250" alt="�ΰ��̹���">
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
					<img src="../images/vol.jpg" width="100%" height="200" alt="�����̹���">	
				</td>
			</tr>
			<tr>
				<td>
					<!-- -------------------index ������ ����------------------------------------------------------------------------------------ -->
					<table border="0" width="100%">
						<tr height="50px"></tr>
						<tr>
							<td ><a href="../board/notice.jsp"><span style="font-weight:bold; color:#1D1FAB; font-size:20px; padding: 10px 10px 10px 30px">��������</span></a></td>
						</tr>
						<tr height="30px"></tr>
						<tr>
							<td>
								<table style="width:85%; margin-left: auto; margin-right: auto;">
									<tr>
										<th style="background-color:#E8F2FE; width: 60px;" id="td">����</th>
										<th style="background-color:#E8F2FE;" id="td">����</th>
										<th style="background-color:#E8F2FE;width: 120px;" id="td">�ۼ���</th>
										<th style="background-color:#E8F2FE;width: 120px;" id="td">�ۼ���</th>						
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
											<td id="td">[����]</td>
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
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;padding: 10px 10px 10px 30px">���� ������</span>
				(�ֱ������� �����ڰ� �������� �������� ������Ʈ �մϴ�.)
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
			<!-- -------------------index ������ ����------------------------------------------------------------------------------------ -->
			<tr>
				<td colspan="5">
					<div style="padding: 0px 10px 10px 10px; background-color:#f4f4f4" >
					<a href="../main/index.jsp">
					<img src="../images/logo.png" width="150" height="150" alt="�ΰ��̹���"><br>
					</a>
					������: ������<br>
					��ȭ��ȣ: 010.3332.4544<br>
					E-mail: abcde@gmail.com<br>
					Copyright 2022 All rights reserved.
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<%@ include file="../db/dbclose.jsp" %>