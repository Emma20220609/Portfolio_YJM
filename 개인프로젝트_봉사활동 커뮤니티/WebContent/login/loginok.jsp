<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//---------------������ �ޱ�-------------------------------------------
	String id = request.getParameter("id"); 	//userid�� �ƴ϶� ajax�� data:id �Ѿ��
	String pw = request.getParameter("pw");
	
	//--------------- ������ ��ȿ�� �˻�-------------------------------------------
	if(id == null || pw == null || id.equals("") || pw.equals(""))
	{
		//out.println("no");
		return;
	}	
%>
<%@ include file="../db/dbopen.jsp"%>
<%
	//�Ѿ�� ip,pw ����� Ȯ��
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
		
		//���ǿ� ����(pw ���� �ʿ� ����)
		session.setAttribute("id", id);
		session.setAttribute("user_no", user_no);
		session.setAttribute("user_name", user_name);
		session.setAttribute("user_autho", user_autho);
	}
%>
<%@ include file="../db/dbclose.jsp"%>