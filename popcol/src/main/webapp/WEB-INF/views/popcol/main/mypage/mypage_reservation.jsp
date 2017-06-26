<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<%@ include file="mypage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#pointPage').load("pointPage.do");

		// 영화 예매 취소하기
		$('.cancel').click(function() {
			var id = $(this).attr('id');
			var formData = 'ticketnumber=' + id;
			
			$.post('cancelBooking.do', formData, function(result) {
				if (result > 0) {
					alert("예매가 취소되었습니다.");
					location.href="mypage_reservation.do";
				} else if (result <= 0) {
					alert("다시 시도해주세요.")
				}
			})
		});
	});
</script>
</head>
<body>
	<div id="pointPage" style="width: 70%; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; 
											margin: auto; background-image: URL(${path}/images/ticket.png); ">
	</div>
	
	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
			<div class="container" style="width: 800px;">
				<div style="margin-bottom: 50px;">
					<h4 align="left" style="color: #cd1726;">나의 예매 내역</h4>
					<h6 align="left" style="color: #cd1726;">지난 한달 간의 예매 내역입니다.</h6>
					
					<table class="table ">
						<c:if test="${not empty myBookingList }">
						<c:forEach var="booking" items="${myBookingList }">
							<tr>
								<td colspan="3"><font style="font-weight: bold;">예매번호&nbsp;&nbsp;${booking.ticketnumber }</font></td>
							</tr>
							
							<!-- 영화 가격과 관람인원구하기 -->
							<c:set var="countA" value="0" />
							<c:set var="countY" value="0" />
							<c:set var="countS" value="0" />
							<c:set var="sum" value="0" />
							
							<c:forEach var="ps" items="${MyPriceSeatList }">
								<c:if test="${booking.ticketnumber == ps.ticketnumber }">
									<c:set var="sum" value="${sum + ps.price }" />
									
									<c:if test="${ps.human == 'adult' }">
										<c:set var="countA" value="${countA + 1 }" />
									</c:if>
									
									<c:if test="${ps.human == 'youth' }">
										<c:set var="countY" value="${countY + 1 }" />
									</c:if>
									
									<c:if test="${ps.human == 'special' }">
										<c:set var="countS" value="${countS + 1 }" />
									</c:if>
								</c:if>
							</c:forEach>
						
							<tr>
								<td><img alt="${booking.mtitle }" src="${path }/poster/${booking.murlPoster}.jpg" width="120px"></td>
							
								<td>
									<font style="font-weight: bold;">
										<a href="movieDetail.do?mid=${booking.mid }" style="color: black !important;">${booking.mtitle }(${booking.moriginaltitle })</a>
									</font><br><br><br>
									<font size="2px">
									관람극장&nbsp;&nbsp;Popcorn&amp;Cola&nbsp;${booking.lname }&nbsp;&nbsp;
											<a href="#" style="color: black !important;">[극장정보]</a><br>
									관람일시&nbsp;&nbsp;<font color="#cd1726">${booking.theDate }&nbsp;(${booking.theDay })&nbsp;${booking.theTime }</font><br>
									상&nbsp;영&nbsp;관&nbsp;&nbsp;&nbsp;${booking.tname }<br>
									관람인원&nbsp;
										<c:if test="${countA > 0 }">
											어른${countA }&nbsp;
										</c:if>
										
										<c:if test="${countY > 0 }">
											어린이${countY }&nbsp;
										</c:if>
										
										<c:if test="${countS > 0 }">
											우대${countS }&nbsp;
										</c:if>
										<br>
										
									관람좌석&nbsp;
										<c:forEach var="ps" items="${MyPriceSeatList }">
											<c:if test="${booking.ticketnumber == ps.ticketnumber }">
												${ps.bseat }&nbsp;
											</c:if>
										</c:forEach>
										<br>
									티켓가격&nbsp;&nbsp;${sum }</font>
								</td>
								
								<td>
									<br><br><br><br><br><br><br>
									<c:if test="${booking.rtdate >= today }">
									<button id="${booking.ticketnumber }" class="btn btn-info btn-sm cancel" style="border-color: #cd1726; background-color: #cd1726; float: right;">
									<%-- 예매번호&nbsp;${booking.ticketnumber }&nbsp; --%>예매취소
									</button>
									</c:if>
									<c:if test="${booking.rtdate < today }">
									<h6 style="color: #cd1726;" align="right">상영이 지난 영화입니다.</h6>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty myBookingList }">
							<tr>
								<td colspan="3"><h4 style="color: #cd1726">예매내역이 없습니다.</h4></td>
							</tr>
						</c:if>
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
						<li class="" id=""><a href="mypage_myInfoModifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>