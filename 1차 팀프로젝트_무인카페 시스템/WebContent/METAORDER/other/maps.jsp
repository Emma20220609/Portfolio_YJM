<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
		<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	</head>
	<body>
	<table align=center width=500px>
		<tr>
			<td>
				<a href="index.jsp"><img src="../img/back.png"></a>
			</td>
		</tr>
		<tr style="height:100px;">
			<td colspan="4">
				<h2>
					매장정보
				</h2>
			</td>
		</tr>
		<tr>
			<td>
		    <div class="storeview" style="float: left;">
						<img src="../../HOME/image/store.jpg" alt="" width="490" height="280" style="display: inline-block;">
						
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
		    </td>
	    </tr>
    </table>
	</body>