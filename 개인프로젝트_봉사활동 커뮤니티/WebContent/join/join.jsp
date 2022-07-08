<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<!-- -------------------콘텐츠 시작 ------------------------------------------------------------------------------------ -->
<script>
	var idDuplicated = false;  //id가 중복이 아니면
	
	window.onload = function()
	{
		$("#id").focus();
		
		$("#id").keyup(function(){
			idDuplicated = false;
			
			var id = $("#id").val();
			if(id == "")
			{
				$("#spanMsg").html("아이디를 입력하세요.");
				return;
			}
	
			$.ajax({
				type : "get",
				url: "idcheck.jsp?id=" + id,
				dataType: "html",
				success : function(data) 
				{
					data = data.trim();
					if(data == "001")
					{
						$("#msg").html("아이디 조회 오류입니다.");
					}
					if(data == "002")
					{
						$("#msg").html("중복된 아아디입니다.");
						$("#msg").css("color","red");
						IsDuplicated = true;
					}else
					{
						$("#msg").html("사용 가능한 아이디입니다.");
						$("#msg").css("color","blue");
					}					
				}
			});				
		});
	}
	
	function Submit()
	{
		if($("#id").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if($("#pw").val() == "")
		{
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		if($("#pw").val() != $("#pwcheck").val())
		{
			alert("비밀번호가 일치하지 않습니다.");
			$("#pw").focus();
			return;
		}	
		if($("#name").val() == "")
		{
			alert("이름을 입력하세요.");
			$("#name").focus();
			return;
		}
		$.ajax({
			type : "get",
			url : "capchaok.jsp",
			dataType : "html",
			success : function(capcha) //넘어온 capcha코드
			{
				capcha = capcha.trim();
				if($("#capcha").val() == capcha)
				{
					if(confirm("회원가입을 하시겠습니까?") != 1)
					{
						return;
					}
					$("#join").submit();
				}else
				{
					alert("자동 회원가입 방지 코드가 일치하지 않습니다.")
				}
			}
		});
		
	}
</script>
<td style="width:200px" valign="top"></td>
<td style="width:5px"></td>
<td>
	<form id="join" name="join" method="post" action="../join/joinok.jsp">
		<table border="0" style="width:100%">
			<tr>
				<td style="padding:10px 10px 20px 390px">
					<span style="font-weight:bold; color:#10457D;font-size:19px"><h4><u>회원가입</u></h4></span>
				</td>
			</tr>																		
		</table>
		<table style="width:60%;margin-left: auto; margin-right: auto;">
			<tr height="30">
				<td style="width:130px;">아이디 (*)</td>
				<td>
					<input type="text" id="id" name="id" style="width:50%">&nbsp&nbsp
					<span id="msg">아이디를 입력하세요.</span>
				</td>
			</tr>
			<tr height="30">
				<td>비밀번호 (*)</td>
				<td><input type="password" id="pw" name="pw" style="width:50%"></td>
			</tr>
			<tr height="30">
				<td>비밀번호 확인 (*)</td>
				<td><input type="password" id="pwcheck" name="pwcheck" style="width:50%"></td>
			</tr>			
			<tr height="30">
				<td>이름 (*)</td>
				<td><input type="text" id="name" name="name"  style="width:50%"></td>
			</tr>		
			<tr height="30">
				<td>성별 (*)</td>
				<td>
					<input type="radio" name="gender" value="M" checked>남자
					<input type="radio" name="gender" value="F">여자
				</td>
			</tr>		
			<tr height="50">
				<td>관심분야</td>
				<td>
					<input type="checkbox" value="1:동물보호" name="interest"  checked>동물보호
					<input type="checkbox" value="2:자연보호" name="interest">자연보호	
					<input type="checkbox" value="3:인권보호" name="interest">인권보호	
					<input type="checkbox" value="4:해외봉사" name="interest">해외봉사	
					<input type="checkbox" value="5:사회복지" name="interest">사회복지		
					<input type="checkbox" value="6:재해구호" name="interest">재해구호					
				</td>
			</tr>
			<tr height="30px"></tr>	
			<tr>
				<td width="150px">자동회원가입방지: </td>
				<td>
					<table border="0">
						<tr>
							<td>
								<img src="capcha.jsp">
							</td>
							<td>
								<input type="text" id="capcha" name="capcha" size="12">
							</td>
						<tr>
					</table>							
				</td>
			</tr>			
			<tr height="30px"></tr>	
			<tr>
				<td colspan="3" style="height:1px;background-color:#2B579A"></td>
			</tr>	
			<tr height="50">
				<td colspan="2" style="text-align:center;">
					<a id="joinbtn" href="javascript:Submit();" >가입완료</a>
					<a id="joinbtn" href="../main/index.jsp">취소</a>
				</td>							
			</tr>																															
		</table>
	</form>
<!-- ----------------------------------------------------------------------------------------------------------- -->
<%@ include file="../includes/tail.jsp" %>