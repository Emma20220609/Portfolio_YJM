<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %> 
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String host   = "jdbc:mysql://silverwoods.synology.me:3306/CTEAM";
	host += "?useUnicode=true&characterEncoding=utf-8";
	host += "&serverTimezone=UTC";
	String userid = "CTEAM";
	String passwd = "E2en_java_(team";
	Connection conn = null;
	
	//데이터베이스에 연결
	conn = DriverManager.getConnection(host,userid,passwd);
	
	//작업 처리용 클래스를 할당 받는다.
	Statement stmt = conn.createStatement();
%>