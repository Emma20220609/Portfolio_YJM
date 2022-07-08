<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.util.*" %>
<%
//한글 처리
request.setCharacterEncoding("UTF-8");
//======================== 앞단의 데이터 받기 ========

String id		= request.getParameter("userid");
String pw		= request.getParameter("userpw");
String name		= request.getParameter("name");
String mobile1	= request.getParameter("mobile1");
String mobile2	= request.getParameter("mobile2");
String mobile3	= request.getParameter("mobile3");
String email	= request.getParameter("email");

System.out.println(id);
System.out.println(pw);
System.out.println(name);
System.out.println(mobile1);
System.out.println(mobile2);
System.out.println(mobile3);
System.out.println(email);

String type		= "id";

//======================== 데이터 유효성 검사 처리 ========
if( id == null || pw == null || name == null
	|| mobile1 == null ||mobile2 == null || mobile3 == null ||email == null)
{

	out.println("ERROR");
	response.sendRedirect("../index.jsp");
	return;
}

if( id.equals("") || pw.equals("") || name.equals("")
		|| mobile1.equals("") || mobile2.equals("") ||mobile3.equals("") ||email.equals(""))
{
	out.println("ERROR");
	response.sendRedirect("../index.jsp");
	return;
}

//======================== 중복된 ID검사 처리 ========
accountDTO dto = new accountDTO();
//int code = dto.IsDuplicate(id, type);
//System.out.println(code);
if(dto.IsDuplicate(id, type) == accountDTO.DUPLICATE)
{
	%>
	<script>
		window.onload = function()
		{
			alert("중복된 아이디로 가입된 회원정보가 있습니다.");
			document.location = "join.jsp";
		}
	</script>
	<%
		return;
		}

		//out.print(id);

		//======================== 회원정보 입력  처리 ========
		//u_fno생성
		TempKey	temp	= new TempKey();
		String	u_fno	= temp.memberKey();
		String	hp_str	= mobile1+mobile2+mobile3;
		//회원가입용 메소드 고유번호, 아이디, 비번, 0:회원, 이름, 전화번호, 이메일 
		accountVO NewVO = new accountVO(u_fno,id,pw,"0",name,hp_str,email);

		if(dto.Create(NewVO))
		{
			System.out.println("계정이 생성되었습니다.");
			accountVO vo = dto.Login(NewVO);
			if(vo!=null) { vo.info("계정생성확인"); }
		}

		/*
		accountVO user = new accountVO();
		user.setU_id(id);
		user.setU_pw(pw);
		user.setU_name(name);
		user.setU_hp(mobile1+mobile2+mobile3);
		user.setU_em(email);
		user.setU_fno(u_fno);

		dto.Insert(user);*/
	%>

<script>
	window.onload = function()
	{
		alert("회원가입이 완료되었습니다.");
		document.location = "../index.jsp";
	}
</script>