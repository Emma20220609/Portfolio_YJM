<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>      
<%
String filename = request.getParameter("file");
String orgname  = request.getParameter("name");
String uploadPath = "D:\\Moonyj\\exercise\\myboard2\\WebContent\\upload";
String fullname = uploadPath + "\\" + filename;

//out.print(fullname);

response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=" + orgname + "");   

File file = new File(fullname);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>