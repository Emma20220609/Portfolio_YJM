<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- 넘어온 search_key 한글처리  -->
<%@ page import="java.net.URLEncoder" %>

<%
	String no   	  = request.getParameter("no"); 
	String kind 	  = request.getParameter("kind");
	String cpage      = request.getParameter("page");
	String search_key = request.getParameter("search_key");
	String provin     = request.getParameter("provin");
	String area       = request.getParameter("area");
	
	if(kind == null)       kind       = "L";
	if(cpage == null)      cpage      = "1";
	if(search_key == null) search_key = "";
	if(provin == null)     provin     = "";
	if(area == null)       area       = "";
	if(no == null)
	{
		response.sendRedirect("../board/loindex.jsp");
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
	String provin_encoded = URLEncoder.encode(provin);
	String area_encoded   = URLEncoder.encode(area);
	String skey_encoded   = URLEncoder.encode(search_key);
	response.sendRedirect("../board/loindex.jsp?no=" + no + "&page=" + cpage + "&kind=" + kind + "&search_key=" + skey_encoded + "&provin=" + provin_encoded + "&area=" + area_encoded);
%>