<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dd {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h2 style="color: #cd1726;" align="center">예매 결제</h2>
		<form action="bookingPay.do" method="post">
		<input type="hidden" value="${rt.rtid}" name="rtid"> 
		<input type="hidden" value="${price}" name="price"> 
		<input type="hidden" value="${seat}" name="seat"> 
		<input type="hidden" value="${adult}" name="adult"> 
		<input type="hidden" value="${youth}" name="youth"> 
		<input type="hidden" value="${special}" name="special"> 
			<table class="table table-bordered" style="width: 70%; height:50%; text-align: center;">
				<tr>
					<th class="dd">영화 제목</th>
					<td>${rt.mtitle}</td>
				</tr>
				<tr>
					<th class="dd">영화관</th>
					<td>${rt.lname}</td>
				</tr>
				<tr>
					<th class="dd">상영관</th>
					<td>${rt.tname}</td>
				</tr>
				<tr>
					<th class="dd">상영 날짜</th>
					<td>${rt.rtdate}</td>
				</tr>
				<tr>
					<th class="dd">상영 시간</th>
					<td>${rt.rttime}</td>
				</tr>
				<tr>
					<th class="dd">러닝 타임</th>
					<td>${movie.mrunningTime}분</td>
				</tr>
				<tr>
					<th class="dd">인원</th>
					<td>대인:${adult},소인:${youth},우대:${special}</td>
				</tr>
				<tr>
					<th class="dd">좌석</th>
					<td>${seat}</td>
				</tr>
				<tr>
					<th class="dd">가격</th>
					<td>${price}</td>
				</tr>
				<tr align="center">
					<th colspan="2" style="text-align: center">
					<input type="submit" value="결제 선택"  class="btn btn-info btn-sm" style="border-color:
					#cd1726; background-color: #cd1726;"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>