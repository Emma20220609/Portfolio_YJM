<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cart_count		= 0; 

if(session.getAttribute("cart_count") != null){
	cart_count = (Integer) session.getAttribute("cart_count");	//총액
};

if( cart_count < 0 ) 	 {cart_count = 0;}

String sel_option  = request.getParameter("sel_option");
String select_item = request.getParameter("select_item");
String total_price = request.getParameter("total_price");


if(select_item != null){
	session.setAttribute("sel_option"+cart_count,	sel_option );		//카트에 담긴 상품 갯수
	session.setAttribute("select_item"+cart_count,	select_item );		//카트에 담긴 상품 갯수
	session.setAttribute("total_price"+cart_count,	total_price );		//카트에 담긴 상품 갯수
	session.setAttribute("cart_count",	++cart_count );					//카트에 담긴 상품 갯수
	return;
}
out.print("ERROR");
%>