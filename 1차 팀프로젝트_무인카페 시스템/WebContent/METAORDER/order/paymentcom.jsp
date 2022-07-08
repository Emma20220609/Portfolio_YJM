<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String payInfo = request.getParameter("payInfo");
String selPay = request.getParameter("selPay");

System.out.println("payInfo= "+ payInfo);
System.out.println("selPay=  "+ selPay);


String[] Info = payInfo.split("@");
System.out.print("사이즈 = " + Info[0] +" 이름 = " + Info[1]+ " 가격 = "+ Info[2] + "<br>");
System.out.print("샷 = " + Info[3] +" 시럽 = " + Info[4]+ " 음료개수 = "+ Info[5] + "<br>");
System.out.print("총가격 = " + Info[6] + "<br>");

out.println("OK");

%>
