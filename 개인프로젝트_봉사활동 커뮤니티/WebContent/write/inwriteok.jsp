<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>   
<%@ include file="../db/dbopen.jsp" %>
<%
	//--------------- ÷������ ó��-------------------------------------------
	//÷������ ������
	String uploadPath = "D:\\Moonyj\\exercise\\myboard2\\WebContent\\upload";

	//���ε尡 ������ �ִ� ���� ũ�⸦ ����
	int size = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());


	//---------------������ �ޱ�-------------------------------------------
	String title    = multi.getParameter("title");
	String region   = multi.getParameter("region");
	String phone    = multi.getParameter("phone");
	String board    = multi.getParameter("dboard");
	String note     = multi.getParameter("note");
	String p_start  = multi.getParameter("p_start");
	String p_end    = multi.getParameter("p_end");
	String provin   = multi.getParameter("provin");
	String area     = multi.getParameter("area");
	
	//--------------- ������ ��ȿ�� �˻�-------------------------------------------
	if( title == null || region == null || phone == null || board == null || note == null || p_start == null || p_end == null || provin == null || area == null )
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
	
	if( title.equals("") || region.equals("") || phone.equals("") || note.equals("") || p_start.equals("") || p_end.equals("") || provin.equals("") || area.equals(""))
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
	
	//--------------- �α��� �������� ��������-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");

	//--------------- �Խù� ���� ����ǥ ����-------------------------------------------
	title  = title.replace("'","''");
	region = region.replace("'","''");
	note   = note.replace("'","''");

	//--------------- DB�� �Խù� �ֱ�-------------------------------------------
	String sql="";
	sql = "insert into board (user_no,board_type,board_title,board_phone,board_note,board_name,board_loca,board_start,board_end,board_province,board_city) ";
	sql += "values ('"+ login_no +"','"+ board +"','"+ title +"','"+ phone +"','"+ note +"','"+ login_name +"','"+ region +"','"+ p_start +"','"+ p_end +"','"+ provin +"','"+ area +"') ";
	System.out.println(sql);
	stmt.executeUpdate(sql);

	//--------------- �Էµ� �Խù� ��ȣ ���-------------------------------------------
	sql = "select last_insert_id() as no ";
	ResultSet result = stmt.executeQuery(sql);
	result.next();
	String bno = result.getString("no");
	System.out.println("��ϵ� �Խù� ��ȣ : " + bno + "<br>");
	
	//--------------- ÷������ ���-------------------------------------------
	Enumeration files = multi.getFileNames();  //���ε�� ���ϸ��� ��´�.
	
	while( files.hasMoreElements() == true)
	{
		String fileid   = (String)files.nextElement();
		String filename = (String) multi.getFilesystemName(fileid);
		
		if(filename == null) continue;

		String phyname    = UUID.randomUUID().toString();
		String srcName    = uploadPath + "/" + filename;
		String targetName = uploadPath + "/" + phyname;
		File srcFile      = new File(srcName);
		File targetFile   = new File(targetName);
		srcFile.renameTo(targetFile);
		
		System.out.println("ID : " + fileid + "<br>");
		System.out.println("�����ϸ� : " + filename + "<br>");
		System.out.println("�������ϸ� : " + phyname + "<br>");
		
		//�����ͺ��̽��� ÷�������� �����Ѵ�
		sql  = "insert into attach (board_no,attach_pname,attach_lname) ";
		sql += "values ('" + bno + "','" + phyname + "','" + filename + "')";
		System.out.println(sql);
		stmt.executeUpdate(sql);	
	}	
	
	response.sendRedirect("../view/inview.jsp?no=" + bno);	
%>
<%@ include file="../db/dbclose.jsp" %>