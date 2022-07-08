<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%
String userid ="";
//accountVO loginVO = (accountVO)session.getAttribute("login");
accountVO loginVO  = (accountVO) session.getAttribute("accountVO");





if(loginVO !=null)
{
 userid = loginVO.id();
}
%>    
<!doctype html>
<html lang="ko">
 <head>
  <title>MetaBucks</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=1180">
	<meta name="Author" content="MetaBucks">
	<meta name="description" content="메타벅스">

	
	<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/notosanskr.css" />
	<link type="text/css" rel="stylesheet" href="css/@default.css">
	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="js/slick.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

 </head>
 <body>
	
 <!--Wrap-->
 <div id="wrap" class="">
	<!--Header-->
	
	<div id="header">
		<div class="h_inner" style="padding-bottom: 0px;">
			<span class="gnb_bg"></span>
			<div class="join">
				<ul>
					<li><a href="login/login.jsp">
					<%
						if(loginVO == null)
						{
							%>
								Sign In
							<%
						}else
						{
							%>
							( <%=userid  %> )님 환영합니다
							<a href="login/logout.jsp" class="btnlogout">로그아웃</a>
							<%
						}%>
					</a></li>
				</ul>
			</div>	
			<h1 id="logo"><a href="index.jsp"><span></span>메타벅스</a></h1>
			<div class="gnb_wrap" id="gnb_wrap">
				<ul class="gnb">
					<li><a href="nav/about1.jsp">About us</a>
						<ul class="gsnb">
							<li><a href="nav/about1.jsp">Brand</a></li>
							<li><a href="nav/about2.jsp">Coffee</a></li>
						</ul>
					</li>
					<li><a href="nav/menu.jsp">MENU</a></li>
					<li><a href="nav/store.jsp">SHOP</a>
						<ul class="gsnb">
							<li><a href="nav/store.jsp">매장위치안내</a></li>
						</ul>
					</li>
					<li><a href="nav/contact.jsp">Contact</a>
						<ul class="gsnb">
							<li><a href="board/bindex.jsp">공지사항</a></li>
							<li><a href="nav/contact.jsp">이메일 문의하기</a></li>
						</ul>
					</li>
					
					<% 
					if(loginVO != null)
					{
						%>
						<li><a href="mypage/userinfo.jsp">Members</a>
							<ul class="gsnb">
								<li><a href="mypage/userinfo.jsp">My Page</a></li>
							</ul>
						</li>
						
						<script>
						//alert(" 로그인 해주세요");
						</script>
						<%
					}
					%>					
					
				</ul>
			</div>

		</div>
	</div><!--END Header-->
	