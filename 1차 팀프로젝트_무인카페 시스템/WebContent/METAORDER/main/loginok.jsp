<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.util.*" %>
<%@ page import="meta.dbms.*" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>

<%
String id	= request.getParameter("id");
String pw	= request.getParameter("pw");

if(id == null ||id.equals("") || pw == null ||pw.equals(""))
{
	return;
}
%>

<%
accountDTO dto = new accountDTO();
accountVO  vo = new accountVO(id,pw);
accountVO  user = dto.Login(vo);

if( user == null)
{
	//아이디 없음
	out.println("ERROR");
}else
{
	out.println("OK");

	//세션에 사용자 로그인 정보를 저장한다.
	session.setAttribute("login",user);
}

%>