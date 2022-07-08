<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- 넘어온 search_key 한글처리  -->
<%@ page import="java.net.URLEncoder" %>

<%
	String no         = request.getParameter("no");  
	String kind       = request.getParameter("kind");
	String cpage 	  = request.getParameter("page");
	String search_key = request.getParameter("search_key");
	
	if(kind   == null)       kind       = "C";
	if(cpage == null)        cpage      = "1";
	if(search_key  == null)  search_key = "";
	if(no == null)
	{
		response.sendRedirect("../board/com.jsp");
		return;
	}

%>
<%@ include file="../db/dbopen.jsp" %>
<%
	String sql = "";
	sql = "delete from comment where board_no = '" + no + "' ";
	stmt.executeUpdate(sql);
	
	sql = "delete from attach where board_no = '" + no + "' ";
	stmt.executeUpdate(sql);
	
	sql = "delete from board where board_no = '" + no + "' ";
	stmt.executeUpdate(sql);
%>
<%@ include file="../db/dbclose.jsp" %>
<%
	//search_key 한글
	String skey_encoded   = URLEncoder.encode(search_key);
	response.sendRedirect("../board/com.jsp?no=" + no + "&kind=" + kind + "&page=" + cpage + "&search_key=" + skey_encoded);
%>