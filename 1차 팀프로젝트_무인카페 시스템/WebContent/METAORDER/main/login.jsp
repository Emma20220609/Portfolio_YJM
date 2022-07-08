<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_include/header.jsp" %>
	<script>
		window.onload = function()
		{
			document.login.userid.focus()
		}
		
		function Loginbutton()
		{
			if($("#userid").val() == "")
			{
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}		
			if($("#userpw").val() == "")
			{
				alert("비밀번호를 입력하세요.");
				$("#userpw").focus();
				return;
			}
			//document.login.submit();
			$.ajax({
				type : "post",
				url: "loginok.jsp",
				dataType: "html",
				data: 
				{
			        id: $("#userid").val(),
			        pw: $("#userpw").val()
			    },	
				success : function(data) 
				{
					data = data.trim();
					if(data == "OK")
					{
						//로그인 완료됨
						document.location = "../main/index.jsp";
					}else
					{
						alert("아이디 혹은 비밀번호가 맞지 않습니다.")
					}
				}
			});
			return false;
			
		}
	</script>
	
		<table align=center width=500px>
			<tr>
				<td>
					<a href="index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						로그인
					</h2>
				</td>
			</tr>
			<tr>
				<td>
					<div><img src="../img/CoffeeLogo.png"></div>
				</td>
			</tr>
			<tr style="height:200px;">
				<td colspan="4">
					<h2>
						안녕하세요.<br>
						메타벅스입니다.
					</h2>
					<h4>회원 서비스 이용을 위해 로그인 해주세요.</h4>
				</td>
			</tr>
			<tr>
				<td align=center>
					<form name="login" method="post" action="loginok.jsp">
						<div><input type="text" style="width:20rem; height:3rem; font-size:3rem;" id="userid" name="userid" placeholder="아이디" value="meta"></div>
						<br>
						<div><input type="password" style="width:20rem; height:3rem; font-size:3rem;" id="userpw" name="userpw" placeholder="비밀번호" value="1231"></div>
					</form>
				</td>
			</tr>
			<tr>
				<td align=center>
					<a href="searchid.jsp">아이디찾기</a> | <a href="searchpw.jsp">비밀번호찾기</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px; height:1px;background-color:#A6A6A6"></td>
			</tr>
			<tr>
				<td colspan="3" align=center height=100px; >
					<div><a class="btn" href="javascript:Loginbutton();">로그인하기</a></div>
				</td>
			</tr>
		</table>
	</body>
</html>