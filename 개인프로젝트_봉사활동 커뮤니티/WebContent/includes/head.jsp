<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String login_id    = (String) session.getAttribute("id");
	String login_no    = (String) session.getAttribute("user_no");
	String login_name  = (String) session.getAttribute("user_name");
	String login_autho = (String) session.getAttribute("user_autho");
%>
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="EUC-KR">
		<title>VLOVE</title>
		 <link rel="stylesheet" href="../css/board.css"/>
		 <script src="../js/jquery-3.6.0.js"></script>
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
									<a href="../login/logout.jsp" id="logoutbtn" >�α׾ƿ�</a>
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
			               		<%
								String search_menu = request.getParameter("id");
								if(search_menu == null) search_menu = "A";
								%>
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
				</td>
			</tr>
			<tr>