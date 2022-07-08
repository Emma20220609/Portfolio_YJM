<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String board_no   = request.getParameter("no");
	String comt_no    = request.getParameter("cno");
	String board_type = request.getParameter("type");
	
	if(board_no == null || comt_no == null || board_type == null )
	{
		response.sendRedirect("../main/index.jsp");
		return;	
	}
%>
<%@ include file="../db/dbopen.jsp" %>
<%
	String sql="";
	sql = "delete from comment ";
	sql += "where comt_no = '"+ comt_no +"' ";
	stmt.executeUpdate(sql);
%>
<%@ include file="../db/dbclose.jsp" %>
<%

	if(board_type.equals("A"))
	{
		response.sendRedirect("../view/inview.jsp?no=" + board_no);
	}else if(board_type.equals("L"))
	{
		response.sendRedirect("../view/loview.jsp?no=" + board_no);
	}else if(board_type.equals("C"))
	{
		response.sendRedirect("../view/comview.jsp?no=" + board_no);
	}else if(board_type.equals("N"))
	{
		response.sendRedirect("../view/noview.jsp?no=" + board_no);
	}else if(board_type.equals("Q"))
	{
		response.sendRedirect("../view/qnaview.jsp?no=" + board_no);
	}

%>