<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
   <meta name="" content="">
 	<link href="./css/style.css" rel="stylesheet">
    <title> DataLab</title>
	<!-- <script src='https://www.tiobe.com/wp-content/themes/tiobe/js/jquery.min.js?ver=1.0.0' id='jQuery-root-js'></script> -->
	<!-- <script src="https://code.highcharts.com/highcharts.js"></script> -->
	<script src='./js/highcharts.js'></script>
	<script src='./js/companychart.js'></script>
	<script src="./js/jquery-3.6.0.js"></script>
 </head>
 <script>
		 $(document).ready( function() {
		     $( 'span.menuspan' ).click( function() {
		       $( 'span.h' ).toggle( 'slow' );
		     });
		   });
			
</script>
	<body>
		<header>
			<div class="logo" align="left"><a href="main.html"><img src="images/logo.png" alt="이것은 로고입니다."></a></div>
	  		<span class="menuspan"><a href="language.html">개발언어</a></span>
	  		<span class="menuspan"><a href="index.html">개발언어 통계</a></span>
			<span class="menuspan"><a href="contact.html">문의하기 </a></span>
	  	</header>
		<nav id="menubar">
	 		<p class="page_path"><a href="main.html">HOME>></a><span class="arr"></span> NAV>><span class="arr"></span>NAV</p>
	 	</nav>
		
	 	<!-- --------------컨텐츠 출력 되는곳 ---------->	
		<div class="mainContent">
		<div style="padding:0px 0px 100px 90px; "><h1>DataLab Index</h1></div>
			<div id="container"></div>
			<h2><b>2022월 6월의 인기 프로그래밍 언어</b></h2>
			<h3>June Headline: C++ is about to surpass Java</h3>
				<p>
				It seems to be that Java is on the losing side. In April 2020, Java was still number 1 on the TIOBE index. In that same month, Java had to give up its first place to C. Later on, in 2021, Python became unstoppable and surpassed Java as well. Now it looks like C++ is the next language to overtake Java. High level programming with performance is C++'s key reason why it is doing so well. The C++ language is revised every 3 years. Such revisions contain ground-breaking new features, which get the language on par with C# and Java, but without the performance penalty of a garbage collector. Let's see where C++ is heading the next few months. -- <i>Paul Jansen CEO TIOBE Software</i>
				</p> 
				<p>The TIOBE Programming Community index is an indicator of the popularity of programming 
				languages. The index is updated once a month. The ratings are based on the number of 
				skilled engineers world-wide, courses and third party vendors. Popular search engines such as
				Google, Bing, Yahoo!, Wikipedia, Amazon, YouTube and Baidu are used to calculate the ratings.
				It is important to note that the TIOBE index is not about the <i>best</i> programming language or the language
				in which <i>most lines of code</i> have been written.</p>
				<p>The index can be used to check whether your programming skills are still up to date or to make a 
				strategic decision about what programming language should be adopted when starting to build a new 
				software system. The definition of the TIOBE index can be found <a href="indicators.html">here</a>.
				</p>	
			<div><%@ include file="stack.jsp" %></div>
			<div id="companychart" style="width:100%; height:450px;"></div>
			<h2><b>2022월 6월의 기업의 선호 언어</b></h2>
			<h3>June Headline: Java의 선호도가 가장 높습니다.</h3>	
		</div>
		
			<!-- --------------컨텐츠 출력 되는곳 ---------->	
		<div id="body-wrapper">
			<div id="body-content"></div>
  		<footer class="footer">
   			
   			<p>2022 DataLab Company</p>
   			<p>572, Baekje-daero, Deokjin-gu, Jeonju-si, Jeollabuk-do, Republic of Korea</p>
   			<p>Copyrightⓒ2022  All rights reserved.</p>
		</footer>
		</div>
</body>
</html>