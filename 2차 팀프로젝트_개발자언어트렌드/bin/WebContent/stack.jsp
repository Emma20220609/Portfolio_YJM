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
		<script src="./js/jquery-3.6.0.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
	</head>
	<body>
	<%
	if( mode.equals("M") )
	{
		%>
		<form id="myForm" name="myForm" method="get" action="stack.jsp">
			<input type="hidden" id="mode" name="mode" value="M">
			<select id="year" name="year" onchange="document.myForm.submit();">
				<%
				for(int y=2008; y <= 2022; y++)
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
	<a href="stack.jsp?mode=Y">년도별 조회</a>
	<a href="stack.jsp?mode=M">월별 조회</a>	
	<div id="wanted" style="width: 600px; height: 400px; margin: 0 auto"></div>
	<script>
	
	window.onload = function()
	{
	}

	year_list   = [];
	cl_lang_list = []; //C언어
	cp_lang_list = []; //c++
	cr_lang_list = []; //C#
	cj_lang_list = []; //Java
	cs_lang_list = []; //JS
	cy_lang_list = []; //Python
	cv_lang_list = []; //VB
	ce_lang_list = []; //VB.NET
	
	$(document).ready(function() 
	{
		$.ajax({
			type : "get",
			url: "data/stackOverFlow_test_data.json",
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
				//console.log(json);
				
				//화면에 표시 할 년도 배열을 얻는다.
				$.each(json.data,function(key,value) 
				{	
					data = value.portal_date.substring(0,cutLength);
					year = value.portal_date.substring(0,4);
					if(search_year != "")
					{
						if( search_year != year )
						{
							return;
						}
					}
					
					if( year_list.indexOf(data) < 0 )
					{
						year_list.push(data);
						cl_lang_list.push(0);
						cp_lang_list.push(0);
						cr_lang_list.push(0);
						cj_lang_list.push(0);
						cs_lang_list.push(0);
						cy_lang_list.push(0);
						cv_lang_list.push(0);
						ce_lang_list.push(0);
					}
				});				
				year_list.sort();
				console.log(year_list);
				
				//언어별  배열을 얻는다.
				$.each(json.data,function(key,value) 
				{	
					//2022-01-01
					year = value.portal_date.substring(0,cutLength);
					idxno =  year_list.indexOf(year);
					if(idxno < 0) return;
					//console.log("idxno:" + idxno);
					//console.log("value.portal_count:" + value.portal_count);
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
						cr_lang_list[idxno] += parseInt(value.portal_count);
					}
					if(lang == "java")
					{
						cj_lang_list[idxno] += parseInt(value.portal_count);
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
					}
				});				
				 
				//챠트를 그린다.	
				DrawChartData();
			}
		});		   
	   
	});
	
	function DrawChartData()
	{
	  	var title = {
			      text: 'StackOverFlow 언어별 누적 검색량'   
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
	         name: 'C++',
	         data: cp_lang_list
	      },
	      {
	         name: 'C#',
	         data: cr_lang_list
	      },
	      {
	         name: 'Java',
	         data: cj_lang_list
	      },
	      {
	         name: 'JavaScript',
	         data: cs_lang_list
	      },
	      {
	         name: 'Python',
	         data: cy_lang_list
	      },
	      {
	         name: 'VB6',
	         data: cv_lang_list
	      },
	      {
	         name: 'VB.net',
	         data: ce_lang_list
	      }
	   ];
	
	   var json = {};
	
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