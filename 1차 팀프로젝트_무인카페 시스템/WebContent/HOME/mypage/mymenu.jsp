<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head3.jsp" %>
<%@ page import="meta.vo.*" %>
<%@ page import="meta.dto.*" %>
<%@ page import="meta.util.*" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("UTF-8");

String  fav_menu	= request.getParameter("fav_menu");
String [] fav_ary	= fav_menu.split(",");

%>
<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K05.png" alt="MENU"></p>
			<p class="page_path"><a href="/">HOME</a><span class="arr"></span> Members<span class="arr"></span>마이페이지</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">마이페이지</h2>
			
			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">마이페이지</h3>

					<!--마이페이지 -->
						<div class="myp">
							<p><%=userid  %>님 환영합니다</p>
							
						</div>
						
						<h1 class="myps"></h1>
						<p align="center">고객님이 선호하는 메뉴</p>
						<table class="boardhan"align="center" border="1" style="width:70%;" class="myinfo">
							<script>
							$(function(){ 
								
								$("#ckall").click(function(){  
									if($("#ckall").prop("checked"))
										{ 
											$("input[type=checkbox]").prop("checked",true); 
										 } 
									else 
									{ 
										$("input[type=checkbox]").prop("checked",false); 
									} 
								})
								
								$("#delete").click(function(){
							        if(confirm("삭제하시겠습니까?")){
							        	var v= "";
							            $("input[name=chkno]:checked").each(function(){
							                var tr_value =$(this).val();
							                if(v != "")
							                {
							                	v += ",";
							                	
							                }	
							                v+= tr_value;
							                
							               
							            });
							        }
							        alert(v);
							        document.location= "delete.jsp?no="+v;
							    });
							});
							
							
							
							
							</script>
							
							
							
							
							<tr>
								<td class=myinfos style="width:70px; height:20px;" >이미지</td>
								<td style="width:100px;">메뉴명 </td>
								<td class=myinfos style="width:70px; height:20px;">금액</td>
								<td style="width:30px; text-align:center;">선택
								<input type="checkbox" id="ckall" name="ckall"></td>
								
							</tr>
							<%
							for(String item : fav_ary)
							{
								//out.print("아이템:"+item + "<br>");
								
								String [] fav = item.split("#");
								
								//System.out.println("제품이름:" + fav[0] + "<br>");
								//System.out.println("제품가격:" + fav[1] + "<br>");
								%>
								<tr>
									<td class=myinfos style="width:70px;"><span class="img-w50"><img src="../image/food/americano222.png" alt=""></span></td>								
						 				
										<td style="width:100px;"><%=fav[0] %></td>
										<td class=myinfos style="width:70px;"><%=fav[1] %>원</td>
										<td style="text-align:center;"><input type="checkbox" id="ckall" name="ckall" value=""></td>
								</tr>								
								<%
								
							}							
							%>
						
						</table>
						<div class="btnCommon type2">
							<a href="../nav/menu.jsp" class="btnBlack">뒤로가기</a>
							<a href="#none"  name="delete" id="delete" class="btnGray" >메뉴삭제</a>
	   					</div>
					
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>