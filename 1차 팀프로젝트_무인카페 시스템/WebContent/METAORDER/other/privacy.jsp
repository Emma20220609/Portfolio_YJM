<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="meta.vo.*" %>

<%

accountVO user = (accountVO)session.getAttribute("login");

if( user == null )
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = 'index.jsp';</script>");
	return;
}

String[] date = user.age().split("-");

/*
System.out.println(date[0]);
System.out.println(date[1]);
System.out.println(date[2]);
*/

%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script src="../js/jquery-3.6.0.js" ></script>
	</head>
	<body>
	<script>
	function DoModify()
	{
		if(confirm("개인정보를 수정 하시겠습니까?") != 1)
		{
			return;	
		}
		$("#privacy").submit();
	}
	
	$(document).ready(function()
			{
				var now = new Date();
				var year = now.getFullYear();
				var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1);
				var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());

				//년도 selectbox만들기
				for(var i = 1900 ; i <= year ; i++)
				{
					$('#year').append('<option value="' + i + '">' + i + '년</option>');
				}

				// 월별 selectbox 만들기
				for(var i=1; i <= 12; i++)
				{
					var mm = i > 9 ? i : +i ;
					$('#month').append('<option value="' + mm + '">' + mm + '월</option>');
				}

				// 일별 selectbox 만들기
				for(var i=1; i <= 31; i++)
				{
					var dd = i > 9 ? i : +i ;
					$('#day').append('<option value="' + dd + '">' + dd+ '일</option>');
				}

				//회원의 생년월일
				$("#year > option[value="+<%=date[0]%>+"]").attr("selected", "true");
				$("#month > option[value="+<%=date[1]%>+"]").attr("selected", "true");
				$("#day > option[value="+<%=date[2]%>+"]").attr("selected", "true");
				})

	</script>
		<form id="privacy" name="privacy" action="privacyok.jsp">
		<table align=center width=500px>
			<tr>
				<td>
					<a href="index.jsp"><img src="../img/back.png"></a>
				</td>
			</tr>
			<tr style="height:100px;">
				<td colspan="4">
					<h2>
						개인정보 관리
					</h2>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4>아이디</h4></div>
					<%= user.id() %>
				</td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4>이름</h4></div>
					<%= user.name() %>
					<div style="float:right">
						<% if(user.gen().equals("1"))
						{
							%>남자<%
						}else
						{
							%>여자<%
						}
						%>
					</div>
				</td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4" style="align:center;" >
					<div><h4>생년월일</h4></div>
						<select style="width:100px; text-align-last:center; " name="yy" id="year"></select>
						<select style="width:100px; text-align-last:center; " name="mm" id="month"></select>
						<select style="width:100px; text-align-last:center; " name="dd" id="day"></select>
				</td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4>휴대폰</h4></div>
					<%= user.hp() %>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr>
				<td>
					<p style="font-size:12px">휴대폰 번호는 메타벅스 홈페이지에서 변경 가능합니다.</p>
				</td>
			</tr>
			<tr>
				<td>
					<p style="font-size:12px"><input type="checkbox" name="SMS">SMS를 통한 이벤트 및 신규 매장 정보 수신에 동의합니다.(선택)</p>
				</td>
			</tr>
			<tr style="height:100px; ">
				<td colspan="4">
					<div><h4>메일</h4></div>
					<input id="email" name="email" type="text" size="65px" value="<%= user.em() %>">
				</td>
			</tr>
			<tr>
				<td>
					<p style="font-size:12px"><input type="checkbox" name="email_ch">이메일을 통한 이벤트 및 신규 매장 정보 수신에 동의합니다.(선택)</p>
				</td>
			</tr>
			<tr>
				<td align=center>
					<a href="javascript:DoModify();">개인정보 수정</a>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>