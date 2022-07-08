<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//한글처리
	request.setCharacterEncoding("euc-kr");

	//--------------- 데이터 받기-------------------------------------------
	String board_no   = request.getParameter("board_no");
	String user_no    = request.getParameter("user_no");
	String comt_note  = request.getParameter("comt_note");
	String board_type = request.getParameter("board_type");
	
	//--------------- 데이터 유효성검사----------------------------------------------
	if(board_no == null || user_no == null || comt_note == null )
	{
		response.sendRedirect("../main/index.jsp");
		return;	
	}
	
	//--------------- 로그인 세션 정보 가져옴-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");
	
	//--------------- 게시물 작은 따옴표 에러-------------------------------------------
	comt_note = comt_note.replace("'","''");
%>
<%@ include file="../db/dbopen.jsp" %>
<%
	String sql = "";
	sql  = "insert into comment (board_no,comt_userno,comt_name,comt_note) ";
	sql += "values ('" + board_no + "','" + login_no + "','" + login_name + "','" + comt_note + "')";
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