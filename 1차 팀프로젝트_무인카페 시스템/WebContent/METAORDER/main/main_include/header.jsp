<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.mail.*" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

accountVO user = (accountVO)session.getAttribute("login");

SearchVO searchVO = new SearchVO(request);
ListDTO  listDTO  = new ListDTO(searchVO);

%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>