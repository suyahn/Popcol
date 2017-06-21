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
					<h4 align="left"><a href="mypage_reservation.do">나의 예매 내역</a></h4>
					
					<table class="table ">
						<c:if test="${not empty myBookingList }">
						<c:forEach var="booking" items="${myBookingList }">
							<tr>
								<td>예매번호<br><br><br><br><br><font style="font-weight: bold;">${booking.ticketnumber }</font></td>
							
								<td><img alt="${booking.mtitle }" src="${path }/poster/${booking.murlposter}.jpg" width="90px">
							
								<td>
									<font style="font-weight: bold;">${booking.mtitle }(${booking.moriginaltitle })</font><br><br><br><br>
									<font size="2px">
									Popcorn&amp;Cola&nbsp;${booking.lname }&nbsp;${booking.tname }&nbsp;&nbsp;
											<a href="#" style="color: black !important;">[극장정보]</a><br>
									${booking.theDate }&nbsp;(${booking.theDay })&nbsp;${booking.theTime }</font>
								</td>
							
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
							
							
								<td>
									<font size="2px"><br><br>
									<c:forEach var="ps" items="${MyPriceSeatList }">
										<c:if test="${booking.ticketnumber == ps.ticketnumber }">
											${ps.bseat }&nbsp;
										</c:if>
									</c:forEach>
									
									<br><br><br>
									
									<c:if test="${countA > 0 }">
										어른${countA }&nbsp;
									</c:if>
									
									<c:if test="${countY > 0 }">
										어린이${countY }&nbsp;
									</c:if>
									
									<c:if test="${countS > 0 }">
										우대${countS }&nbsp;
									</c:if>
									
									<br>${sum }원</font>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty myBookingList }">
							<tr>
								<td colspan="4"><h4 style="color: #cd1726">예매내역이 없습니다.</h4></td>
							</tr>
						</c:if>
					</table>
				</div>
				
				<hr>
				
				<div style="margin-bottom: 50px;">
					<h4 align="left"><a href="mypage_myPoint.do">나의 포인트 내역</a></h4>
					
					<table class="table ">
						<tr>
							<td>날짜</td>
							<td>포인트 사용내역</td>
							<td>포인트 내역 (+7000, -2000 이렇게)</td>
						</tr>
					</table>
				</div>
				
				<hr>
				
				<div style="margin-bottom: 50px;">
					<h4 align="left"><a href="mypage_myQna.do">나의 문의 내역</a></h4>
					
					<table class="table ">
						<tr>
							<td>작성날짜</td>
							<td>[답변상태]</td>
							<td>질문제목(하이퍼링크는 고민해보고)</td>
						</tr>
					</table>
				</div>
			</div>
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="active" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
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