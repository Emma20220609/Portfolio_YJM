<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../includes/head.jsp" %>
<%@ include file="../db/dbopen.jsp" %>
<%
	//�ѱ�ó��
	request.setCharacterEncoding("euc-kr");

//--------------- ����¡ ���� ����-------------------------------------------
	int total      = 0;  //��ü �Խù� ����
	int maxpage    = 0;  //�ִ� ������ ����
	int curpage    = 1;  //���� ������ ��ȣ
	int startno    = 0;  //SQL limit ���� ��ȣ
	int startBlock = 0;  //����¡ ���� �� ��ȣ
	int endBlock   = 0;  //����¡ �� �� ��ȣ
	
//--------------- �Ѿ�°� �ޱ�-------------------------------------------
	String no          = request.getParameter("no");	//view���� �Ѿ�� ��   
	String kind        = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	
	if(kind == null)       kind       = "Q";
	if(cpage == null)      cpage      = "1";
	if(search_key == null) search_key = "";
	
	//(3)
	if( request.getParameter("page") != null)
	{
		//�Ѿ�� page ���� ������ curpage �� ��ȯ�Ѵ�. 
		curpage = Integer.parseInt(request.getParameter("page"));
	}else
	{
		//�Ѿ�� page ���� �����Ƿ� ���� ������ ��ȣ�� 1�� �����Ѵ�. 
		curpage = 1;
	}
