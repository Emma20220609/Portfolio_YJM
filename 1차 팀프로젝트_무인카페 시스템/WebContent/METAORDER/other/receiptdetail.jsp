<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메타벅스</title>
		<link type="text/css" rel="stylesheet" href="../css/all.css">
	</head>
	<body>
		<table align=center width=500px>
			<tr style="height:100px;">
				<td align=center colspan="3">
					<h3>
						<div style="float:left"><a href="index.jsp"><img src="../img/back.png"></a></div>
						전자영수증
					</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color:#A6A6A6;">
					ⓘ종이 영수증을 원하시면 파트너에게 요청해주세요.
				</td>
			</tr>
			<tr style="background-color:#A6A6A6;">
				<td colspan="4">
			 		<div style="float:left">총 0 건</div>
			 		<div style="float:right">사용 합계 0원</div>
				</td>
			</tr>
			<tr style="background-color:#A6A6A6;">
				<td colspan="4">
					<div style="float:left">2022.04.04 ~ 2022.05.03</div>
					<div style="float:right">
						<a href="receipt.jsp">상세조회</a>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div>
						<select style="width:500px; text-align:center; " name="type">
							<option value="typeall">거래유형(전체)</option>
							<option value="char">충전</option>
							<option value="pay">결제</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div>
						<select style="width:500px; text-align:center; " name="type">
							<option value="paymentall">결제수단(전체)</option>
							<option value="Deposit">예치금</option>
							<option value="Reserves">적립금</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td align=center width=175px>
					<a href="#">1개월</a>
				</td>
				<td align=center width=175px>
					<a href="#">1년</a>
				</td>
				<td align=center width=175px>
					<a href="#">기간설정</a>
				</td>
			</tr>
			<tr>
				<td align=center colspan="4">
					<form method="post"name="checkdate" action="">
						<input type="date" name="checkdate1" value="2022-04-06"> ~		
						<input type="date" name="checkdate2" value="2022-05-06">
					</form>		
					<p>●최근 5년까지의 이력만 조회 가능합니다.</p>	
				</td>
			</tr>
			<tr>
				<td align=center colspan="4">
					<a href="#">조회</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top:10px;height:1px;background-color:#000000"></td>
			</tr>
			<tr style="height:800px;" align=center>
				<td colspan="4">
					조회 결과가 없습니다.
				</td>
			</tr>
		</table>
	</body>
</html>