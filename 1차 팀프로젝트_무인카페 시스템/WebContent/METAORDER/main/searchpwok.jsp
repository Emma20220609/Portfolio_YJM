<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.mail.*" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.util.*" %>
<%
//한글처리
request.setCharacterEncoding("UTF-8");


//비밀번호 찾기(searchpw.jsp)에서 받는 값
String id	= request.getParameter("id");
String ph	= request.getParameter("phonenum");
String em	= request.getParameter("email");

System.out.println(id);
System.out.println(ph);
System.out.println(em);

SearchVO searchVO = new SearchVO(request);
ListDTO  listDTO  = new ListDTO(searchVO);
accountDTO dto = new accountDTO();
MailDTO ms = new MailDTO();

accountVO  vo = dto.Searchpw(id,em,ph);

if(id == null || id.equals("") || ph == null ||ph.equals("")|| em == null ||em.equals(""))
{
	response.sendRedirect("searchpw.jsp");
	return;
}

if( vo == null)
{
	//아이디 없음
	System.out.println("ERROR");
}else
{
	System.out.println("OK");
}

//loginVO = (accountVO)session.getAttribute("login");

%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>
		<table align=center width=500px>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<a href="login.jsp"><img src="../img/back.png"></a>
					</h2>
				</td>
			</tr>
			<tr>
				<td>
					<img src="../img/CoffeeLogo.png">
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						비밀번호 찾기
					</h2>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h3>
					<%
					if(vo == null)
					{
						%>일치하는 정보가 없습니다!<%
					}else
					{
						%>임시 비밀번호를 회원님의 메일<%= vo.em() %>로 보냈습니다!<%
						ms.MailSend(em);
						dto.UpdatePW(id, ms.uuid);

					}
					%>
					</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px; height:1px;background-color:#A6A6A6"></td>
			</tr>
			<tr>
				<td colspan="3" align=center height=100px; style="width:100px; " >
					<div><a class="btn next" href="index.jsp">확인</a></div>
				</td>
			</tr>
		</table>
	</body>
</html>