<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="java.net.URLEncoder" %>  
<%@ include file="../db/dbopen.jsp" %>
<%
	//한글 처리
	request.setCharacterEncoding("euc-kr");
	
	//첨부파일 저장경로
	String uploadPath = "D:\\Moonyj\\exercise\\myboard2\\WebContent\\upload";

	//업로드가 가능한 최대 파일 크기를 지정
	int size = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());

	//--------------- 데이터 받기-------------------------------------------
	//hidden을 넘어 온 값
	String no          = multi.getParameter("no");
	String kind        = multi.getParameter("kind");
	String cpage       = multi.getParameter("page");
	String search_key  = multi.getParameter("search_key");
	
	String title       = multi.getParameter("title");
	String note        = multi.getParameter("note");
	
	//--------------- 데이터 유효성검사-------------------------------------------
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
	
	//--------------- 로그인 세션 정보 가져옴-------------------------------------------
	String login_id    = (String)session.getAttribute("id");
	String login_no    = (String)session.getAttribute("user_no");
	String login_name  = (String)session.getAttribute("user_name");
	String login_autho = (String)session.getAttribute("user_autho");

	//--------------- 게시물 작은 따옴표 에러-------------------------------------------
	title  = title.replace("'","''");
	note   = note.replace("'","''");
	
	//--------------- DB게 게시물 업데이트-------------------------------------------
	String sql="";
	sql = "update  board ";
	sql += "set ";
	sql += "board_title = '"+ title +"', ";
	sql += "board_note = '"+ note +"', ";
	sql += "board_name = '"+ login_name +"' ";
	sql += "where board_no = " + no ;
	System.out.println(sql);
	stmt.executeUpdate(sql);
	
	//--------------- 첨부파일 등록-------------------------------------------
	Enumeration files = multi.getFileNames();  //업로드된 파일명을 얻는다.
	
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
		System.out.println("논리파일명 : " + filename + "<br>");
		System.out.println("물리파일명 : " + phyname + "<br>");
		
		//데이터베이스에 첨부파일을 저장한다
		sql  = "insert into attach (board_no,attach_pname,attach_lname) ";
		sql += "values ('" + no + "','" + phyname + "','" + filename + "')";
		System.out.println(sql);
		stmt.executeUpdate(sql);	
	}	
	
	//search_key 한글
	String skey_encoded   = URLEncoder.encode(search_key);
	response.sendRedirect("../view/noview.jsp?no=" + no + "&kind=" + kind + "&page=" + cpage + "&search_key=" + skey_encoded);	
%>
<%@ include file="../db/dbclose.jsp" %>