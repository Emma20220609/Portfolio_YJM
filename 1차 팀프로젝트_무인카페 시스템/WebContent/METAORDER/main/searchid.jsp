<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_include/header.jsp" %>
	<script>
	
		window.onload = function()
		{
			document.searchid.str.focus()
		}
	
		function DoChecke()
		{
			if($("#str").val() == "")
			{
				alert("내용을 입력하세요.");
				$("#str").focus();
				return;
			}	
			document.searchid.submit();
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
						아이디 찾기
					</h2>
					
				</td>
			</tr>
			<tr>
				<td align="center">
					<form name="searchid" method="get" action="searchidok.jsp">
					<div>
						<select name="id_search_type" style="width:20rem; height:3rem; font-size:3rem;">
							<option value="name"	<%= (searchVO.getId_search_type().equals("name") ? "selected" : "") %>>이름</option>
							<option value="hp"		<%= (searchVO.getId_search_type().equals("hp") ? "selected" : "") %>>핸드폰번호</option>
							<option value="em"		<%= (searchVO.getId_search_type().equals("em") ? "selected" : "") %>>이메일</option>
						</select>
						<br>
						<input type="text" style="width:20rem; height:3rem; font-size:3rem;" id="str" name="str" value="" >
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