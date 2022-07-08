
/*
 * 입력 한 숫자값에 콤마를 붙이는 함수
 * 사용 예제 : comma("1234") --> 출력값은 1,234
 */
function comma(num)
{
	var len, point, str; 
	num = num + ""; 
	point = num.length % 3 ; 
	len = num.length; 
	str = num.substring(0, point); 
	while (point < len) { 
		if (str != "") str += ",";
		str += num.substring(point, point + 3);
		point += 3; 
	} 
	return str; 
}

//문자열을 숫자로 변환한다.
function ToInteger(value)
{
	return parseInt(value);
}

//특정한 input ID의 값을 얻는다.
function getVal(id)
{
	return $("#" + id).val();
}

//특정한 input ID의 값을 얻는다.
function getIntVal(id)
{
	return ToInteger($("#" + id).val());
}

//특정한 input ID의 값을 설정한다.
function setVal(id,value)
{
	$("#" + id).val(value);
}


//특정한 tag ID의 값을 얻는다.
function getIntText(id)
{
	return ToInteger($("#" + id).text());
}

//특정한 tag ID의 값을 설정한다.
function setText(id,value)
{
	$("#" + id).text(value);
}

//특정한 tag ID의 값을 설정한다.
function getText(id)
{
	return $("#" + id).val();
}



