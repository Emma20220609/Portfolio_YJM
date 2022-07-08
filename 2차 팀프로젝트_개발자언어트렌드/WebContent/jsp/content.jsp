<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- start ==================== content ======================================= -->
<div class="contents">
	<div class="leftcolumn">
		<div class="card">
			<h3>개발자 트랜드 분석 - 국내</h3>
			<h3>2022년 6월까지</h3>
			<div id="chart2" style="width:100%; height:350px;"></div>
			<p></p>
			<p></p>
		</div>
	</div>
	<div class="rightcolumn">
		<div class="card">
			<h3>개발자 트랜드 분석 - 국내</h3>
			<h3>2022년 6월까지</h3>
			<div id="chart4" style="width:100%; height:350px;"></div>
			<p></p>
			<p></p>
		</div>
	</div>
	<div class="leftcolumn">
		<div class="card">
				<h3>개발자 트랜드 - 글로벌</h3>
				<h3>2022년 6월까지</h3>
				<div id="chart1" style="width:100%; height:350px;"></div>
				<p></p>
				<p></p>
		</div>
	</div>
	<div class="rightcolumn">
		<div class="card">
				<h3>개발자 트랜드 분석 - 글로벌</h3>
				<h3>2022년 6월까지</h3>
				<div id="chart3" style="width:100%; height:350px;"></div>
				<p></p>
				<p></p>
		</div>
	</div>
</div>

<script>
	$('#chart2').highcharts(comu_year)
	$('#chart4').highcharts(comu_sum)
	$('#chart1').highcharts(chart_default)

	year_list   = [];
	cl_lang_list = []; //C언어
	cp_lang_list = []; //c++
	cs_lang_list = []; //C#
	jv_lang_list = []; //Java
	js_lang_list = []; //JS
	py_lang_list = []; //Python
	vb_lang_list = []; //VB
	vn_lang_list = []; //VB.NET

	$.ajax({
		type	 : "get",
		url		 : "./data/stackOverFlow.json",
		dataType : "json",
		success	 : function(json) 
		{
			var cutLength	 = 4;
			var search_year	 = "";
			charts_data = [];
			
			//화면에 표시 할 년도 배열을 얻는다.
			$.each(json.data,function(key,value) 
			{	
				data = value.portal_date.substring(0,cutLength);
				year = value.portal_date.substring(0,4);
				if( search_year == "" || search_year == year )
				{
					if( year_list.indexOf(data) < 0 )
					{
						year_list.push(data);
						cl_lang_list.push(0);
						cp_lang_list.push(0);
						cs_lang_list.push(0);
						jv_lang_list.push(0);
						js_lang_list.push(0);
						py_lang_list.push(0);
						vb_lang_list.push(0);
						vn_lang_list.push(0);
					}
				}
			});				
			year_list.sort();
			//언어별  배열을 얻는다.
			$.each(json.data,function(key,value) 
			{	
				//2022-01-01
				year = value.portal_date.substring(0,cutLength);
				idxno =  year_list.indexOf(year);
				if(idxno < 0) return;
	//			console.log("idxno:" + idxno);
	//			console.log("value.portal_count:" + value.portal_count);
				lang = value.portal_lang;
				lang = lang.replace(" questions","");
				if(lang == "c")
				{
					cl_lang_list[idxno] += parseInt(value.portal_count);
				}				
				if(lang == "c++")
				{
					cp_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "c#")
				{
					cs_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "java")
				{
					jv_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "javascript")
				{
					js_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "python")
				{
					py_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "vb6")
				{
					vb_lang_list[idxno] += parseInt(value.portal_count);
				}
				if(lang == "vb.net")
				{
					vn_lang_list[idxno] += parseInt(value.portal_count);
				}
				
			});
			//챠트를 그린다.
			DrawChartData();
		}
	});
	
	function DrawChartData()
	{
		var chart = { type: 'line'};
		var title = { text: 'StackOverFlow 언어별 검색량'};
		var xAxis = { categories: year_list};
		var yAxis = { title: { text: '검색량'}, plotLines: [{value: 0, width: 1, color: '#808080'}]};
		var tooltip = { valueSuffix: ''};
		var legend = {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
				};
		var series = [
			{
				name: 'C',
				data: cl_lang_list
			}, 
			{
				name: 'C++',
				data: cp_lang_list
			},
			{
				name: 'C#',
				data: cs_lang_list
			},
			{
				name: 'Java',
				data: jv_lang_list
			},
			{
				name: 'JavaScript',
				data: js_lang_list
			},
			{
				name: 'Python',
				data: py_lang_list
			},
		];

		var json = {};

		json.chart	 = chart;
		json.title	 = title;
		json.xAxis	 = xAxis;
		json.yAxis	 = yAxis;
		json.tooltip = tooltip;
		json.legend	 = legend;
		json.series	 = series;
		$('#chart3').highcharts(json);
	}
</script>
<!-- end ====================== content ======================================= -->