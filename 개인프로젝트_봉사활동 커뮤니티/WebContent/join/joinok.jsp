<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//�ѱ� ó��
	request.setCharacterEncoding("euc-kr");
	
	//--------------- ������ �ޱ�-------------------------------------------
	String id         = request.getParameter("id");
	String pw         = request.getParameter("pw");
	String name       = request.getParameter("name");
	String gender     = request.getParameter("gender");
	String[] interest = request.getParameterValues("interest");
	
	//--------------- ������ ��ȿ���˻�-------------------------------------------
	if( id == null || pw == null || name == null || gender == null)
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
	
	if( id.equals("") || pw.equals("") || name.equals("") || gender.equals(""))
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
%>

<%@ include file="../db/dbopen.jsp" %>

<%
	String sql = "";
	sql = "select user_no from user where user_id = '" + id + "'";
	ResultSet result = stmt.executeQuery(sql);
	if( result.next() == true)
	{
		%>
		<%@ include file="../db/dbclose.jsp" %>
		<%
	}
	
	//--------------- ���ɺо� ó��-------------------------------------------
	String user_interest = "";
	if(interest != null)
	{		
		for(String data : interest)
		{
			if( !user_interest.equals("") )
			{
				user_interest += ",";
			}
			user_interest += data;
		}
	}

	//--------------- DB�� �Խù� �ֱ�-------------------------------------------
	sql  = "insert into user (user_id,user_pw,user_name,user_gender,user_interest) ";
	sql += "values ('" + id + "',md5('" + pw + "'),'" + name + "','" + gender + "','" + user_interest + "') ";
	stmt.executeUpdate(sql);
%>

<script>
	window.onload = function()
	{
		alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
		document.location = "../main/index.jsp";
	}
</script>
<%@ include file="../db/dbclose.jsp" %>

