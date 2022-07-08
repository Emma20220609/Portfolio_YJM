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
	String no         	 = multi.getParameter("no"); 
	String cpage      	 = multi.getParameter("cpage");
	String kind   		 = multi.getParameter("kind");
	String search_key    = multi.getParameter("search_key");
	String province  	 = multi.getParameter("province");
	String search_area   = multi.getParameter("area");
	
	String title    	 = multi.getParameter("title");
	String region   	 = multi.getParameter("region");
	String phone    	 = multi.getParameter("phone");
	String board    	 = multi.getParameter("dboard");//�Խ��� ����
	String note     	 = multi.getParameter("note");
	String p_start  	 = multi.getParameter("p_start");
	String p_end    	 = multi.getParameter("p_end");
	String pkind     	 = multi.getParameter("pkind"); //��������
	String provin   	 = multi.getParameter("provin");
	String area      	 = multi.getParameter("area");
	
	//--------------- ������ ��ȿ���˻�-------------------------------------------
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
	
	//--------------- �α��� ���� ���� ������-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");

	//--------------- �Խù� ���� ����ǥ ����-------------------------------------------
	title  = title.replace("'","''");
	region = region.replace("'","''");
	note   = note.replace("'","''");
	
	//--------------- DB�� �Խù� ������Ʈ-------------------------------------------
	String sql="";
	sql  = "update  board ";
	sql += "set ";
	sql += "board_type = '"+ board +"', ";
	sql += "board_title = '"+ title +"', ";
	sql += "board_phone = '"+ phone +"', ";
	sql += "board_note = '"+ note +"', ";
	sql += "board_name = '"+ login_name +"', ";
	sql += "board_loca = '"+ region +"', ";
	sql += "board_province = '"+ provin +"', ";
	sql += "board_city = '"+ area +"', ";
	sql += "board_start = '"+ p_start +"', ";
	sql += "board_end = '"+ p_end +"', ";
	sql += "board_proc = '"+ pkind +"' ";
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
	
	// �ѱ� ó��
	String provin_encoded = URLEncoder.encode(province);
	String area_encoded   = URLEncoder.encode(search_area);
	String skey_encoded   = URLEncoder.encode(search_key);
	response.sendRedirect("../view/loview.jsp?no=" + no + "&kind=" + kind + "&page=" + cpage + "&provin=" + provin_encoded + "&area=" + area_encoded+ "&search_key=" + skey_encoded );	
%>
<%@ include file="../db/dbclose.jsp" %>