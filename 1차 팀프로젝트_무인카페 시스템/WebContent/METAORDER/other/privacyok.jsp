<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
request.setCharacterEncoding("UTF-8");

accountVO user = (accountVO)session.getAttribute("login");
String	email	=	request.getParameter("email");
String	year	=	request.getParameter("yy");
String	month	=	request.getParameter("mm");
String	day		=	request.getParameter("dd");

String age		= year + "-" + month + "-" + day ;

if( user == null )
{
	response.sendRedirect("index.jsp");
	return;
}


accountDTO DTO		= new accountDTO();
accountVO vo		= new accountVO();



user.age(age);
user.em(email);


DTO.Update(user);



response.getWriter().print("<script>alert('수정이 완료 되었습니다.'); location.href = 'index.jsp';</script>");
%>

