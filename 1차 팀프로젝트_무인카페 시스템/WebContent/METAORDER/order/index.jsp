<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="order_include/header.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

SearchVO searchVO = new SearchVO(request);
ListDTO  listDTO  = new ListDTO();
storeDTO stDto = new storeDTO();


%>
			<tr>
				<td width="125px">
					<a class="btn all menu" href="index.jsp">전체 메뉴</a>
				</td>
				<td colspan="3">
					<a href="mymenu.jsp">나만의 메뉴</a>
				</td>		
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr>
				<td width="150px">
					<a class="btn all menu" href="index.jsp">음료</a>
				</td>
				<td width="125px" colspan="3">
					<a href="index.jsp?kind=side">사이드 메뉴</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr>
				<td style="border-radius:10px;padding-top:10px;width:125px; height:80px">
					<a href="#"><img style="border-radius:10px;" width="125px"src="data:image/jpeg;base64,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"></a>
				</td>
				<td colspan="3">
					<a href="#">NEW</a>
				</td>
			</tr>
			<tr>
				<td style="width:125px; height:80px">
					<a href="#"><img style="border-radius:10px;" width="125px"src="data:image/jpeg;base64,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"></a>
				</td>
				<td colspan="3">
					<a href="#">추천</a>
				</td>
			</tr>
			<%
			//메뉴 리스트 VO DTO 생성
			productsDTO	dto = new productsDTO();
			productsVO	pro = null;
			//메뉴 리스트 생성
			dto.GetMenuList();
			//메뉴 리스트 갯수 산출
			int MAX = dto.GetTotal("menu");
			//메뉴 리스트 출력
			for(int i = 0 ; i < MAX ; i++ )
			{
				pro = dto.GetMenuItem(i);
				dto.GetProList(pro.hname());
				productsVO	proIMG = dto.GetProItem(0);
			%>
			
					<tr>
						<td style="width:125px; height:80px">
							<a href="view.jsp?hname=<%= pro.hname() %>">
							<img style="border-radius:10px; width:125px; height:125px;"
							 src="download.jsp?file=<%= proIMG.images().get(0).img_pname() %>&name=<%= proIMG.images().get(0).img_lname() %>">
							</a>
						</td>
						<td colspan="3">
							<a href="view.jsp?hname=<%= pro.hname() %>"><%= pro.hname() %><br><%= pro.ename() %></a>
						</td>
					</tr>			
			<%
			}
			%>
			<tr style="position: fixed;
						background-color: white; /*임의색상*/
						bottom: 0;
						height: 8rem;">
				<td width=100%	 >
				<%
				int stSize = stDto.GetStoreTotal();
				%>
					<select name="sel_store">
						<option value="">매장을 선택해주세요.</option>
						<%
						for(int i=0; i < stSize; i++)
						{
							storeVO stVo = stDto.GetStore(i);
							%><option id="st_no" value=""><%= stVo.getSt_name() %></option><%
						}
						%>
					</select>
				</td>
			</tr>
<%@ include file="order_include/footer.jsp" %>			