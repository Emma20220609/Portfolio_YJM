<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="meta.vo.*" %>    
<%@ page import="meta.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%
request.setCharacterEncoding("UTF-8");

SearchVO searchVO = new SearchVO(request);

String uploadPath = "Z:\\CTEAM\\upload";

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;
MultipartRequest multi =
	new MultipartRequest(request,uploadPath,size,
		"UTF-8",new DefaultFileRenamePolicy());

String title	= multi.getParameter("title");
String kind		= multi.getParameter("kind");
String note		= multi.getParameter("note");

System.out.println("title:" + title);
System.out.println("kind:" + kind);
System.out.println("note:" + note);

//======================== 데이터 유효성 검사 처리 ========
if( title == null || kind == null || note == null )
{
	response.sendRedirect("write.jsp");
	return;
}

if( title.equals("") || kind.equals("") || note.equals("") )
{
	response.sendRedirect("write.jsp");
	return;
}


//======================== 세션에서 로그인 정보를 가져온다. ========
//로그인 정보를 얻는다
accountVO loginVO = (accountVO)session.getAttribute("accountVO");
//======================== 게시물 자료 입력  처리 ========
boardVO vo = new boardVO();
vo.setno((loginVO.no()));
vo.setBoard_title(title);
vo.setBoard_kind(kind);
vo.setBoard_note(note);
System.out.println(vo);
//======================== 첨부파일 등록하기 ========
//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
ArrayList<attachVO> attachs = new ArrayList<attachVO>();
while( files.hasMoreElements() == true)
{
	attachVO attach = new attachVO();
	String fileid   = (String)files.nextElement();
	String filename = (String) multi.getFilesystemName(fileid);
	if(filename == null) continue;
	attach.setAttach(uploadPath, filename);	
	attachs.add(attach);
}	
vo.setAttachs(attachs);
BoardDTO dto = new BoardDTO();
dto.Insert(vo);

response.sendRedirect("view.jsp?no=" + vo.getBoard_no() + "&" + searchVO.GetPageLink(searchVO.getCurpage()));
%>
