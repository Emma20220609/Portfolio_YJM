<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//--------------- 데이터 받기-------------------------------------------
	String id = request.getParameter("id");

	//--------------- 데이터 유효성검사-------------------------------------------
	if(id == null || id.equals(""))
	{
		out.println("001");
	}
	
	//DB에서 중복된 id있나 확인
	String sql = "";
	sql  = "select user_no from user ";
	sql += "where user_id = '" + id + "' ";
	ResultSet result = stmt.executeQuery(sql);
	
	if( result.next() == true )
	{
		//id중복
		out.println("002");
	}else
	{
		//사용가능
		out.println("003");
	}
%>
<%@ include file="../db/dbclose.jsp" %>