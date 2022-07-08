<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_include/header.jsp" %>
	
	<script>
	
		window.onload = function()
		{
			document.searchpw.id.focus()
		}
	
		function DoChecke()
		{
			if($("#id").val() == "")
			{
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			if($("#email").val() == "")
			{
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return;
			}
			if($("#phonenum").val() == "")
			{
				alert("핸드폰번호를 입력하세요.");
				$("#phonenum").focus();
				return;
			}
			document.searchpw.submit();
		}
	</script>
		<table align=center width=500px>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						<a href="login.jsp"><img src="../img/back.png"></a>
					</h2>
				</td>
			</tr>
			<tr>
				<td>
					<img src="../img/CoffeeLogo.png">
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						비밀번호 찾기
					</h2>
				</td>
			</tr>
			<tr>
				<td align="center">
					<form name="searchpw" method="post" action="searchpwok.jsp">
					<div><input type="text" style="width:20rem; height:3rem; font-size:3rem;"name="id" id="id" placeholder="ID"></div>
					<br>
					<div><input type="text" style="width:20rem; height:3rem; font-size:3rem;"name="email" id="email" placeholder="이메일주소"></div>
					<br>
					<div style="float:left; width:100%;">
						<input type="text" style="width:20rem; height:3rem; font-size:3rem;"name="phonenum" id="phonenum" placeholder="휴대폰번호">
					</div>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px; height:1px;background-color:#A6A6A6"></td>
			</tr>
			<tr>
				<td colspan="3" align=center height=100px; style="width:100px; " >
					<div><a class="btn next" href="javascript:DoChecke();">다음</a></div>
				</td>
			</tr>
		</table>
	</body>
</html>