<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//작업 처리용 클래스를 닫는다.
	stmt.close();
	
	//데이터베이스 연결을 종료한다.
	conn.close();
%>
