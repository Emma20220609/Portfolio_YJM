<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/head.jsp" %>
	
<!--Container-->
	<div id="container">

		<!-- Visual -->
		<div class="mv_wrap">
			<div class="mv">
			<div class="itema" style="background-image:url('image/wall.jpg');"></div>
		</div>


		</div><!-- END Visual -->
	


		<!-- Outer -->
		<div class="mv">
			<h2 class="m_tit">CREATING A NEW CULTURE</h2>
			<div class="m_mid">
				<div class="item">
					<p class="stit">세상에 없었던 카페</p>
					<span class="vline"></span>
					<p class="desc">프랑스의 최고급 커피 메오와 이태리 페레날레 두 개의 커피빈을 수입하여 기존의 벤딩머신과는 차원이 다른 커피의 맛을 느낄 수 있습니다.</p>

				</div>
				<div class="item">
					<p class="stit">무인시스템 운영</p>
					<span class="vline"></span>
					<p class="desc">터치카페는 100% 무인시스템으로 운영됩니다.<br>세콤으로 cctv 및 보안시스템을 갖추었고, 전기 전원은 사용자에 맞게 시간을 설정하여 자동으로 운영할 수 있습니다.</p>

					
				</div>
				<div class="item">
					<p class="stit">위생적인 카페</p>
					<span class="vline"></span>
					<p class="desc">커피벤딩머신샵의 가장 취약점으로 알려진 위생 부분은 걱정하실 필요가 전혀 없습니다.<br>터치카페는 세스코에 가입하여 꼼꼼히 관리되고 있습니다.</p>

					
				</div>
			</div>
<script type="text/javascript">
	
	jQuery(document).ready(function($){
		$(".b_customer").slick({
			arrows:false,
			dots:true,
			autoplay:true
		});
	});
	
</script>			
			
			<div class="outer brand_cus">
				<h3 class="sec_tit">Customer</h3>
				<p class="sec_desc">지금 소비자들이 원하는 ‘새로운 트렌드’</p>
				<ul class="b_customer">
					<li><img src="image/coffee_meo.jpg" alt="">
						<em>21.5인치 Full HD<br>터치 스크린의 편의성</em>
					</li>
					<li><img src="image/coffee_perlanera.jpg" alt="">
						<em>합리적 가격으로 즐기는<br>최상의 커피 맛</em>
					</li>
					<li><img src="image/coffee_regilait.jpg" alt="">
						<em>간편한<br>카드 결제 시스템</em>
					</li>
					
				</ul>
			</div>
		</div><!-- END Outer -->
	</div><!--END Container-->
  <!-- 우측 문의 퀵배너 -->

	<form name="quick_online" method="post" action="quick/quick_onlineok.jsp">
		<div class="quickBox">
			<p class="quick_name">창업상담</p>
			<p class="quick_tell">1588-1234</p>

			<div class="quick_info">
				<input type="text" placeholder="성함" name="name">
				<input type="text" placeholder="연락처" name="data1" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength='11'>
				<input type="text" placeholder="이메일" name="email">
			</div>
			<!-- 
			<div class="quick_selectBox">
				<select name="sido" id="" onchange="call_gugn(this.value)">
					<option value="">도/시</option>
											<option value="강원도">강원도</option>
												<option value="경기도">경기도</option>
												<option value="경상남도">경상남도</option>
												<option value="경상북도">경상북도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="서울특별시">서울특별시</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="울산광역시">울산광역시</option>
												<option value="인천광역시">인천광역시</option>
												<option value="전라남도">전라남도</option>
												<option value="전라북도">전라북도</option>
												<option value="제주특별자치도">제주특별자치도</option>
												<option value="충청남도">충청남도</option>
												<option value="충청북도">충청북도</option>
										</select>
				<select name="gugun" id="gugun">
					<option value="">구/군</option>
				</select>
			</div> -->

			<div class="quick_check">
				<input type="checkbox" id="check">
				<label for="check">개인정보수집이용동의</label>
			</div>

			<a href="javascript:send_form();" class="quick_btn">상담 신청</a>
		</div>
	</form>

  <!-- end 우측 문의 퀵배너 -->

<script type="text/javascript">
		function call_gugn(val){
			$.ajax({
				type:"get"
				,url:"/html/dh/gugun2"
				,data:{'ajax':1,'city':val}
				,error:function(xhr){console.log(xhr.responseText);}
				,success:function(data){
					if(data){
						$("#gugun").html(data);
					}
					else{
						$("#gugun").html('<option value="">구/군</option>');
					}
				}
			});
		}
		function send_form(){
			var quick_frm = document.quick_online;
			if(quick_frm.name.value==""){
				alert('성함을 입력해주세요.');
				quick_frm.name.focus();
				return;
			}else if(quick_frm.data1.value==""){
				alert('연락처를 입력해주세요.');
				quick_frm.data1.focus();
				return;
			}else if(quick_frm.email.value==""){
				alert('이메일을 입력해주세요.');
				quick_frm.email.focus();
				return;
			/*}else if(quick_frm.sido.value==""){
				alert('도/시를 선택해주세요.');
				return;
			}else if(quick_frm.gugun.value==""){
				alert('구/군을 선택해주세요.');
				quick_frm.gugun.focus();
				return;*/
			}else if($('#check').prop('checked')==false){
				alert('개인정보수집이용에 동의해주세요.');
				return;
			}else{
				quick_frm.submit();
			}
		}
</script>

<%@ include file="include/tail.jsp" %>

