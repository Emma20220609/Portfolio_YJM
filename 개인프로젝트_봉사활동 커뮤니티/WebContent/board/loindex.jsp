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
	int curpage    = 0;  //���� ������ ��ȣ
	int startno    = 0;  //SQL limit �Խù� ���� ��ȣ
	int startBlock = 0;  //����¡ ���� �� ��ȣ
	int endBlock   = 0;  //����¡ �� �� ��ȣ
	
	//--------------- �Ѿ�°� �ޱ�-------------------------------------------
	String no          = request.getParameter("no");
	String kind        = request.getParameter("kind");
	String cpage       = request.getParameter("page");
	String search_key  = request.getParameter("search_key");
	String menu_provin = request.getParameter("provin");
	String menu_area   = request.getParameter("area");
	String pkind       = request.getParameter("pkind");
	
	if(kind == null)        kind        = "L";
	if(cpage == null)       cpage       = "1";
	if(search_key == null)  search_key  = "";
	if(menu_provin == null) menu_provin = "";
	if(menu_area == null)   menu_area   = "";
	if(pkind == null)       pkind       = "C";
	
	//(3) 
	if( request.getParameter("page") != null)
	{
		curpage = Integer.parseInt(request.getParameter("page"));
	}else
	{
		curpage = 1;
	}
	
%>

<!-- -------------------������ ����------------------------------------------------------------------------------------ -->
<td style="width:200px" valign="top">
	<div style="height:100px;"></div>
	<div class="submenu"><a href="../board/index.jsp?menu_kind='A'">Ȱ���� �Խ���</a></div>		
	<div style="height:5px;"></div>
	<div class="submenu" ><a href="../board/loindex.jsp?menu_kind='L'">������ �Խ���</a></div>
