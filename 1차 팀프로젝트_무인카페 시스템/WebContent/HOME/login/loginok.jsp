<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
String id	= request.getParameter("id");
String pw	= request.getParameter("pw");
if(id == null ||id.equals(""))
	{
		out.println("ERROR");
		return;
	}	
%>

<%
accountDTO dto		= new accountDTO();
accountVO  vo		= new accountVO(id,pw);
accountVO loginVO 	= dto.Login(vo);

if( loginVO == null)
{
	out.println("ERROR");
}
else

{
	out.println("OK");
	
	session.setAttribute("accountVO",loginVO);
	
	/*
	session.setAttribute("id",id);
	session.setAttribute("name",user.name());
	*/
}

%> 