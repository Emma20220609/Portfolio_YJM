<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<script>

	function ValidCheckForm()
	{
		var mReturnFlag = true;
		$("input[must]").each(function()
		{
			if( $(this).attr("must") != "")
			{
				if( $(this).val() == "")
				{
					alert($(this).attr("must"));
					$(this).focus();
					mReturnFlag = false;
					return false;
				}
			}
		});	
		return mReturnFlag;
	}
	
	function DoSubmit()
	{
		if( ValidCheckForm() == false) return;
		alert("자료를 전송합니다.");
	}
</script>
<form id="MyForm" name="MyForm">
	<input must="이름을 입력하세요.!!!!!!!!" type="text" id="aa1" name="bb1"><br>
	<input must="전화번호를 입력하세요.?????????" type="text" id="aa2" name="bb2"><br>
	<input type="text" id="aa3" name="bb3"><br>
	<input type="text" id="aa4" name="bb4"><br>
	<input type="text" id="aa5" name="bb5"><br>
	<input type="text" id="aa6" name="bb6"><br>
	<input type="text" id="aa7" name="bb7"><br>
	<input type="text" id="aa8" name="bb8"><br>
	<input msg="메일주소를 입력하세요.?????????" type="text" id="aa9" name="bb9"><br>
</form>
<a href="javascript:DoSubmit();">전송</a>
<%@ include file="includes/tail.jsp" %>
