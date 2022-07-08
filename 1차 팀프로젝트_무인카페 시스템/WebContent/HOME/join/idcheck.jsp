<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%
String id = request.getParameter("id");
String str = request.getParameter("id");
String type = request.getParameter("id");
if(id == null || id.equals(""))
{
	//아이디가 비어 있는 경우
	out.println("ERROR");
}
accountDTO dto = new accountDTO();
int code = dto.IsDuplicate(str, type);
if( code == accountDTO.DUPLICATE)
{
	//아이디가 중복된 경우
	out.println("DUPLICATE");
	
}else
{
	//사용가능한 아이디인 경우
	out.println("NOTFOUND");
}


/*
UserDTO dto = new UserDTO();
int code = dto.IsDuplicate(id);
if( code == UserDTO.DUPLICATE )
{
	//아이디가 중복된 경우
	out.println("DUPLICATE");
}else
{
	//사용가능한 아이디인 경우
	out.println("NOTFOUND");
} */
%>
</html>