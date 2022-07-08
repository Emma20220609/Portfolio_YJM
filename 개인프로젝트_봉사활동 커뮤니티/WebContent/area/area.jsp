<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String provin = request.getParameter("id");
	if(provin == null) provin = "";
	String area = request.getParameter("area");
	if(provin == null) provin = "";
	
	if(provin.equals("전라북도"))
	{
		%>
		<select id="area">
			<option value="">::시군선택::</option>
			<option value="전주시">전주시</option>	
			<option value="군산시">군산시</option>
			<option value="남원시">남원시</option>	
			<option value="김제시">김제시</option>	
			<option value="정읍시">정읍시</option>	
			<option value="익산시">익산시</option>	
		</select>
		<%
	}else if(provin.equals("전라남도"))
	{
		%>
		<select id="area">
			<option value="">::시군선택::</option>
			<option value="목포시" >목포시</option>	
			<option value="광양시" >광양시</option>
			<option value="여수시" >여수시</option>	
			<option value="순천시" >순천시</option>	
			<option value="나주시" >나주시</option>	
		</select>
		<%
	}else
	{
		%>
		<select id="area">
			<option value="">::시군선택::</option>
		</select>
		<%	
	}
%>