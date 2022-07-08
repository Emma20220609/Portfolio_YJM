/****************************************************************************************************
 *	작성자 : 함경환
 *	작성일 : 2022-05-20 11:45
****************************************************************************************************/

//선택된 메뉴를 str로 strURL의 이름을 가진 페이지에 요청을 보낸다.
//결과 값은 to의 id를 가진 곳에 반영한다
function setDiv(to, strURL, str) {
	//선택된 메뉴를 str로 strURL의 이름을 가진 페이지에 요청을 보낸다.
	$.ajax({
		type		: "POST",
		url			: strURL + str,
		dataType	: "HTML",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success		: function (data) {$(to).html(data);},
		complete	: function (data) {},
		error		: function (data) {}
	});
}

//선택된 상품의 정보를 임시 저장한다
function selectItem(to,str) {
	document.getElementById(to).innerHTML = str;
}

function selectOption(to,str) {
	document.getElementById(to).innerHTML = str;
}
function setOption(obj) {
	document.getElementById('name').value;
	document.getElementById("result").innerText = name;
}
function clearOption() {
	//옵션 구역의 모든 input 항목의 값을 초기화
	var lists = document.querySelectorAll("input.option");
	lists.forEach(function(Item){
		Item.value = 0;
	});
	//수량의 기본값은 1임
	document.getElementById("opt3").value = 1;
}

//옵션을 선택한 상품을 장바구니에 담는다
function putItemIntoCart() {
	
	var item_info	= document.getElementById("menu_item").value;		//상품 정보
	var total_price	= document.getElementById("total_price").value;		//가격 정보
	var shot	= document.getElementById("shot").innerHTML;
	var syrup	= document.getElementById("syrup").innerHTML;
	
	//장바구니에 담을 객체 생성
	var idStr = "item" + count;								//객체 이름 생성
	const newItem	= document.createElement('div');		//담을 객체
	const par		= document.getElementById("item");		//부모 객체
	par.appendChild(newItem);								//객체 추가
	//객체 정보 갱신
	newItem.setAttribute("id", idStr);							//id 부여
	newItem.setAttribute("style","background-color:silver;border:0.1rem solid;");
	//
	var strHTML = 
`divNo_: <span>${idStr}</span><br>
itemNo: <span id='item_no'>${item_no}</span><br>
name__: <span>${name}</span><br>
hname_: <span>${hname}</span><br>
sPrice: <span>${sPrice}</span><br>
opt1__: <span>${opt1}</span><br>
opt2__: <span>${opt2}</span><br>
opt3__: <span>${opt3}</span><br>
iPrice: <span>${iPrice}</span><br>
<div style="background-color:orangered;" onclick="delItemFromCart(this.parentNode,'${iPrice}');">삭제하기</div>`;
	newItem.innerHTML = strHTML;
	
	
	/*
	alert(item_info);
	alert(shot);
	alert(syrup);
	alert(total_price);
	*/
	
	/*
	//상품 정보 가져오기
	var item_no	= document.getElementById("pro_no").innerText;				//상품 번호
	if( item_no == null || item_no == 0 ) return;
	var name	= document.getElementById("div_name").innerText;			//상품 세부 이름
	var hname	= document.getElementById("pro_name").innerText;			//상품 중분류 이름
	var sPrice	= Number(document.getElementById("sel_price").innerText);	//선택한 상품 가격
	//옵션 값 가져오기
	var opt1	= Number(document.getElementById("opt1").value);			//샷 추가 수량
	var opt2	= Number(document.getElementById("opt2").value);			//시럽 추가 수량
	var opt3	= Number(document.getElementById("opt3").value);			//상품 선택 수량
	//장바구니 상품 갯수와 총 가격
	var Price	= Number(document.getElementById("price").value);			//전체 상품 가격
	var count	= Number(document.getElementById("count").value);			//담긴 상품 갯수
	//장바구니에 선택된 옵션을 넣는다
	document.getElementById("sel_opt1").innerText	= opt1;					//샷 추가
	document.getElementById("sel_opt2").innerText	= opt2;					//시럽 추가
	document.getElementById("sel_opt3").innerText	= opt3;					//수량 추가
	//담긴 상품 갯수를 증가시킨다
	document.getElementById("count").value			= count + 1;
	//가격 계산하기 (샷*500 + 단품가격)*수량
	var iPrice = (opt1 * 500 + sPrice) * opt3 ;
	//총 가격 갱신
	document.getElementById("price").value = Price + iPrice;
	//장바구니에 담을 객체 생성
	var idStr = "item" + count;								//객체 이름 생성
	const newItem	= document.createElement('div');		//담을 객체
	const par		= document.getElementById("item");		//부모 객체
	par.appendChild(newItem);								//객체 추가
	//객체 정보 갱신
	newItem.setAttribute("id", idStr);							//id 부여
	newItem.setAttribute("style","background-color:silver;border:0.1rem solid;");
	//
	var strHTML = 
`divNo_: <span>${idStr}</span><br>
itemNo: <span id='item_no'>${item_no}</span><br>
name__: <span>${name}</span><br>
hname_: <span>${hname}</span><br>
sPrice: <span>${sPrice}</span><br>
opt1__: <span>${opt1}</span><br>
opt2__: <span>${opt2}</span><br>
opt3__: <span>${opt3}</span><br>
iPrice: <span>${iPrice}</span><br>
<div style="background-color:orangered;" onclick="delItemFromCart(this.parentNode,'${iPrice}');">삭제하기</div>`;
	newItem.innerHTML = strHTML;
	*/
	
}
function delItemFromCart(obj,price) {
	//담긴 상품 갯수
	var count	= Number(document.getElementById("count").value);
	//담긴 상품 갯수를 감소시킨다
	document.getElementById("count").value			= count - 1;
	//담긴 상품의 가격을 삭제한다
	document.getElementById("price").value -= price;
	//담긴 상품을 삭제한다
	obj.remove();
}
function order(){
	document.getElementById("order_no_list").innerText = "";
	var lists = document.querySelectorAll("#item_no");
	alert(lists);
	lists.forEach(function(Item){
		alert(Item.innerText);
		document.getElementById("order_no_list").innerText += Item.innerText + ":";
	});
}