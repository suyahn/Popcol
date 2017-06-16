<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav>li.active>a {
	background-color: #cd1726 !important;
	color: white !important;
}

a {
	color: #cd1726 !important;
}

.nav>li>a:hover {
	background-color: #fdeaeb !important;
	color : #fcba2e !important;
}

hr {
    color: #dfdfdf;    /* IE */
    border-color: #dfdfdf;  /* 사파리 */
    background-color: #dfdfdf;   /* 크롬, 모질라 등, 기타 브라우저 */
}
</style>
<script type="text/javascript">
	$(function() {
		// 생일축하 포인트 받기
		$('#receivePoint').click(function() {
			
			$.post('receivePoint.do', function(result) {
				if(result == 1) {
					alert("생일축하 10000 포인트 지급 완료~ 즐거운 하루되세요.");
					
				} else if(result == 0) {
					alert("다시 시도해주세요.");
				}
			}); 
		});
	});
</script>
</head>
<body>
	<div style="width: 70%; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; margin: auto; background-image: URL(${path}/images/ticket.png); ">
		<div style="width: 100%; height: 303px;">
			<br>
			<br>
			<br>
			<h2 class="" style="margin: 10px;">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				${customer.cname }님
				<font size="2px">(${customer.cid })</font>
			</h2>
			<br>
			<h4 class="" style="margin: 10px;">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				고객님께서 현재 보유하신 포인트는 ${customer.cpoint }점입니다.
			</h4>
			
			<c:if test="${checkPoint == 'n' }">
				<br>
				<h4>
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					생일축하 포인트가 지급되었습니다. 옆의 버튼을 눌러주세요.
					<button id="receivePoint" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">생일축하 포인트 받기</button>
				</h4>
			</c:if>
		</div>
	</div>

	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
			<div class="container" style="width: 800px;">
				<div style="margin-bottom: 50px;">
					<h4 align="left"><a href="mypage_reservation.do">나의 예매 내역</a></h4>
					
					<table class="table ">
						<c:forEach var="booking" items="${myBookingList }">
						<tr>
							<td>예매번호<br><br><br><br>${booking.ticketnumber }</td>
							
							<c:forEach var="movie" items="${bookingMovieList }">
								<c:if test="${booking.mid == movie.mid }">
								<td><img alt="${movie.mtitle }" src="${path }/poster/${movie.mtitle}"></td>
								<td>
									${movie.mtitle }(${movie.moriginaltitle })<br><br><br>
									
									<c:forEach var="location" items="${bookingLocationList }">
										<c:if test="${booking.lid == location.lid }">
											${location.lname }
										</c:if>
									</c:forEach>
									<c:forEach var="theater" items="${bookingTheaterList }">
										<c:if test="${booking.tid == theater.tid }">
											${theater.tname }<br>
										</c:if>
									</c:forEach>
									
									<c:forEach var="date" items="${bookingTheDateList }">
										<c:if test="${movie.mtitle ==  date.mtitle}">
											${date.theDate }&nbsp;&nbsp;&nbsp;${date.theTime }
										</c:if>
									</c:forEach>
								</td>
								</c:if>
							</c:forEach>
							
							<c:forEach var="booking2" items="${myBookingList }">
								<c:set var="sum1" value="0"/>
								<c:if test="${booking.ticketnumber == booking2.ticketnumber}">
									${sum1 = sum1 + 1 }
								</c:if>
							</c:forEach>
							
							<c:forEach var="price" items="${bookingPriceList }">
								<c:set var="sum2" value="0"/>
								<c:if test="${booking.pid == price.pid}">
									${sum2 = sum2 + price.price }
								</c:if>
							</c:forEach>
								
							<td>
								<c:forEach var="booking3" items="${myBookingList }">
									<c:if test="${booking.ticketnumber == booking3.ticketnumber}">
										${booking3.bseat }&nbsp;
									</c:if>
								</c:forEach>
								<br><br><br><br>${sum1 }명, ${sum2 }원
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="active" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
						<li class="" id=""><a href="mypage_myPoint.do" class="" id="">나의 포인트 내역</a></li>
						<li class="" id=""><a href="mypage_Modifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>