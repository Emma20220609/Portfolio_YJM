<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="java.net.URLEncoder" %>  
<%@ include file="../db/dbopen.jsp" %>
<%
	//�ѱ� ó��
	request.setCharacterEncoding("euc-kr");
	
	//÷������ ������
	String uploadPath = "D:\\Moonyj\\exercise\\myboard2\\WebContent\\upload";

	//���ε尡 ������ �ִ� ���� ũ�⸦ ����
	int size = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());

	//--------------- ������ �ޱ�-------------------------------------------
	//hidden�� �Ѿ� �� ��
	String no          = multi.getParameter("no");
	String kind        = multi.getParameter("kind");
	String cpage       = multi.getParameter("page");
	String search_key  = multi.getParameter("search_key");
	
	String title       = multi.getParameter("title");
	String note        = multi.getParameter("note");
	
	//--------------- ������ ��ȿ���˻�-------------------------------------------
	if( title == null  || note == null)
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
	
	if( title.equals("") || note.equals("") )
	{
		response.sendRedirect("../main/index.jsp");	
		return;
	}
	
	//--------------- �α��� ���� ���� ������-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");

	//--------------- �Խù� ���� ����ǥ ����-------------------------------------------
	title  = title.replace("'","''");
	note   = note.replace("'","''");
	
	//--------------- DB�� �Խù� ������Ʈ-------------------------------------------
	String sql="";
	sql = "update  board ";
	sql += "set ";
	sql += "board_title = '"+ title +"', ";
	sql += "board_note = '"+ note +"', ";
	sql += "board_name = '"+ login_name +"' ";
	sql += "where board_no = " + no ;
	System.out.println(sql);
	stmt.executeUpdate(sql);
	
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
		sql += "values ('" + no + "','" + phyname + "','" + filename + "')";
		System.out.println(sql);
		stmt.executeUpdate(sql);	
	}	
	
	//search_key �ѱ�
	String skey_encoded   = URLEncoder.encode(search_key);
	response.sendRedirect("../view/noview.jsp?no=" + no + "&kind=" + kind + "&page=" + cpage + "&search_key=" + skey_encoded);	
%>
<%@ include file="../db/dbclose.jsp" %>