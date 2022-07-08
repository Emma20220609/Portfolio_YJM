<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="meta.dbms.*" %>
<%
String para_lang = request.getParameter("lang");
//유효값 체크 & 초기화
String lang = ( para_lang == null || para_lang.equals("") ) ? "total" : para_lang ;
System.out.println("para lang : " + para_lang );
System.out.println("selected lang : " + lang );
System.out.println("boolean : " + (lang.equals(para_lang)));
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
		<title>Datalab Company</title>
		<link href="../css/style.css" rel="stylesheet">
		<script src="../js/jquery-3.6.0.js"></script>
		<script src='//code.highcharts.com/highcharts.js?ver=1.0.0' id='highcharts-js'></script>
		<script src='../js/charts_datas.js'></script>
		<script src='../js/charts_fun.js'></script>
		<script src='../js/charts_set.js'></script>
		<script src='../js/content.js'></script>
	</head>
	<body>
		<div class="header">
			<div class="one">
				<a href="../index.jsp">
				<img src="../images/logo.png" width="120px" height="120px" alt="이것은 로고입니다.">
				</a>
			</div>
			<div class="two">
				<a href="../index.jsp">
				<h1>DataLab</h1>
				</a>
			</div>
		</div>
		<nav>
			<ul>
	<!-- 		<li class="dropdown">
					<div class="dropdown-menu">개발 언어별 분석</div>
					<div class="dropdown-content">
						<a href="javascript:setDIV('.contents', './jsp/lang_charts.jsp');">인기언어 순위</a>
					</div>
				</li>
	 -->
				<li class="dropdown">
					<div class="dropdown-menu">개발자 트랜드</div>
					<div class="dropdown-content">
						<a href="javascript:setDIV('.contents', './content.jsp');">커뮤니티 트랜드</a>
	<!--				<a href="#">검색엔진 트랜드</a> --> 
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">기업 트랜드</div>
					<div class="dropdown-content">
						<a href="javascript:setDIV('.contents','./rec_site.jsp');">구인 사이트</a>
						<a href="./rec_lang.jsp">기업별 언어</a>
					</div>
				</li>
				<li class="dropdown">
					<div class="dropdown-menu">문의하기</div>
					<div class="dropdown-content">
						<a href="javascript:setDIV('.contents', './about_us.jsp');">소개</a>
						<a href="javascript:setDIV('.contents', './contact.jsp');">E-mail</a>
					</div>
				</li>
				<li class="home"><a href="../index.jsp">Home</a></li>
			</ul>
		</nav>
<!-- start ==================== content ======================================= -->
<div class="contents">
	<div class="leftcolumn">
		<div class="card">
			<div style="width:100%; height:500px;">
				<h2>기업의 언어 트랜드 분석</h2>
				<h3>2022. 6</h3>
				<form id="myForm" name="myForm" method="get" action="rec_lang.jsp">
					<select id="lang" name="lang" onchange="document.myForm.submit();" style="width:6rem;height:2rem;font-size:1rem;">
						<option value="total"	 <% if( lang.equals("total") )	 out.print("selected"); %>>TOTAL</option>
						<option value="C"		 <% if( lang.equals("C") )		 out.print("selected"); %>>C</option>
						<option value="C++"		 <% if( lang.equals("C++") )		 out.print("selected"); %>>C++</option>
						<option value="C#"		 <% if( lang.equals("C#") )		 out.print("selected"); %>>C#</option>
						<option value="java"	 <% if( lang.equals("java") )		 out.print("selected"); %>>JAVA</option>
						<option value="JS"		 <% if( lang.equals("JS") )		 out.print("selected"); %>>JS</option>
						<option value="python"	 <% if( lang.equals("python") )		 out.print("selected"); %>>PYTHON</option>
						<option value="VB"		 <% if( lang.equals("VB") )		 out.print("selected"); %>>VB</option>
						
					</select>
				</form>
				<table cellpadding="5px">
					<tr style="background-color: silver; height:3rem;" align ="center">
						<th style="width:10rem;">회사명</td>
						<th style="width:7rem;" >구인사이트</td>
						<th style="width:5rem;" >구인공고<br>총 갯수</td>
						<th style="width:4rem;" >C</td>
						<th style="width:4rem;" >C++</td>
						<th style="width:4rem;" >C#</td>
						<th style="width:4rem;" >java</td>
						<th style="width:4rem;" >JS</td>
						<th style="width:4rem;" >python</td>
						<th style="width:4rem;" >VB</td>
					</tr>
		<%
		DBManager db = new DBManager();
		db.DBOpen();
		String SQL = "SELECT * FROM rec_analysis_by_company";
		SQL += " ORDER BY `" + lang +"`";
		SQL += " DESC limit 5";
		System.out.println("SQL : " + SQL );
		db.OpenQuery(SQL);
		while(db.GetNext() == true)
		{
			String com_name	= db.GetValue("com_name");
			String rec_name	= db.GetValue("rec_name");
			String total	= db.GetValue("total");
			String CL		= db.GetValue("C");
			String CP		= db.GetValue("C++");
			String CS		= db.GetValue("C#");
			String JV		= db.GetValue("java");
			String JS		= db.GetValue("JS");
			String PY		= db.GetValue("python");
			String VB		= db.GetValue("VB");
			%>
					<tr style="background-color:#fffff0; height:3rem;">
						<td><%= com_name %> </td>
						<td><%= rec_name %> </td>
						<td align ="right" <% if (lang.equals("total"))	 out.print("style='background-color:pink'"); %>><b> <%= total %></b></td>
						<td align ="right" <% if (lang.equals("C"))		 out.print("style='background-color:pink'"); %>><b> <%= CL %></b></td>
						<td align ="right" <% if (lang.equals("C++"))	 out.print("style='background-color:pink'"); %>><b> <%= CP %></b></td>
						<td align ="right" <% if (lang.equals("C#"))	 out.print("style='background-color:pink'"); %>><b> <%= CS %></b></td>
						<td align ="right" <% if (lang.equals("java"))	 out.print("style='background-color:pink'"); %>><b> <%= JV %></b></td>
						<td align ="right" <% if (lang.equals("JS"))	 out.print("style='background-color:pink'"); %>><b> <%= JS %></b></td>
						<td align ="right" <% if (lang.equals("python")) out.print("style='background-color:pink'"); %>><b> <%= PY %></b></td>
						<td align ="right" <% if (lang.equals("VB"))	 out.print("style='background-color:pink'"); %>><b> <%= VB %></b></td>
					</tr>
		<%
		}
		%>
				</table>
				<p>구인 사이트의 개발 언어별 구인 게시글 수 분석</p>
				</div>
		</div>
	</div>
	<div class="rightcolumn">
		<div class="card">
			<div style="width:100%; height:500px;">
				<h3>선택 언어에 대한 개발자 트랜드 분석 키워드 </h3>
				<% if(!lang.equals("total"))
				{
					if(lang.equals("C#")){
						%>
						<img src="../images/CS_wc.png" height="450px" alt="선택된 언어의 워드클라우드 입니다.">
						<%
					}else{
						%>
						<img src="../images/<%= lang %>_wc.png" height="450px" alt="선택된 언어의 워드클라우드 입니다.">
						<%
					}
				}
				%>
			</div>
		</div>
	</div>
</div>
<!-- end ====================== content ======================================= -->
<div class="footer">
	<p>2022 DataLab Company<br>
	572, Baekje-daero, Deokjin-gu, Jeonju-si, Jeollabuk-do, Republic of Korea<br>
	Copyrightⓒ2022  All rights reserved.</p>
</div>
	</body>
</html>