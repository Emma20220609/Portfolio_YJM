<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//---------------데이터 받기-------------------------------------------
	String id = request.getParameter("id"); 	//userid가 아니라 ajax의 data:id 넘어옴
	String pw = request.getParameter("pw");
	
	//--------------- 데이터 유효성 검사-------------------------------------------
	if(id == null || pw == null || id.equals("") || pw.equals(""))
	{
		//out.println("no");
		return;
	}	
%>
<%@ include file="../db/dbopen.jsp"%>
<%
	//넘어온 ip,pw 사용자 확인
	String sql="";
	sql = "select user_no,user_name,user_autho from user ";
	sql += "where user_id = '"+ id +"' and user_pw =  md5('"+ pw +"') ";
	ResultSet result = stmt.executeQuery(sql);

	if(result.next() == false)
	{
		out.println("no");
	}else
	{
		out.println("yes");
		
		String user_no    = result.getString("user_no");
		String user_name  = result.getString("user_name");
		String user_autho = result.getString("user_autho");
		result.close();
		
		//세션에 저장(pw 저장 필요 없음)
		session.setAttribute("id", id);
		session.setAttribute("user_no", user_no);
		session.setAttribute("user_name", user_name);
		session.setAttribute("user_autho", user_autho);
	}
%>
<%@ include file="../db/dbclose.jsp"%>