%>
<!-- ------------------ ������ ����------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:100px;"></div>
	<div class="submenu"><a href="../board/qna.jsp">������ �亯</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="height:40px">
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">������ �亯</span>
			</td>
		</tr>
		<tr height="30px"></tr>
		<tr>
			<td><div style="border: 1px solid #B7B7B7; width:80%; height:100px; padding:30px 10px 0px 50px; font-size: 14px" >
				��&nbsp;&nbsp;<i><b>�� ������ �ñ��� ������ ���Ǹ� �ϴ� �� �Դϴ�.</b></i><br>
				��&nbsp;&nbsp;<i><b>ã���ô� ������ �������, "Contact"���������� ���� ���ֽñ�ٶ��ϴ�.</b></i><br>
				��&nbsp;&nbsp;<i><b>�������亯�� ���þ��ų� ������ ���� �ʴ� ������ �Խù��� ���� ���� �����Ǵ� ���� �����Ͻñ� �ٶ��ϴ�.</b></i>
			</div></td>
		</tr>	
		<tr height="25px"></tr>					
		<tr>
			<td>
				<table border="0" style="width:85%; border-bottom: 1px solid grey">
					<tr>
						<td colspan=6 align="right">
							<form id="search" name="search" method="get" action="../board/qna.jsp">
								<input type="text" size="10" id="search_key" name="search_key" value="<%= search_key %>">
								<a href="javascript:document.search.submit();">�˻�</a>
							</form>
						</td>
					</tr>
					<tr height="10px"></tr>	
					<tr>
						<th id="td" style="background-color:#E8F2FE; width: 60px;">��ȣ</th>
						<th id="td" style="background-color:#E8F2FE;">����</th>
						<th id="td" style="background-color:#E8F2FE;width: 100px;">�ۼ���</th>
						<th id="td" style="background-color:#E8F2FE;width: 100px;">�ۼ���</th>					
						<th id="td" style="background-color:#E8F2FE;width: 80px;">��ȸ��</th>	
					</tr>
					<%
					//where  ������ �ۼ��Ѵ�.
						String where = "";
						where += "where board_type = '" + kind + "' ";
						if(!search_key.equals("")) //������� ������
						{
							//���� + ���뿡�� �˻�
							where += "and (board_title like '%" + search_key + "%' ";
							where += "or board_note like '%" + search_key + "%') ";
						}
							
						//(4)�Խù��� ������ ��´�. (100��)
						String sql = "";
						sql += "select count(*) as count ";
						sql += "from board ";
						sql += where; 
						
						ResultSet result = stmt.executeQuery(sql);
						result.next();
						total = result.getInt("count");
						result.close();
						
						//(5)�ִ� ������ ������ ����Ѵ�.
						maxpage = total / 10;
						if( total % 10 != 0) maxpage++;
					
						sql  = "select board_no,board_type,board_title,board_name,date(board_date) as board_date,board_hit, ";
						sql += "(select count(comt_no) from comment where board_no = board.board_no) as comt_no "; 
						sql += "from board ";
						sql += where ;
						sql +="order by board_no desc ";
						//(2) SQL��  limit ���� ��ȣ�� ����Ѵ�. (1 based ������)
						startno = (curpage - 1) * 10;
						
						//(1) �������� 10���� ���������� limit �� ó���Ѵ�.
						sql += "limit " + startno + ",10";
						result = stmt.executeQuery(sql);
						int seqno = total - startno;
						
						while(result.next() == true)
						{
							String board_no   		= result.getString("board_no");
							String board_type 	 	= result.getString("board_type");
							String board_title		= result.getString("board_title");
							String board_name 		= result.getString("board_name");
							String board_date 		= result.getString("board_date");
							String board_hit   		= result.getString("board_hit");
							String comt_no   		= result.getString("comt_no");
							
							//--------------- �˻��� ����� ǥ��-------------------------------------------
							if (!search_key.equals(""))
							{
								board_title = board_title.replace(search_key,"<font color=orange>" + search_key + "</font>");
							}
							%>
							<tr id="tr">
								<td id="td"><%= seqno-- %></td>
								<td>
									<a href="../view/qnaview.jsp?no=<%= board_no%>&page=<%= curpage%>&kind=<%= kind%>&search_key=<%= search_key%>" style="font-weight:bold;"><%= board_title %></a>
									<%
										if(!comt_no.equals("0"))
										{
											%> 
											<span style="color:#ff6600">(<%= comt_no %>)</span>
											<%
										}
									%>
								</td>
								<td id="td"><%= board_name %></td>
								<td id="td"><%= board_date %></td>
								<td id="td"><%= board_hit %></td>
							</tr>
							<%
						}
						if(total == 0)
						{
							%>
							<tr>
								<td colspan="7" style="background-color:#f4f4f4;height:100px;text-align:center;">
									��ȸ�� �ڷᰡ �����ϴ�.
								</td>						
							</tr>					
							<%
						}				
						%>
				</table>	
			</td>
		</tr>
		<tr height="10px"></tr>	
		<tr>
			<td style="height:25px; text-align:left;">
			<%
				if(login_id == null)
				{
					%><a href="javascript:alert('�α��� �ؾ� �۾��Ⱑ �����մϴ�.');" id="write">�۾���</a><%
				}else
				{
					%><a href="../write/qnawrite.jsp" id="write">�۾���</a><%
				}
			%>
				
			</td>
		</tr>	
		<tr height="30px"></tr>	
		<tr>
		<td style="text-align:center;">
			<%
				//(7)
				startBlock = ( (curpage - 1)  / 10) * 10 + 1; 
				endBlock   = startBlock + 10 - 1; 
				
				//(8)
				if( endBlock > maxpage)
				{
					endBlock = maxpage;
				}
				
				//(11)
				if(startBlock != 1)
				{
					%>
					<a href="qna.jsp?page=<%= startBlock - 1 %>&kind=<%= kind %>&search_key=<%= search_key %> ">��</a> 
					<%
				}	
				
				//(9)
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						%>
							<a href="qna.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %> ">
								<span style="color:white;background-color:#0070C0;font-weight:bold;"><%= pageno %></span>
							</a> | 
						<%
					}else
					{
						%><a href="qna.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %> "><%= pageno %></a> | <%
					}
					
				}	
				
				//(10)
				if(endBlock < maxpage)
				{
					%>
					<a href="qna.jsp?page=<%= endBlock + 1 %>&kind=<%= kind %>&search_key=<%= search_key %> ">��</a> 
					<%
				}	
			%>
			</td>
		</tr>
		<tr height="25px"></tr>		
	</table>
<!-- ----------------------------------------------------------------------------------------- -->
<%@ include file="../db/dbclose.jsp" %>
<%@ include file="../includes/tail.jsp" %>