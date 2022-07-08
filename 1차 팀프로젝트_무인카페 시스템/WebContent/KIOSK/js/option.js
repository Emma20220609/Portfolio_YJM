	//선택하기
	var prevObj = null;
	function Select(obj)
	{
		if( prevObj == obj) return;
		
		if( prevObj != null)
		{
			//기존 선택한 거 제거
			$(prevObj).removeClass("select");
			$(prevObj).addClass("unselect");				
		}
		$(obj).removeClass("unselect");
		$(obj).addClass("select");
		
		var value = $(obj).find("#drink_id").val();
		$("#sel_menu").val(value);
		prevObj = obj;
		
		var price = $(obj).find("#price").val();
		document.getElementById("drinkprice").value= makeComma(price);
		document.getElementById("p").value= price;
	}
	
	//옵션값 보내기
	function Option()
	{
		var datalist = "";
		$("#pro_no").each(
			function()
			{
				var pro_no = document.getElementById("pro_no").value;
				if(datalist != "") datalist += "/";
				datalist += pro_no;		
			}
		);
		$("#hname").each(
			function()
			{
				var hname = document.getElementById("hname").value;
				if(datalist != "") datalist += "/";
				datalist += hname;			
			}
		);
		$(".select").each(
			function()
			{
				var value = $(this).find("#drink_id").val();
				if(datalist != "") datalist += "/";
				datalist += value;			
			}
		);
		$("#shot").each(
			function()
			{
				var shot = document.getElementById("shot").innerHTML;
				if(datalist != "") datalist += "/";
				datalist += shot;									
			}
		);
		$("#syrup").each(
			function()
			{
				var syrup = document.getElementById("syrup").innerHTML;
				if(datalist != "") datalist += "/";
				datalist += syrup;				
			}
		);
		$("#drinkcount").each(
				function()
				{
					var drinkcount = document.getElementById("drinkcount").innerHTML;
					if(datalist != "") datalist += "/";
					datalist += drinkcount;				
				}
			);
		
		$("#drinkprice").each(
			function()
			{
				var drinkprice = document.getElementById("drinkprice").value;
				if(datalist != "") datalist += "/";
				datalist += drinkprice;		
			}
		);
		$("#p").each(
			function()
			{
				var price = document.getElementById("p").value;
				if(datalist != "") datalist += "/";
				datalist += makeComma(price);
			}
		);
		if($("#drinkprice").val() == "0")
		{
			alert("매뉴를 선택하세요.");
			
		}
		$("#sel_menu").val(datalist);
		document.selForm.submit();
	}

	
	//수량 증가감소
	$(function(){
		$('#minus1').click(function(){
			SetItem(this,"-",1);
		});
		
		$('#plus1').click(function(){
			SetItem(this,"+",5);
		});
		$('#minus2').click(function(){
			SetItem(this,"-",0);			
		});
		
		$('#plus2').click(function(){
			SetItem(this,"+",5);
		});		
		$('#minus3').click(function(){
			SetItem(this,"-",0);			
		});
		
		$('#plus3').click(function(){
			SetItem(this,"+",30);
		});		
	});	
	
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
			num = parseInt(stat,10);			
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
			num = parseInt(stat,10);			
			num--;
			if( num < pMax )
			{
				//alert("더 이상 줄일 수 없습니다.");
				num = pMax;
			}			
		}
		$(subObj).text(num);
		
		MakeSum();
	}
	
	//가격합계
	function MakeSum()
	{	
		//alert("sum");
		
		var price = $("#p").val();
		price = parseInt(price.replace(/,/g , ''));
		//alert(price);
		if(price == 0)
		{
			return;	
		}
		
		//합계 금액을 계산한다.
		var drinkcount = $("#drinkcount").text();
		drinkcount = parseInt(drinkcount);
		//alert(drinkcount);
		var sum_price = 0;
		sum_price = drinkcount * price;
		//alert(sum_price);
		document.getElementById("drinkprice").value=makeComma(sum_price);
	
	}
	
	function makeComma(num)
	{
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}