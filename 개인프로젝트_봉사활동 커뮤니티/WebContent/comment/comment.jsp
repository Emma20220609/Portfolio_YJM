<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<table style="width:80%;">
		<tr>
			<td colspan="5" style="height:1px;background-color:#2B579A"></td>
		</tr>
		<tr>
		<td>
			※댓글※
		</td>
		</tr>
		<%
			if(login_id != null)
			{
				
				%>		
				<script>
					function checkComment()
					{
						if($("#comt_note").val() == "")
						{
							alert("내용을 입력하세요");
							$("#comt_note").focus();
							return;
						}
						$("#comment").submit();
					}
				</script>
				<form id="comment" name="comment" method = "post" action="../comment/commentok.jsp">
					<input type="hidden" name="board_no" value="<%= no %>">
					<input type="hidden" name="user_no" value="<%= user_no  %>">
					<input type="hidden" name="board_type" value="<%= board_type %>">
					<tr>
						<td><input type="text" id="comt_note" name="comt_note" style="width:95%"></td>
						<td width="110px" align="center"><%= login_name %></td>   <!-- 댓글 작성한 사람이름 -->
						<td width="110px" align="center"><input type="button" onclick="checkComment();" value="완료"></td>
					</tr>
				</form>
				<%
			}
			
			sql="select comt_no,comt_userno,comt_name,comt_note,date(comt_date) as comt_date ";
			sql += "from comment ";
			sql += "where board_no = '"+ no +"' ";
			sql += "order by comt_no desc ";
			result = stmt.executeQuery(sql);
			while(result.next() == true)
			{
				String comt_no      = result.getString("comt_no");
				String comt_userno  = result.getString("comt_userno");
				String comt_name    = result.getString("comt_name");
				String comt_note    = result.getString("comt_note");
				String comt_date    = result.getString("comt_date");
				%>
					<tr>
						<td><%=comt_note %></td>
						<td  width="110px" align="center"><%=comt_name %></td>
						<td  width="110px" align="center"><%=comt_date %></td>		
						<td>
							<%
								if(login_id != null)
								{
									if(login_autho.equals("A") || login_no.equals(comt_userno))
									{
										%>
										<a href="../comment/commentdel.jsp?no=<%= no %>&cno=<%= comt_no %>&type=<%= board_type %>".>[삭제]</a>
										<%
									}
								}
							%>
						</td>	
					</tr>
				<%
			}
			
		%>	
		<br>
		<br>
		<tr>
			<td colspan="5" style="height:1px;background-color:#2B579A"></td>
		</tr>
	</table>
</html>