<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
//======================== 앞단의 데이터 받기 ========

String name		= request.getParameter("name");
String data1	= request.getParameter("data1");
String email	= request.getParameter("email");

//======================== 데이터 유효성 검사 처리 ========
if( name == null || data1 == null || email == null
	)
{

	out.println("ERROR");
	response.sendRedirect("../index.jsp");
	return;
}

if( name.equals("") || data1.equals("") || email.equals(""))
{
	out.println("ERROR");
	response.sendRedirect("../index.jsp");
	return;
}

%>



<script>

window.onload = function()
{
	alert("빠른 시일 내에 상담원이 연락드리겠습니다");
	document.location = "../index.jsp";
}

</script>

