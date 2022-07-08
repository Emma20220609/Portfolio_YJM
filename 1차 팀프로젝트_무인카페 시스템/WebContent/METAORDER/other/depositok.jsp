<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="other_include/header.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String	depochar	=	request.getParameter("depochar");

int deposit = Integer.parseInt(depochar);

System.out.println(deposit);

if( user == null )
{
	response.sendRedirect("index.jsp");
	return;
}

accountDTO DTO		= new accountDTO();
accountVO vo		= new accountVO();

user.deposit(deposit);

response.sendRedirect("deposit.jsp");
%>
<%@ include file="other_include/footer.jsp" %>			