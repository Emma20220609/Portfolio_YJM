<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<script>
	window.onload = function()
	{
		$("#title").focus();
	}
	
	function DoCheck()
	{
		if($("#title").val() == "")
		{
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if($("#region").val() == "")
		{
			alert("지역을 입력하세요.");
			$("#region").focus();
			return false;
		}	
		if($("#phone").val() == "")
		{
			alert("연락처을 입력하세요.");
			$("#phone").focus();
			return false;
		}	
		if($("#note").val() == "")
		{
			alert("내용을 입력하세요.");
			$("#note").focus();
			return false;
		}	
		if($("#p_start").val() == "")
		{
			alert("기간을 입력하세요.");
			$("#p_start").focus();
			return false;
		}	
		if($("#p_end").val() == "")
		{
			alert("기간을 입력하세요.");
			$("#p_end").focus();
			return false;
		}	
		if($("#p_end").val() <= $("#p_start").val())
		{
			alert("기간이 정확하지 않습니다");
			$("#p_end").focus();
			return false;
		}
		if(confirm("새로운 게시글을 저장하시겠습니까?") != 1)
		{
			return false;	
		}
	}
</script>

<%
	String kind = request.getParameter("kind");
	if(kind == null) kind = "L";
%>

<!-- ------------------ 콘텐츠 시작------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
		<div style="height:80px;"></div>
		<div class="submenu"><a href="../board/index.jsp">활동별 게시판</a></div>
		<div style="height:5px;"></div>
		<div class="submenu" ><a href="../board/loindex.jsp">지역별 게시판</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="padding:10px 10px 30px 30px">
				<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">글쓰기</span>
			</td>
		</tr>
	</table>		
	<form name="lowrite" method="post" action="../write/lowriteok.jsp" onsubmit="return DoCheck();" enctype="multipart/form-data">
		<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">제목</td>
				<td><input type="text" id="title" name="title" style="width:95%"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">지역</td>
				<td colspan=2 align="left">
					<script>
						function GetArea()
						{
							var provin = $("#provin").val();
							
							$.ajax({
								type : "GET",
								url: "../area/area.jsp?id=" + provin,
								dataType: "HTML",
								success : function(data) 
								{
									$("#area").html(data);
								},
							});				
						}
						
					</script>
					<select id="provin" name="provin" onchange="GetArea();">
						<option value="">::시도선택::</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
					</select>
					<select id="area"  name="area">
						<option value="">::시군선택::</option>
					</select>
					<input type="text" id="region" name="region" style="width:95%">
				</td>	
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">연락처</td>
				<td><input type="text" id="phone" name="phone" style="width:95%"></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">구분</td>
				<td>
					<select name="dboard">
						<option value= "A" <%= kind.equals("A") ? "selected" : "" %>>활동별 게시판 
						<option value= "L" <%= kind.equals("L") ? "selected" : "" %>>지역별 게시판		
					</select>
				</td>
			</tr>						
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">내용</td>
				<td><textarea id="note" name="note" style="width:95%; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">모집기간</td>
				<td>
					<input type="date" id="p_start" name="p_start" min="2022-04-04" max="2025-12-31">
					&nbsp;~&nbsp;
					<input type="date" id="p_end" name="p_end" min="2022-04-04" max="2025-12-31">
				</td>
			</tr>
			<tr>
				<td style="width:120px; text-align:center; background-color:#F2F4F5">첨부파일</td>
				<td><input id="attach" name="attach" type="file" style="width:95%"></td>
			</tr>
			<tr>
				<td colspan="2" style="height:1px;background-color:#2B579A"></td>
			</tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<div style="height:20px;"></div>
					<input id="loginbtn" type="submit" value="완료">
					<a id="loginbtn"  href="../board/loindex.jsp">취소</a>
					<div style="height:30px;"></div>
				</td>
			</tr>
		</table>			
	</form>	
	<!-- ----------------------------------------------------------------------------------------- -->
	<%@ include file="../includes/tail.jsp" %>