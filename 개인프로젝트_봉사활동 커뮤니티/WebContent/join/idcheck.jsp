<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//--------------- ������ �ޱ�-------------------------------------------
	String id = request.getParameter("id");

	//--------------- ������ ��ȿ���˻�-------------------------------------------
	if(id == null || id.equals(""))
	{
		out.println("001");
	}
	
	//DB���� �ߺ��� id�ֳ� Ȯ��
	String sql = "";
	sql  = "select user_no from user ";
	sql += "where user_id = '" + id + "' ";
	ResultSet result = stmt.executeQuery(sql);
	
	if( result.next() == true )
	{
		//id�ߺ�
		out.println("002");
	}else
	{
		//��밡��
		out.println("003");
	}
%>
<%@ include file="../db/dbclose.jsp" %>