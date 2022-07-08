//pID : 객체 ID
//pMode : + 또는 -
function SetItem(obj,pMode,pMax)
{
	var subObj = null;
	var num  = 0;
	
	if( pMode == "+" )
	{
		subObj = $(obj).prev();
		stat = $(subObj).text();
		num = parseInt(stat);
		num++;
		if( num > pMax )
		{
			//alert("더 이상 늘일 수 없습니다.");
			num = pMax;
		}
	}else if( pMode == "-")
	{
		subObj = $(obj).next();
		stat = $(subObj).text();
		num = parseInt(stat);			
		num--;
		if( num < pMax )
		{
			//alert("더 이상 줄일 수 없습니다.");
			num = pMax;
		}			
	}

	$(subObj).text(num+"개");
	
	var price = $(obj).parent().next().find(".price").val();
	price = parseInt(price.replace(/,/g , ''));

	//합계 금액을 계산한다.
	var drinkcount = $(obj).parent().find(".drinkcount").text();
	drinkcount = parseInt(drinkcount);
	var sum_price = 0;
	sum_price = drinkcount * price;
	$(obj).parent().next().find(".sum_price").text(makeComma(sum_price)+"원");
	
	MakeTotal();
}

//전체 메뉴갯수, 금액 변경
function MakeTotal()
{
	var total_count	= 0;
	var finalprice	= 0;
	var total		= 0;
	
	var list = $(".itemlist .items").each(function(){
		total_count	+= parseInt($(this).find(".drinkcount").text());
		total		+= parseInt($(this).find(".sum_price").text().replace(",",""));
	});
	document.getElementById("total").innerText=makeComma(total);
	document.getElementById("finalprice").innerText=makeComma(total);
	document.getElementById("total_count").innerText=total_count;
}
	
//포인트 사용
$(document).ready(function(){
    $("#usepoint").change(function(){
    	
    	var finalprice = document.getElementById("finalprice").innerText;
		finalprice = parseInt(finalprice.replace(",",""));
		var point = document.getElementById("point").innerText;
		point = parseInt(point.replace(",",""));
		
        if($("#usepoint").is(":checked"))
        {
			finalprice = finalprice - point;
			document.getElementById("finalprice").innerText=makeComma(finalprice);
        }else 
        {
			finalprice = finalprice + point;
			document.getElementById("finalprice").innerText=makeComma(finalprice);
        }
    });
});

//콤마 추가하기
function makeComma(num)
{
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

$(function(){
	var num = $("#finalprice"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#finalprice").text(num2);
	
	var num = $("#total"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#total").text(num2);
	
	var num = $("#deposit"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#deposit").text(num2);
	
	var num = $("#point"). text()
	num2 = $.numberWithCommas(parseInt(num));
	$("#point").text(num2);
})

$.numberWithCommas = function (x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

function Order()
{
	//alert("a");
	var datalist = "";

	var optionlist = $(".optionlist").parent().find(".optionlist").text();
	if(datalist != "") datalist += "/";
	datalist += optionlist;	

	var drinkcount =  $(".drinkcount").parent().find(".drinkcount").text();
	if(datalist != "") datalist += "/";
	datalist += drinkcount;		
	
	var sum_price = $(".sum_price").parent().find(".sum_price").text();
	if(datalist != "") datalist += "/";
	datalist += sum_price;	
	
	
	$(".total").each(
			function()
			{
				var total = document.getElementById("total").innerText;
				if(datalist != "") datalist += "/";
				datalist += total;			
			}
		);
	$(".finalprice").each(
		function()
		{
			var finalprice = document.getElementById("finalprice").innerText;
			if(datalist != "") datalist += "/";
			datalist += finalprice;			
		}
	);
	$(".deposit").each(
		function()
		{
			var deposit = document.getElementById("deposit").innerText;
			if(datalist != "") datalist += "/";
			datalist += deposit;									
		}
	);
	$(".point").each(
		function()
		{
			var point = document.getElementById("point").innerText;
			if(datalist != "") datalist += "/";
			datalist += point;				
		}
	);
}

//잔액체크
function Check()
{	
	var deposit	   = document.getElementById("deposit").innerText;
	deposit = parseInt(deposit.replace(",",""));
	//alert(deposit);
	var finalprice = document.getElementById("finalprice").innerText;
	finalprice = parseInt(finalprice.replace(",",""));
	//alert(finalprice);
	if(deposit < finalprice)
	{
		alert("잔액이 부족합니다. 카드결제를 이용해주세요.");
		document.orderform_tocard.submit();
	}else if(deposit > finalprice)
	{
		document.orderform.submit();
	}else
	{
		//alert("a");
		document.orderform_tocard.submit();
	}
}