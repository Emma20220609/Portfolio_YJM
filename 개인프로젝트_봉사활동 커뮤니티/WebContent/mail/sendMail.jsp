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
	//�ѱ�ó��
	request.setCharacterEncoding("EUC-KR");
	
	//---------------������ �ޱ�-------------------------------------------
	String useremail  = request.getParameter("email");
	String title 	  = request.getParameter("title");
	String note   	  = request.getParameter("note");

	//--------------- �α��� �������� ��������-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");
		
	//--------------- �Խù� ���� ����ǥ ����-------------------------------------------
	title  = title.replace("'","''");
	note   = note.replace("'","''");
	
	//--------------- DB�� �Խù� �ֱ�-------------------------------------------
	String sql="";
	sql = "insert into ask (user_no,ask_email,ask_title,ask_note) ";
	sql += "values ('"+ login_no +"','"+ useremail +"','"+ title +"','"+ note +"') ";
	System.out.println(sql);
	stmt.executeUpdate(sql);
		
	//---------------SMTP ������ �����ϱ� ���� ������-------------------------------------------
	Properties p = new Properties(); // ������ ���� ��ü
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
    
  	//---------------������ ������ ���� ��ü-------------------------------------------
    MimeMessage msg = new MimeMessage(ses);
    msg.setSubject(title); // ����
    
    Address fromAddr = new InternetAddress(useremail);
    msg.setFrom(fromAddr); // ������ ���(��)
    
    Address toAddr = new InternetAddress("yjmny2022@gmail.com");
    msg.addRecipient(Message.RecipientType.TO, toAddr); //�޴»��(��)
    
    msg.setContent(useremail+"�Բ���, "+note, "text/html;charset=UTF-8");
    
    Transport.send(msg); 

	out.println("<script>alert('���������� ���޵Ǿ����ϴ�!');location.href='../board/contact.jsp';</script>");
%>
<%@ include file="../db/dbclose.jsp" %>
