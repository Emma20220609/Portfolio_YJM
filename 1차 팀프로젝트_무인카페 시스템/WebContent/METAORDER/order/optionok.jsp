<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
request.setCharacterEncoding("UTF-8");
String  sel_option = request.getParameter("sel_option");

String [] ary = sel_option.split(",");

for(String item : ary)
{
	out.print(item + "<br>");
}
%>