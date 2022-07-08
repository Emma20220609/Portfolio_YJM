<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- start ==================== content ======================================= -->
<div class="contents">
	<script>
		$(function(){
			$('#chart').highcharts(rec_site)
		});
	</script>
	<div class="card">
			<h2>구인 사이트 트랜드</h2>
			<h3>2022. 6</h3>
			<div id="chart" style="width:100%; height:450px;"></div>
			<p>구인 사이트의 개발 언어별 구인 게시글 수 분석</p>
		</div>
	</div>
</div>
<!-- end ====================== content ======================================= -->