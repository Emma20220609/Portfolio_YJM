<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ include file="../include/head3.jsp" %>
<%
SearchVO searchVO = new SearchVO(request);
String no = request.getParameter("no");

if( no == null || no.equals(""))
{
	%>
	<script>
		window.onload = function()
		{
			alert("올바른 게시물 정보가 아닙니다.");
			document.location = "index.jsp";
		}
	</script>
	<%
	return;
}
//======================== 게시물 자료를 조회한다. ======== 
int bno = Integer.parseInt(no);
BoardDTO dto = new BoardDTO();
boardVO  vo  = dto.Read(bno, false);
%>
<!--Container-->
	<div id="container">

		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K04.png" alt="contact"></p>
			<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> Contact<span class="arr"></span>공지사항</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">공지사항</h2>

			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">공지사항</h3>

					<!-- 공지사항 테이블 -->
				<form id="writefrm"  name="writefrm" method="post" action="../board/modifyok.jsp?" onsubmit="return DoModify();"
							enctype="multipart/form-data">
					<input type="hidden" name="no" value="<%=  no %>">
					<table class="board-list" border="1" id="notice" align="center"; width="800px";>
						<tr>
							<td style="width:120px; text-align:center; ">제목</td>
							<td><input type="text" id="title" name="title" style="width:95%" value="<%= vo.getBoard_title() %>"></td>
						</tr>
						<tr>
							<td style="width:120px; text-align:center; ">구분</td>
							<td>
								<select id="kind" id="kind" name="kind">
									<option value="01"<%= searchVO.getType().equals("01") ? "selected" : "" %> >공지사항</option>
									<option value="02"<%= searchVO.getType().equals("02") ? "selected" : "" %>  >이벤트</option>
									<option value="03"<%= searchVO.getType().equals("03") ? "selected" : "" %>  >설문조사</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:120px; text-align:center; ">내용</td>
							<td><textarea id="note" name="note"  style="width:95%; height:200px;  "><%=vo.getBoard_note() %></textarea></td>
						</tr>
						<%
						if(vo.getAttachs()!=null)
						{
							for(attachVO attach : vo.getAttachs())
							{
						%>
						<tr>
							<td style="width:120px; text-align:center; background-color:#f4f4f4">첨부파일</td>
							<td>
								<a href="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>"><%= attach.getAtt_lname() %></a><br>
								<img src="download.jsp?file=<%= attach.getAtt_pname() %>&name=<%= attach.getAtt_lname() %>">
							</td>
						</tr>	
						<%
							}
						}
						%>
						<tr>
							<td style="width:120px; text-align:center; ">첨부파일</td>
							<td><input id="attach1" name="attach1" type="file" style="width:95%"></td>
						</tr>
						<tr>
							<td style="width:120px; text-align:center; ">첨부파일</td>
							<td><input id="attach2" name="attach2" type="file" style="width:95%"></td>
						</tr>
						<tr>
							<td style="width:120px; text-align:center; ">첨부파일</td>
							<td><input id="attach3" name="attach3" type="file" style="width:95%"></td>
						</tr>
						
						<tr>
							<td colspan="2" style="height:1px;background-color:#BEC9DF;"></td>
						</tr>
						<tr>
							<td style="text-align:center;" colspan="2">
								<input type="submit" id="submit" value="수정완료 " class="btn-normal-s">
								<input type="button" onclick="javascript:document.location='bindex.jsp';" id="submit" value="취소"class="btn-normal-s">
							</td>
						</tr>
					</table>
				</form>	

					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->
<script>

var oEditors = [];


	window.onload = function()
	{
		document.writefrm.title.focus();
		//$("#title").focus();




		nhn.husky.EZCreator.createInIFrame

		({
			oAppRef: oEditors,
			elPlaceHolder: "note",
			sSkinURI: "../smarteditor2/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: { fOnBeforeUnload : function(){}}
		});

	}

	function DoModify()
	{
		if($("#title").val() == "")
		{
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		/*
		if($("#note").val() == "")
		{
			alert("내용을 입력하세요.");
			$("#note").focus();
			return false;
		}
		*/
		if(confirm("변경된 게시글을 저장하시겠습니까?") != 1)
		{
			return false;
		}

		oEditors.getById["note"].exec("UPDATE_CONTENTS_FIELD", []);

		submit();
	}

</script>



<%@ include file="../include/tail.jsp" %>