</td>
<td style="width:100px"></td>
<td>
	<table border="0" style="width:100%;">
		<tr>
			<td style="height:40px">
			<span style="font-weight:bold; color:#1D1FAB; font-size:20px;">������ �Խ���</span>
			</td>
		</tr>					
		<tr>
			<td>
				<form id="search" name="search" method="get" action="../board/loindex.jsp">
					<table border="0" style="width:88%; border-bottom: 1px solid grey">
						<tr>
							<td colspan=2 align="left">
								<select id="provin" name="provin" onchange="javascript:document.search.submit();">
									<option value="">::�õ�����::</option>
									<option value="����ϵ�" <%= menu_provin.equals("����ϵ�") ? "selected" : "" %>>����ϵ�</option>
									<option value="���󳲵�" <%= menu_provin.equals("���󳲵�") ? "selected" : "" %>>���󳲵�</option>
								</select>
								<select id="area"  name="area" onchange="javascript:document.search.submit();">
									<option value="">::�ñ�����::</option>
									<%
									if(menu_provin.equals("����ϵ�"))
									{
										%>
											<option value="���ֽ�" <%= menu_area.equals("���ֽ�") ? "selected" : "" %>>���ֽ�</option>	
											<option value="�����" <%= menu_area.equals("�����") ? "selected" : "" %>>�����</option>
											<option value="������" <%= menu_area.equals("������") ? "selected" : "" %>>������</option>	
											<option value="������" <%= menu_area.equals("������") ? "selected" : "" %>>������</option>	
											<option value="������" <%= menu_area.equals("������") ? "selected" : "" %>>������</option>	
											<option value="�ͻ��" <%= menu_area.equals("�ͻ��") ? "selected" : "" %>>�ͻ��</option>	
										<%
									}else if(menu_provin.equals("���󳲵�"))
									{
										%>
											<option value="������" <%= menu_area.equals("������") ? "selected" : "" %>>������</option>	
											<option value="�����" <%= menu_area.equals("�����") ? "selected" : "" %>>�����</option>
											<option value="������" <%= menu_area.equals("������") ? "selected" : "" %>>������</option>	
											<option value="��õ��" <%= menu_area.equals("��õ��") ? "selected" : "" %>>��õ��</option>	
											<option value="���ֽ�" <%= menu_area.equals("���ֽ�") ? "selected" : "" %>>���ֽ�</option>	
										<%
									}		
									%>
								</select>
							</td>
							<td colspan=5 align="right">
								<input type="text" size="10" id="search_key" name="search_key" value="<%= search_key %>">
								<a href="javascript:document.search.submit();">�˻�</a>
							</td>
						</tr>
						<tr height="10px"></tr>	
						<tr>
							<th style="background-color:#E8F2FE; width:60px; height:40px;">��ȣ</th>
							<th style="text-align:center; background-color:#E8F2FE; height:40px;">Ȱ����</th>
							<th style="background-color:#E8F2FE;width:120px; height:40px;">����</th>
							<th style="background-color:#E8F2FE;width:80px; height:40px;">�ۼ���</th>
							<th style="background-color:#E8F2FE;width:100px; height:40px;">�ۼ���</th>
							<th style="background-color:#E8F2FE;width:70px; height:40px;">�������</th>						
							<th style="background-color:#E8F2FE;width:70px; height:40px;">��ȸ��</th>	
						</tr>
						<%
							//where  ������ �ۼ��Ѵ�.
							String where = "";
							where += "where board_type = '" + kind + "' ";
							if(!search_key.equals("")) 
							{
								where += "and (board_title like '%" + search_key + "%' ";
								where += "or board_note like '%" + search_key + "%' ";
								where += "or board_province like '%" + search_key + "%' ";
								where += "or board_city like '%" + search_key + "%' ";
								where += "or board_loca like '%" + search_key + "%') ";
							}
							if(!menu_provin.equals("")) 
							{
								//�õ����� �˻�
								where += "and board_province = '"+menu_provin+"' ";					
							}
							if(!menu_area.equals("")) 
							{
								//�ñ����� �˻�
								where += "and board_city = '"+menu_area+"' ";					
							}
							
							//(4) 
							String sql = "";
							sql  = "select count(*) as count ";
							sql += "from board ";
							sql += where; 
							
							ResultSet result = stmt.executeQuery(sql);	
							result.next();
							total  = result.getInt("count");
							result.close();
							
							//(5)
							maxpage = total / 10;
							if( total % 10 != 0) maxpage++;
			
							sql  = "select board_no,board_type,board_title,board_loca,board_name,date(board_date) as board_date, ";
							sql += "board_proc,board_hit,board_province,board_city,board_start,board_end, ";
							sql += "datediff(board_start,curdate()) as startdate, ";
							sql += "datediff(board_end,curdate()) as enddate, ";
							sql += "(select count(comt_no) from comment where board_no = board.board_no) as comt_no "; 
							sql += "from board ";
							sql += where ;
							sql +="order by board_no desc ";
							
							//(2) 
							startno = (curpage - 1) * 10;
							//(1) 
							sql += "limit " + startno + ",10";	
							result = stmt.executeQuery(sql);	
							
							int seqno =  total - startno;
							
							while(result.next() == true)
							{
								String board_no   		= result.getString("board_no");
								String board_type 	 	= result.getString("board_type");
								String board_title		= result.getString("board_title");
								String board_loca  	 	= result.getString("board_loca");
								String board_name 		= result.getString("board_name");
								String board_date 		= result.getString("board_date");
								String board_proc 		= result.getString("board_proc");
								String board_hit   		= result.getString("board_hit");
								String board_province   = result.getString("board_province");
								String board_city       = result.getString("board_city");
								String board_start   	= result.getString("board_start");
								String board_end      	= result.getString("board_end");
								String comt_no      	= result.getString("comt_no");
								int startdate           = result.getInt("startdate");
								int enddate 			= result.getInt("enddate");
								
								//--------------- �˻��� ����� ǥ��-------------------------------------------
								if (!search_key.equals(""))
								{
									board_title = board_title.replace(search_key,"<font color=orange>" + search_key + "</font>");
								}
								%>
								<tr id="tr">
									<td id="td"><%= seqno-- %></td>
									<td>
										<a href="../view/loview.jsp?no=<%= board_no%>&page=<%= curpage %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %>&pkind=<%= pkind %>" style="font-weight:bold;"><%= board_title %></a>
										<%
											if(!comt_no.equals("0"))
											{
												%> 
												<span style="color:#ff6600">(<%= comt_no %>)</span>
												<%
											}
										%>
									</td>
									<td id="td"><%= board_province %> <%= board_city %></td>
									<td id="td"><%= board_name %></td>
									<td id="td"><%= board_date %>
									<%
									
										if(board_proc.equals("C")) //�ۼ������� ���� �����Ҷ�
									 	{
									 		%>
											<td style="text-align:center;background-color:#D55F64;font-weight:bold;">����</td>
											<%
										}else if(startdate <= 0 && enddate > 0)
										{
											%>
											<td  style="text-align:center;background-color:#63AFE5;font-weight:bold;">������</td>
											<%
										}else if(startdate > 0)
										{
											%>
											<td  style="text-align:center;background-color:orange;font-weight:bold;">��������</td>
											<%
										}else 
										{
											%>
											<td  style="text-align:center;background-color:#D55F64;font-weight:bold;">����</td>
											<%
										}
									%>
								<td id="td"><%= board_hit %></td>
							</tr>
							<%
						}
						//--------------- ��ȸ�� �ڷᰡ ������-------------------------------------------
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
				</form>	
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
					%><a href="../write/lowrite.jsp?kind=<%=kind%>" id="write">�۾���</a><%
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
					<a href="loindex.jsp?page=<%= startBlock - 1 %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %>">��</a> 
					<%
				}	
				//(9)
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						%>
							<a href="loindex.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> ">
								<span style="color:white;background-color:#0070C0;font-weight:bold;"><%= pageno %></span>
							</a> | 
						<%
					}else
					{
						%><a href="loindex.jsp?page=<%= pageno %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> "><%= pageno %></a> | <%
					}
					
				}	
				//(10)
				if(endBlock < maxpage)
				{
					%>
					<a href="loindex.jsp?page=<%= endBlock + 1 %>&kind=<%= kind %>&search_key=<%= search_key %>&provin=<%= menu_provin %>&area=<%= menu_area %> ">��</a> 
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