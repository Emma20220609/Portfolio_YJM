// 선택한(to) <DIV>에 ajax를 이용해 페이지를 뿌린다.
function setDIV(to,strURL)
{
	$.ajax({
		type 		: "POST",
		url 		: strURL,
		dataType 	: "HTML",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function (data) {
			$(to).html(data);
		},
		complete : function(data)
		{
		},
		error: function(data)
		{
//			alert("ERROR : " + strURL );
		}
	});
}

function drawChart(to,str_file_name)
{
	$.ajax({
		type	 : "get",
		url		 : str_file_name,
		dataType : "json",
		success	 : function(json) 
		{
			$(to).highcharts(json)
		},
		complete : function(data)
		{
		},
		error: function(data)
		{
//			alert("ERROR : " + str_file_name );
		}
	});
}