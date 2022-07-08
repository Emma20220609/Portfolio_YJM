<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>  
<%@ page import="meta.dbms.*" %>  
   
<%

DBManager db = new DBManager();
db.DBOpen();

String sql = "";



for(int i=1; i <= 50; i++)
{
	String title   ="[공지사항] 메타벅스 공지사항입니다.";
	String kind = "01";
	String note    = "공지사항";
	

	
	sql  = "insert into board (no, board_title, board_date, board_kind, board_note) ";
	sql += "values ('27','" + title + "', now(),'" + kind + "','" + note + "') ";

}
	System.out.println(sql);
	// insert into board (no, board_title, board_date, board_kind, board_note)  values ( '27',  '공지사항입니다',  	now()		,  '01',  '<p>메타벅스 공지사항입니다</p>' );

for(int i=1; i <= 50; i++)
{
	String title   ="[이벤트] 메타벅스 오픈이벤트입니다 ";
	String kind = "02";
	String note    = "오픈이벤트입니다";
	
	//title = String.format("문의 드립니다.",i);
	
	sql  = "insert into board (no,board_title,board_date,board_kind,board_note) ";
	sql += "values ('27','" + title + "', now(),'" + kind + "','" + note + "') ";
 //// insert into board (no, board_title, board_date, board_kind, board_note)  values ( '27',  '메타벅스 이벤트입니다',  	now()		,  '02',  '<p>메타벅스 이벤트 입니다</p>' );

}
db.RunSQL(sql);
db.DBClose();
%>
