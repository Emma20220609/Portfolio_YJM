<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="nl.captcha.Captcha" %>
<%@page import="nl.captcha.Captcha.Builder" %>
<%@page import="nl.captcha.backgrounds.FlatColorBackgroundProducer" %>
<%@page import="java.awt.Color" %>
<%
	//�ڵ���Ϲ��� �ڵ带 �̹����� ����Ѵ�.
	Captcha mCaptcha;
	Builder mBuilder;
	String  mAnswer;
	
	mBuilder= new Captcha.Builder(160, 50);
	mBuilder.addText();
	mBuilder.addBackground(new FlatColorBackgroundProducer(Color.WHITE));
	mBuilder.addBorder();
	mBuilder.addNoise();
	mCaptcha = mBuilder.build();
	mAnswer = mCaptcha.getAnswer();
	
	OutputStream mOut = response.getOutputStream();
	ImageIO.write(mCaptcha.getImage(),"jpg", mOut);
	mOut.close();
	
	request.getSession().setAttribute("capcha",mAnswer);
%>