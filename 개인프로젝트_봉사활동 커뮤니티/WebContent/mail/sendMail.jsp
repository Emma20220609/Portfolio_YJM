<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../db/dbopen.jsp" %>
<%
	//한글처리
	request.setCharacterEncoding("EUC-KR");
	
	//---------------데이터 받기-------------------------------------------
	String useremail  = request.getParameter("email");
	String title 	  = request.getParameter("title");
	String note   	  = request.getParameter("note");

	//--------------- 로그인 세션정보 가져오기-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");
		
	//--------------- 게시물 작은 따옴표 에러-------------------------------------------
	title  = title.replace("'","''");
	note   = note.replace("'","''");
	
	//--------------- DB게 게시물 넣기-------------------------------------------
	String sql="";
	sql = "insert into ask (user_no,ask_email,ask_title,ask_note) ";
	sql += "values ('"+ login_no +"','"+ useremail +"','"+ title +"','"+ note +"') ";
	System.out.println(sql);
	stmt.executeUpdate(sql);
		
	//---------------SMTP 서버에 접속하기 위한 정보들-------------------------------------------
	Properties p = new Properties(); // 정보를 담을 객체
	p.put("mail.smtp.host","smtp.gmail.com"); //google SMTP
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
    ses.setDebug(true);
    
  	//---------------메일의 내용을 담을 객체-------------------------------------------
    MimeMessage msg = new MimeMessage(ses);
    msg.setSubject(title); // 제목
    
    Address fromAddr = new InternetAddress(useremail);
    msg.setFrom(fromAddr); // 보내는 사람(나)
    
    Address toAddr = new InternetAddress("yjmny2022@gmail.com");
    msg.addRecipient(Message.RecipientType.TO, toAddr); //받는사람(나)
    
    msg.setContent(useremail+"님께서, "+note, "text/html;charset=UTF-8");
    
    Transport.send(msg); 

	out.println("<script>alert('성공적으로 전달되었습니다!');location.href='../board/contact.jsp';</script>");
%>
<%@ include file="../db/dbclose.jsp" %>
