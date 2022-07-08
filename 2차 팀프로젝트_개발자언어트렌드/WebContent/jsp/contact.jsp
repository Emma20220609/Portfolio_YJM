<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- content	start ======================================== --%>
<div class="contents">
	<div class="card">
		<h2>Contact Us</h2>
<!-- 이메일 문의 폼 -->
		<table>
			<tr>
				<td style="width:200px" valign="top"></td>
				<td style="width:200px"></td>
				<td>
					<form name="contact" method="post" action="contactok.html" onsubmit="return DoCheck();">
						<table border="0" style="width:85%; margin:0px 0px 0px 0px;padding:0px 0px 0px 250px ; border: 1px;">
							<tr>
								<td style="width:120px; text-align:left; height:35px;">Name</td>
							</tr>
							<tr>
								<td><input type="text" name="title" style="width:500px; height:50px"></td>
							</tr>
							<tr>
								<td style="width:120px; text-align:left; height:35px;">Email Address</td>
							</tr>
							<tr>
								<td><input type="text" name="title" style="width:100%; height:50px"></td>
							</tr>
							<tr>
								<td style="width:120px; text-align:left;">Message</td>
							</tr>
							<tr>
								<td><textarea name="note" style="width:100%; height:200px;"></textarea></td>
							</tr>

							<tr>
								<td style="padding: 0px 0px 0px 210px;" colspan="2">
									<div style="height:30px;"></div>
									<input id="b" type="submit" value="문의하기">
									<div style="height:30px;"></div>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</div>
<%-- content	end ========================================== --%>