<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//한글 처리
	request.setCharacterEncoding("euc-kr");
	
	//--------------- 데이터 받기-------------------------------------------
	String id         = request.getParameter("id");
	String pw         = request.getParameter("pw");
	String name       = request.getParameter("name");
	String gender     = request.getParameter("gender");
	String[] interest = request.getParameterValues("interest");
	
	//--------------- 데이터 유효성검사-------------------------------------------
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
	
	//--------------- 관심분야 처리-------------------------------------------
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

	//--------------- DB게 게시물 넣기-------------------------------------------
	sql  = "insert into user (user_id,user_pw,user_name,user_gender,user_interest) ";
	sql += "values ('" + id + "',md5('" + pw + "'),'" + name + "','" + gender + "','" + user_interest + "') ";
	stmt.executeUpdate(sql);
%>

<script>
	window.onload = function()
	{
		alert("회원가입이 완료되었습니다.");
		document.location = "../main/index.jsp";
	}
</script>
<%@ include file="../db/dbclose.jsp" %>

