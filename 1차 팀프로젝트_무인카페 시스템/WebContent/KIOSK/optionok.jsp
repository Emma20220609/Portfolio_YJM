<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");

	String  sel_menu = request.getParameter("sel_menu");
	System.out.println(sel_menu);
	
	int sel_count		= 0; 
	int sel_price		= 0;
	int subtotal_price  = 0;
	int menucount		= 0;

	sel_count	   = (Integer) session.getAttribute("sel_count");		//총갯수
	sel_price	   = (Integer) session.getAttribute("sel_price");		//총액
	menucount 	   = (Integer) session.getAttribute("menucount");		//메뉴당 갯수
	
	if( sel_count < 0 ) 	 {sel_count = 0;}
	if( sel_price < 0 ) 	 {sel_price = 0;}
	if( subtotal_price < 0 ) {subtotal_price = 0;}
	if( menucount < 0 ) 	 {menucount = 0;}

	String [] ary = sel_menu.split("/");
	String str = "sel_menu_" + sel_count;
	sel_count++;
	System.out.println(str);
	session.setAttribute("sel_count",	sel_count);												//종류갯수
	session.setAttribute(str,			sel_menu);												//넘어온값 전부
	session.setAttribute("sel_price",	Integer.parseInt(ary[6].replace("," ,""))+sel_price);	//총액
	session.setAttribute("menucount", 	Integer.parseInt(ary[5])+menucount);					//메뉴당 갯수들 총갯수

	response.sendRedirect("drinkmenu.jsp");
%>
<script>
	
</script>