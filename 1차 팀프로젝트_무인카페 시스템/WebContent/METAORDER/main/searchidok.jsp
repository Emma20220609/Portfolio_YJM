<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_include/header.jsp" %>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

String str	= request.getParameter("str");
String type	= request.getParameter("id_search_type");

System.out.println(str);
System.out.println(type);

accountDTO dto = new accountDTO();
accountVO vo = new accountVO();
accountVO search = dto.Searchid(str, type);




if(str == null ||str.equals("") || type == null ||type.equals(""))
{
	response.sendRedirect("searchid.jsp");
	return;
}


%> 
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
					<h3>
					<%
					if(search == null)
					{
						%>일치하는 아이디가 없습니다!<%
					}else
					{
						%>회원님의 아이디는 <%= search.id() %> 입니다!<%
					}
					%>
					</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px; height:1px;background-color:#A6A6A6"></td>
			</tr>
			<tr>
				<td colspan="3" align=center height=100px; style="width:100px; " >
					<div><a class="btn next" href="index.jsp">확인</a></div>
				</td>
			</tr>
		</table>
	</body>
</html>