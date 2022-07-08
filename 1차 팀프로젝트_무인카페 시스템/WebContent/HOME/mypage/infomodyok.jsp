<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
request.setCharacterEncoding("UTF-8");

String nickname = request.getParameter("nickname");
String em 		= request.getParameter("em");
String id 		= request.getParameter("id");
String hp 		= request.getParameter("hp");
String gender 	= request.getParameter("gender");
String age 		= request.getParameter("age");

if( nickname == null || em == null || id == null|| hp == null ||gender == null || age == null )
{
	
	out.println("ERROR");
	//response.sendRedirect("../index.jsp");
	return;
}
if( nickname.equals("") || em.equals("") || id.equals("")|| hp.equals("") || gender.equals("") ||age.equals("") )
{
	out.println("ERROR");
	
	return;
}


accountDTO DTO		= new accountDTO();
accountVO vo		= new accountVO();
accountVO loginVO   = (accountVO)session.getAttribute("accountVO");

loginVO.nickname(nickname);
loginVO.age(age);
loginVO.em(em);
loginVO.id(id);
loginVO.hp(hp);
loginVO.gen(gender);


DTO.Update(loginVO);

out.print("수정이 완료되었습니다");

response.sendRedirect("userinfo.jsp");
%>

