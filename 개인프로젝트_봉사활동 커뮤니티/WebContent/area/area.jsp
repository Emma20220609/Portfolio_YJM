<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String provin = request.getParameter("id");
	if(provin == null) provin = "";
	String area = request.getParameter("area");
	if(provin == null) provin = "";
	
	if(provin.equals("����ϵ�"))
	{
		%>
		<select id="area">
			<option value="">::�ñ�����::</option>
			<option value="���ֽ�">���ֽ�</option>	
			<option value="�����">�����</option>
			<option value="������">������</option>	
			<option value="������">������</option>	
			<option value="������">������</option>	
			<option value="�ͻ��">�ͻ��</option>	
		</select>
		<%
	}else if(provin.equals("���󳲵�"))
	{
		%>
		<select id="area">
			<option value="">::�ñ�����::</option>
			<option value="������" >������</option>	
			<option value="�����" >�����</option>
			<option value="������" >������</option>	
			<option value="��õ��" >��õ��</option>	
			<option value="���ֽ�" >���ֽ�</option>	
		</select>
		<%
	}else
	{
		%>
		<select id="area">
			<option value="">::�ñ�����::</option>
		</select>
		<%	
	}
%>