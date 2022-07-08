<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//mode=Y : 년도별, M : 월별
//year 값이 있는 경우 해당 year 만 표시한다.
String mode = request.getParameter("mode");
String year = request.getParameter("year");
if( mode == null || !mode.equals("M") )
{
	mode = "Y";
}else
{
	mode = "M";
}
if( year == null )
{
	year = "";
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>DataLab 검색어 트렌드 </title>
		<script src="./js/jquery-3.6.0.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
	</head>
	<body>
	<%
	if( mode.equals("M") )
	{
		%>
		<form id="myForm" name="myForm" method="get" action="comu_year.jsp">
			<input type="hidden" id="mode" name="mode" value="M">
			<select id="year" name="year" onchange="document.myForm.submit();">
				<%
				for(int y=2000; y <= 2022; y++)
				{
					int curYear = 0;
					try
					{
						curYear = Integer.parseInt(year);					
					}catch(Exception e)
					{
						curYear = 2022;
					};
					%>
					<option value="<%= y %>" <% if( y == curYear ) out.print("selected"); %>><%= y %>년</option>
					<%
				}
				%>
			</select>
		</form>
		<%
	}
	%>
	<a href="comu_year.jsp?mode=Y">년도별 조회</a>
	<a href="comu_year.jsp?mode=M">월별 조회</a>	
	<div id="wanted" style="width: 600px; height: 400px; margin: 0 auto"></div>
	<script>
	
	window.onload = function()
	{
	}

	year_list   = [];
	cl_lang_list = []; //C언어
	cp_lang_list = []; //c++
	cs_lang_list = []; //C#
	jv_lang_list = []; //Java
	js_lang_list = []; //JS
	py_lang_list = []; //Python
	vb_lang_list = []; //VB
	vn_lang_list = []; //VB.NET
	
	$(document).ready(function() 
	{
		$.ajax({
			type : "get",
			url: "data/comumonth.json",
			dataType: "json",
			success : function(json) 
			{
				var cutLength = 4;
				var search_year = "";
				<%
				if( mode.equals("M") )
				{
					%>cutLength = 7;<%
					if( year != null && !year.equals("") )
					{
						%>
						search_year = "<%= year %>";
						<%
					}
				}
				%>				
				wanted_data = [];
				jumpit_data = [];
				console.log(json);
				//console.log(Object.keys(json))
				
				
				//화면에 표시 할 년도 배열을 얻는다.
				$.each(json,function(key,value) 
				{	
					console.log(value.comu_name)
					//console.log("cutLength " + cutLength);
					year = value.comu_date.substring(0,cutLength);
//					console.log("data " + data );
					
					if(search_year != "")
					{
						if( search_year != year.substring(0,4) )
						{
							return;
						}
					}
					
					if( year_list.indexOf(year) < 0 )
					{
						year_list.push(year);
						cl_lang_list.push(0);
						cp_lang_list.push(0);
						cs_lang_list.push(0);
						jv_lang_list.push(0);
						js_lang_list.push(0);
						py_lang_list.push(0);
						vb_lang_list.push(0);
						vn_lang_list.push(0);
					}
				});				
				year_list.sort();
				
				console.log(year_list);
				
				//언어별  배열을 얻는다.
				$.each(json,function(key,value) 
				{	
					//2022-01-01
					year = value.comu_date.substring(0,cutLength);
					idxno =  year_list.indexOf(year);
					if(idxno < 0) return;
		//			console.log("idxno:" + idxno);
		//			console.log("value.portal_count:" + value.portal_count);
					var keys_list = Object.keys(value);
		//			console.log(value_cpp)
		//			console.log(keys_list[2])
		//			python
					var python		 = keys_list[7]
					var value_python = value[keys_list[7]]
		//			Java		
					var java		 = keys_list[5]
					var value_java	 = value[keys_list[5]]
		//			C++
					var cpp			 = keys_list[4]
					var value_cpp	 = value[keys_list[4]]
		//			C
					var cl			 = keys_list[2]
					var value_cl	 = value[keys_list[2]]
		//			C#
					var cs			 = keys_list[2]
					var value_cs	 = value[keys_list[2]]
		//			JS
					var js			 = keys_list[6]
					var value_js	 = value[keys_list[6]]
		//			vb
					var vb			 = keys_list[8]
					var value_vb	 = value[keys_list[8]]
		
					if(python == "PYTHON")
					{
						py_lang_list[idxno] += parseInt(value_python);
					}				
					if(cpp == "C++")
					{
						cp_lang_list[idxno] += parseInt(value_cpp);
					}
					if(java == "JAVA")
					{
						jv_lang_list[idxno] += parseInt(value_java);
					}
					if(cl == "C")
					{
						cl_lang_list[idxno] += parseInt(value_cl);
					}
					if(cs == "C#")
					{
						cs_lang_list[idxno] += parseInt(value_cs);
					}
					if(js == "JS")
					{
						js_lang_list[idxno] += parseInt(value_js);
					}
					if(js == "VB")
					{
						vb_lang_list[idxno] += parseInt(value_vb);
					}
					/*if(lang == "c#")
					{
						cr_lang_list[idxno] += parseInt(value.portal_count);
					}
					if(lang == "javascript")
					{
						cs_lang_list[idxno] += parseInt(value.portal_count);
					}
					if(lang == "python")
					{
						cy_lang_list[idxno] += parseInt(value.portal_count);
					}
					if(lang == "vb6")
					{
						cv_lang_list[idxno] += parseInt(value.portal_count);
					}
					if(lang == "vb.net")
					{
						ce_lang_list[idxno] += parseInt(value.portal_count);
					} */
				});				
				 
				//챠트를 그린다.	
				DrawChartData();
			}
		});		   
	   
	});
	
	function DrawChartData()
	{
	  	/*var chart = {
	  			type: 'column'
	  	}*/
		
		var title = {
			      text: '개발자 커뮤니티 언어별 검색량'   
			   };
	   var subtitle = {
	      text: 'Cteam'
	   };
	   var xAxis = {
	      categories: year_list
	   };
	   var yAxis = {
	      title: {
	         text: '검색량'
	      },
	      plotLines: [{
	         value: 0,
	         width: 1,
	         color: '#808080'
	      }]
	   };   
	
	   var tooltip = {
	      valueSuffix: ''
	   }
	
	   var legend = {
	      layout: 'vertical',
	      align: 'right',
	      verticalAlign: 'middle',
	      borderWidth: 0
	   };
	
	   var series =  [
	      {
	         name: 'C',
	         data: cl_lang_list
	      },
	      {
		         name: 'C#',
		         data: cs_lang_list
		      },
	      {
	         name: 'C++',
	         data: cp_lang_list
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
	      {
	         name: 'VB',
	         data: vb_lang_list
	      }
	    
	   ];
	
	   var json = {};
	
	   //json.chart = chart;
	   json.title = title;
	   json.subtitle = subtitle;
	   json.xAxis = xAxis;
	   json.yAxis = yAxis;
	   json.tooltip = tooltip;
	   json.legend = legend;
	   json.series = series;
	   $('#wanted').highcharts(json);		
	}
	</script>
	</body>
</html>