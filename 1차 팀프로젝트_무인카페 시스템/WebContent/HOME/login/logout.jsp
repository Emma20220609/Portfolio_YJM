<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("accountVO");
/*
session.removeAttribute("id");
session.removeAttribute("name");
*/
response.sendRedirect("../index.jsp");
%>