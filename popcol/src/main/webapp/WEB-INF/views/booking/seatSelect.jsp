<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.kk{
		width: 40px; 
		height: 20px;
		border: 1px solid white;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.kk').click(function() {
			var adult = $("#adult option:selected").text();
			var youth = $("#youth option:selected").text();
			var special = $("#special option:selected").text();
			
			if(adult == 0 && youth == 0 && special == 0) {
				return false;
			}//000으로 되어있으면 좌석 선택 불가능
			
			adult*=1; youth*=1; special*=1;
			var totalPerson = adult+youth+special;
			
			var seatCount = 0;
			$('.kk').each(function(i,obj) {
				//i =index obj=td(id: kk)를 가져옴
				
				var color = $(obj).css("background-color");
				if(color == 'rgb(12, 7, 50)') {//navy
					seatCount++;
				}
			});
			
			if(seatCount < totalPerson) {
				var idd = $(this).attr('id');
				var color = $('#' + idd).css("background-color");
				if (color == "rgb(12, 7, 50)") {//navy일 때
					$('#' + idd).css("background-color", "#cd1726");//빨강으로 변경
				} else if(color=="rgb(128,128,128)"){//비활성화 회색일 때
					return false;//아무것도 안함
				} else {
					$('#' + idd).css("background-color", "#0C0732");//빨강을 누르면 navy로 변경
				}	
			}
			//좌석 색깔 변경하기
			var selectedSeatList = "";
			$('.kk').each(function(i,obj) {
				//i =index obj=td(id: kk)를 가져옴
				var color = $(obj).css("background-color");//td의 색깔을 받아옴
				if(color == 'rgb(12, 7, 50)') //navy
				{
					var seat = $(obj).attr('id'); //id=a4이런거
					selectedSeatList = selectedSeatList + seat +" ";
				}
			});
			$("#totalSeat").html(selectedSeatList);
		});
	});
	
	function totalPerson() {
		var adult = document.getElementById('adult').selectedIndex;
		var youth = document.getElementById('youth').selectedIndex;
		var special = document.getElementById('special').selectedIndex;
		var adultStr = "";
		var youthStr = "";
		var specialStr = "";
		
		if(adult != 0){
			adultStr = " 대인:" + adult + "명";
		}
		if(youth != 0){
			youthStr = " 소인:" + youth + "명";
		}
		if(special != 0){
			specialStr = " 우대:" + special + "명";
		}
		
		$('#personCount').html(adultStr + youthStr + specialStr);
		

		var adultList = new Array();
		var youthList = new Array();
		var specialList = new Array();
		var adultPrice = 0;
		var youthPrice = 0;
		var specialPrice = 0;
		var totalPrice = 0;

		<c:forEach var="price" items="${ priceList }">
			<c:if test="${ price.human eq 'adult' }">
				adultList.push("${ price.price }");//{var=price,db에있는 price}
			</c:if>
			<c:if test="${ price.human eq 'youth' }">
				youthList.push("${ price.price }");
			</c:if>
			<c:if test="${ price.human eq 'special' }">
				specialList.push("${ price.price }");
			</c:if>
		</c:forEach>

		adultPrice = adultList[0]; // index=0
		youthPrice = youthList[0];
		specialPrice = specialList[0];

		totalPrice = adultPrice * adult + youthPrice * youth + specialPrice* special;
		$('#totalPrice').html(totalPrice + '원');
	}
	function btnClick() {
		var adult = $("#adult option:selected").text();
		var youth = $("#youth option:selected").text();
		var special = $("#special option:selected").text();
		adult*=1; youth*=1; special*=1;
		var totalPerson = adult+youth+special;
		if(adult == 0 && youth == 0 && special == 0) {
			alert("인원을 선택하세요");
			return false;
		}//000으로 되어있으면 결제 페이지로 넘어가지 않음
		
		var seatCount = 0;
		$('.kk').each(function(i,obj) {
			//i =index obj=td(id: kk)를 가져옴
			
			var color = $(obj).css("background-color");
			if(color == 'rgb(12, 7, 50)') {//navy
				seatCount++;
			}
		});
		
		if(seatCount != totalPerson) {
			alert("좌석을 선택하세요");
			return false;
		}else{
			var price= $('#totalPrice').text();
			var seat=$('#totalSeat').text();
			var adult = $("#adult option:selected").text();
			var youth = $("#youth option:selected").text();
			var special = $("#special option:selected").text();
			location.href="bookingChk.do?rtid=${rt.rtid}&price="+price+"&seat="+seat+"&adult="+adult+"&youth="+youth
					+"&special="+special;
		} 
			
	}
