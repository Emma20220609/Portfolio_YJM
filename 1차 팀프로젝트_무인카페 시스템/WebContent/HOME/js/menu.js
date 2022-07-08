//선호메뉴 선택
function addfav(obj)
{
	var cls = $(obj).attr("class");
	
	if(cls == "select")
	{
		//선택 해제
		alert("선호하는 메뉴를 취소합니다");
		$(obj).removeClass("select");
		$(obj).addClass("unselect");
		
	}else
	{
		//선택
		
		alert("선호하는 메뉴를 선택합니다");
		$(obj).removeClass("unselect");
		$(obj).addClass("select");
		
	}

}
//선호메뉴 값 보내기
function favSend()
{
	var datalist="";
	$(".select").each(function(){
	
		/*
		var value = $(this).parent().find("#fav_name").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		
		var value = $(this).parent().find("#fav_price").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		
		var value = $(this).parent().find("#fav_no").val();
		if(datalist != "") datalist += ",";
		datalist += value;
		alert(value);
		*/
		var value = $(this).parent().find("#fav_hname").val();
		//alert(value);
		if(datalist != "") datalist += ",";
		datalist += value;	
		
		var value = $(this).parent().find("#fav_price").val();
		if(datalist != "") datalist += "#";
		datalist += value;
		//alert(value);
		
		
	});
	//alert(datalist);
	if(datalist=="")
	{
		alert("선택된 메뉴가 없습니다");
		return;
	}	
	$("#fav_menu").val(datalist);
	
	document.favForm.submit();
	
}