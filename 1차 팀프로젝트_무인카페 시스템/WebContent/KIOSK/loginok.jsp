<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>

<%
	String usernum	= request.getParameter("usernum");
	if(usernum == null ||usernum.equals(""))
	{
		//System.out.print("ERROR(1)");
		out.println("ERROR");
		return;
	}
%>
<%
	accountDTO DTO		= new accountDTO();
	accountVO vo		= new accountVO(usernum);
	accountVO loginVO	= DTO.Login(vo);
	
	if( loginVO == null)
	{
		//아이디 없음
		//System.out.print("ERROR(2)");
		out.println("ERROR");
	}else
	{
		//System.out.print("OK(1)");
		out.println("OK");
		//세션에 사용자 로그인 정보를 저장한다.	
		session.setAttribute("accountVO",loginVO);
		//response.sendRedirect("drinkmenu.jsp");
	}
	
%> 