<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="other_include/header.jsp" %>
<%
if( user == null ) 
{
	response.getWriter().print("<script>alert('로그인 후 이용 바랍니다.'); location.href = 'index.jsp';</script>");
	return;
}
%>

			<tr style="height:250px;">
				<td colspan="4" valign=top style="box-shadow: 5px 5px 5px 5px gray;">
					<div style="float:left"><a href="index.jsp"><img src="../img/back.png"></a></div>
					<h3>
						예치금충전
					</h3>
					<form id="deposit" name="deposit" action="depositok.jsp" >
					<p style="text-align:center"><%= user.name() %>님의 잔여 예치금은 <%= user.deposit() %> 원 입니다.</p>
					<p style="text-align:center">
						<select name="depochar">
							<option value="1000">1,000원</option>
							<option value="3000">3,000원</option>
							<option value="5000">5,000원</option>
							<option value="10000">10,000원</option>
							<option value="20000">20,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원</option>
						</select>
					을 충전 하시겠습니까?
					</p>
					<div style="position: relative; left: 200px; top: 50px;">
						<a href="javascript:deposit.submit();">충전하기</a>
					</div>
					</form>
				</td>
			</tr>
<%@ include file="other_include/footer.jsp" %>