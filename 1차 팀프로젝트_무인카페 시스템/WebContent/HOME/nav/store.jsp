<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head2.jsp" %>
<!--Container-->
	<div id="container">
		
		<div class="sv_wrap K01">
			<p class="sv_tit"><img src="../image/tit_K03.png" alt="MENU"></p>
			<p class="page_path"><a href="../index.jsp">HOME</a><span class="arr"></span> SHOP<span class="arr"></span>매장찾기</p>
		</div>
		<!-- Content-->
		<div class="content">
			<h2 class="page_tit">매장찾기</h2>
			
			<div class="outer tint">
				<div class="inner">
					<h3 class="hidden">매장찾기</h3>

					<!-- 매장찾기 지역선택 -->
					<form method="get" name="sfrm" id="sfrm">
					<div class="store_search">
						<select name="sido" onchange="call_gugn(this.value)" title="시/도를 선택해주세요.">
							<option value="">시/도를 선택해주세요.</option>
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
								<script type="text/javascript">
							
									sido = document.sfrm.sido;
									for(i=0;i<sido.length;i++){
										if(sido.options[i].value == ""){
											sido.options[i].selected = true;
										}
									}
								//
								</script>
						<select name="gugun" id="gugun" title="구/군을 선택해주세요.">
							<option value="">구/군을 선택해주세요.</option>
						</select>
						<div class="ipbox">
							<label for="store_key" class="hidden">매장명 또는 주소를 입력하세요.</label>
							<input type="text" id="store_key" title="매장명 또는 주소를 입력하세요." placeholder="매장명 또는 주소를 입력하세요." name="sval" value="">
							<input type="image" src="../image/search.png" alt="검색" title="검색" class="btn">
						</div>
					</div>
					</form>
					<!-- END 매장찾기 지역선택 -->
					<div class="storeview" style="float: left;">
						<img src="../image/store.jpg" alt="" width="490" height="280" style="display: inline-block;">
						
							<div class="storeinfo" style="padding: 50px;">
								<h4 class="store">1. 덕진 1호점</h4>
								<dl>
									<dt>주소</dt>
									<dd> 전라북도 전주시 덕진구 금암1동 667-52</dd>
									<dt>전화번호 063-222-3333</dt>
									<dd>-</dd>
									<dt>영업시간</dt>
									<dd>05:00-01:00</dd>
								</dl>
							</div>
					</div>
					<div id="map" style="width:500px;height:500px;margin-top:10px;"></div>
					<input type="text" id="sample5_address" placeholder="주소">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						
					
					
					
					
					<!--  다음 api -->
					
					
					
					
					
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19be12d33bc6876bd246423cc84368f0&libraries=services"></script>
					<script>
					    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					        mapOption = {
					            center: new daum.maps.LatLng(35.84024740275959, 127.1324696698611), // 지도의 중심좌표
					            level: 5 // 지도의 확대 레벨
					        };
					
					    //지도를 미리 생성
					    var map = new daum.maps.Map(mapContainer, mapOption);
					    //주소-좌표 변환 객체를 생성
					    var geocoder = new daum.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new daum.maps.Marker({
					        position: new daum.maps.LatLng(35.84024740275959, 127.1324696698611),
					        map: map
					    });
					
					 // 지도에 클릭 이벤트를 등록합니다
					 // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
					 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
					     
					     // 클릭한 위도, 경도 정보를 가져옵니다 
					     var latlng = mouseEvent.latLng;
					     
					     var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
					     message += '경도는 ' + latlng.getLng() + ' 입니다';
					     
					     alert(message);
					     //var resultDiv = document.getElementById('result'); 
					     //resultDiv.innerHTML = message;
					     
					 });
					 
					    function sample5_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                var addr = data.address; // 최종 주소 변수
					
					                // 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("sample5_address").value = addr;
					                // 주소로 상세 정보를 검색
					                geocoder.addressSearch(data.address, function(results, status) {
					                    // 정상적으로 검색이 완료됐으면
					                    if (status === daum.maps.services.Status.OK) {
					
					                        var result = results[0]; //첫번째 결과의 값을 활용
					
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
					                    }
					                });
					            }
					        }).open();
					    }
					</script>
					</div><!-- END Inner -->
			</div><!-- END Outer -->
		</div><!-- END Content -->
	</div><!--END Container-->


<%@ include file="../include/tail.jsp" %>