</script>
</head>
<body>
	<h2 style="color: #cd1726" align="center">빠른 영화 예매</h2>
	<div class="container" style="margin-top: 2%; margin-left: 5%; border: 1px solid black; border-spacing: 5px;">
		<div>
			<table style="display: inline; width: 500px; margin-left: 200px; border-spacing: 10px; border-collapse: separate;">
				<tr></tr>
				<tr style="margin-top: 300px;">
					<th>대인</th>
					<td>
						<select onchange="totalPerson()" id="adult">
							<c:forEach begin="0" end="6" var="person">
								<option>${person}</option>
							</c:forEach>
						</select>
					</td>
					<th>소인</th>
					<td>
						<select onchange="totalPerson()" id="youth">
							<c:forEach begin="0" end="6" var="person">
								<option>${person}</option>
							</c:forEach>
						</select>
					</td>
					<th>우대</th>
					<td>
						<select onchange="totalPerson()" id="special">
							<c:forEach begin="0" end="6" var="person">
								<option>${person}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<table style="display: inline; width: 500px; margin-left: 80px;">
				<tr>
					<th colspan="4" style="width: 100px; font-size: 20px;">
						예매 정보
					</th>
				</tr>
				<tr>
					<td style="width: 70px; font-weight: bold;">영화</td>
					<td style="width: 70px;">${rt.mtitle}</td>
					<td style="width: 70px; font-weight: bold;">영화관</td>
					<td style="width: 70px;">${rt.lname}</td>
					<td style="width: 50px; font-weight: bold;">인원</td>
					<td style="width: 200px;" id="personCount"></td>
				</tr>
				<tr>
					<td style="width: 70px; font-weight: bold;">상영관</td>
					<td style="width: 70px;">${rt.tname}</td>
					<td style="width: 70px; font-weight: bold;">날짜</td>
					<td style="width: 100px;">${rt.rtdate}</td>
					<td style="width: 70px; font-weight: bold;">좌석</td>
					<td style="width: 100px;" id="totalSeat"></td>
				</tr>
				<tr>
					<td style="width: 70px; font-weight: bold;">시간</td>
					<td style="width: 70px;">${rt.rttime}</td>
					<td style="width: 70px; font-weight: bold;">상영시간</td>
					<td style="width: 70px;">${movie.mrunningTime}분</td>
					<td style="width: 70px; font-weight: bold;">가격</td>
					<td style="width: 100px;" id="totalPrice"></td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<button onclick='btnClick()' class="btn btn-info btn-sm" style="border-color:
					#cd1726; background-color: #cd1726;" >결제 하기</button>
					</td>
				</tr>
			</table>
		</div>
		<hr>
		<div align="center">
			<div	style="background-color: lightgray; margin-left: 10px; width: 600px; height: 20px; text-align: center; vertical-align: middle;"><h4>Screen</h4></div>
			<div style="height: 20px;"></div>
			<c:set var="al" value="A,B,C,D,E,F" />
			<table style="display: inline; text-align: center; color:white;" class="seat">
				<c:forTokens items="${al}" delims="," var="nn">
				 <!-- for문을 돌리면서 string을 잘라서 넣을 때 사용함 -->
					<tr>
						<c:forEach var="j" begin="1" end="4">
							<c:if test="${ not empty seatrtbsList }">
								<c:forEach var="selectedSeat" items="${ seatrtbsList }">
									<c:set var="s" value="${ nn }${ j }"></c:set>
									<c:if test="${ selectedSeat.bseat == s }">
										<td bgcolor="gray" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>		
									</c:if>
									<c:if test="${ selectedSeat.bseat != s }">
										<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ empty seatrtbsList }">
								<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
									style="width: 40px; height: 20px">${nn}${j }</td>
							</c:if>
						</c:forEach>
						<td bgcolor="white"></td>
					</tr>
				</c:forTokens>
			</table>
			<table style="display: inline; text-align: center; color:white;" class="seat">
			<c:forTokens items="${al}" delims="," var="nn">
				 <!-- for문을 돌리면서 string을 잘라서 넣을 때 사용함 -->
					<tr>
						<c:forEach var="j" begin="5" end="12">
							<c:if test="${ not empty seatrtbsList }">
								<c:forEach var="selectedSeat" items="${ seatrtbsList }">
									<c:set var="s" value="${ nn }${ j }"></c:set>
									<c:if test="${ selectedSeat.bseat == s }">
										<td bgcolor="gray" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>		
									</c:if>
									<c:if test="${ selectedSeat.bseat != s }">
										<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ empty seatrtbsList }">
								<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
									style="width: 40px; height: 20px">${nn}${j }</td>
							</c:if>
						</c:forEach>
						<td bgcolor="white"></td>
					</tr>
				</c:forTokens>
			</table>
			<table style="display: inline; text-align: center; color:white;" class="seat">
				<c:forTokens items="${al}" delims="," var="nn">
				 <!-- for문을 돌리면서 string을 잘라서 넣을 때 사용함 -->
					<tr>
						<c:forEach var="j" begin="13" end="16">
							<c:if test="${ not empty seatrtbsList }">
								<c:forEach var="selectedSeat" items="${ seatrtbsList }">
									<c:set var="s" value="${ nn }${ j }"></c:set>
									<c:if test="${ selectedSeat.bseat == s }">
										<td bgcolor="gray" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>		
									</c:if>
									<c:if test="${ selectedSeat.bseat != s }">
										<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
											style="width: 40px; height: 20px">${nn}${j }</td>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ empty seatrtbsList }">
								<td bgcolor="#cd1726" id="${nn}${j}" class="kk"
									style="width: 40px; height: 20px">${nn}${j }</td>
							</c:if>
						</c:forEach>
						<td bgcolor="white"></td>
					</tr>
				</c:forTokens>
			</table>
		</div>
	</div>
</body>
</html>