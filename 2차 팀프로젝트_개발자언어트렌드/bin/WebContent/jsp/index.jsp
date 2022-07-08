<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<script src="./js/jquery-3.6.0.js"></script>
		<script src='./js/highcharts.js'></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
	</head>
	<body>
	<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
	<script>
	Highcharts.chart('container', {
		title:{
			text :'채용공고 사이트의 언어별 선호언어'
        },
	    chart: {
	    	
	        backgroundColor: '#FCFFC5',
	        type: 'column'
	    },
	    xAxis: {
	        categories: ['C', 'C++', 'C#', 'Java', 'JavaScript', 'Python', 'VB']
	    },
	    legend: {
	        layout: 'vertical',
	        backgroundColor: '#FFFFFF',
	        floating: true,
	        align: 'left',
	        x: 100,
	        verticalAlign: 'top',
	        y: 70
	    },
	    tooltip: {
	        headerFormat: '<b>{series.name}</b><br/>',
	        pointFormat: '{point.category}: {point.y}'
	    },
	    series: [{
	    	name: 'wanted',
	        data: [52.0, 169.0, 95.0, 688.0, 784.0, 746.0, 0]
	    },
	    {
	    	 name: 'JumpIt',
	         data: [335, 226, 236, 1082, 766, 653, 0]	
	    }]
	});
	
	
	</script>
	</body>
</html>