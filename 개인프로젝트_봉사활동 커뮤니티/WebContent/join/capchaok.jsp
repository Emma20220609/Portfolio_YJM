<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String mAnswer = (String)request.getSession().getAttribute("capcha");
	out.print(mAnswer);
%>