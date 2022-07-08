<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	session.setAttribute("sel_count",0);		//전체 음료갯수
	session.setAttribute("menucount",0);		//음료 하나당 갯수
	session.setAttribute("sel_price",0); 		//하나당 가격
	session.setAttribute("subtotal_price",0);	// 합계
%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link rel="stylesheet" href="css/kiosk.css"/>
	</head>
<script>
    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    
    function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > x.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    x[index-1].style.display = "block";  //해당 인덱스는 block으로
    setTimeout(slideShow, 3000);   //함수를 4초마다 호출
 
	}
</script>
<style>
	 img
	 {
	 	width:100%;
	 	height:1400px;
	 	
	 }
</style>
	<body>
		<div>
		  <img class="slide1" src="images/poster.gif" >
		  <img class="slide1" src="images/poster3.gif">
		  <img class="slide1" src="images/poster2.gif">
		  <img class="slide1" src="images/poster4.gif">
		</div>
		<table border="0" width="100%" height="100%">

			<tr></tr>
			<tr height="200px" >
				<td id="indexbar" style="text-align:center"><a id="abtn" style="color: white;font-weight:bold;font-size:50px;" href="login.jsp">주문하기 ></a></td>
			</tr>
		</table>
	</body>
	</html>