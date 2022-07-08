<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="db/dbopen.jsp" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");

String optionlist = request.getParameter("order");

String [] ary = optionlist.split("/");
System.out.println(ary[0]);

String id = "";
accountVO user  = (accountVO) session.getAttribute("accountVO");
if(user != null)
{
	id = user.id();
}

%>
<%@ include file="db/dbclose.jsp" %>

