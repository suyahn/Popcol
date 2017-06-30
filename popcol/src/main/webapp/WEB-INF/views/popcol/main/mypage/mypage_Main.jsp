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
<style type="text/css">
.red-active {
	color: black  !important;
	text-decoration: none;
}

.red-active:hover {
	color: #cd1726  !important;
	text-decoration: underline;
	font-weight: bold;
}
</style>
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
							
								<td><img alt="${booking.mtitle }" src="${path }/poster/${booking.murlPoster}.jpg" width="90px">
							
								<td>
									<font style="font-weight: bold;">
										<a href="movieDetail.do?mid=${booking.mid }" style="color: black !important;">${booking.mtitle }(${booking.moriginaltitle })</a>
									</font><br><br><br><br>
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
									<font size="2px">
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
									
									<br><br>
									<c:if test="${empty pointList }">
										<br>실결제금액&nbsp;&nbsp;${sum }원<br><br>
									</c:if>
									
									<c:if test="${not empty pointList }">
									<c:forEach var="point" items="${pointList }">
										<c:if test="${point.bid == booking.bid }">
											실결제금액&nbsp;&nbsp;${sum - point.ppoint}원<br>
											포인트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${point.ppoint }원
										</c:if>
										
										<c:if test="${point.bid != booking.bid }">
											<br>실결제금액&nbsp;&nbsp;${sum }원<br><br>
										</c:if>
									</c:forEach>
									</c:if>
									</font>
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
						<c:if test="${not empty myPointList }">
						<c:forEach var="point" items="${myPointList }">
							<tr>
								<td width="30%">
									<fmt:parseDate value="${point.pdate }" var="pdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${pdate }" pattern="yyyy.MM.dd"/>
								</td>
							
								<td>${point.psort }</td>
								
								<td>${point.ppoint }점</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty myPointList }">
							<tr>
								<td colspan="3"><h4 style="color: #cd1726">포인트 내역이 없습니다.</h4></td>
							</tr>
						</c:if>
					</table>
				</div>
				
				<hr>
				
				<div style="margin-bottom: 50px;">
					<h4 align="left"><a href="mypage_myQna.do">나의 문의 내역</a></h4>
					
					<table class="table ">
						<c:if test="${not empty myQnaList }">
						<c:forEach var="qna" items="${myQnaList }">
							<tr>
								<td>
									<fmt:parseDate value="${qna.qdate }" var="qdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${qdate }" pattern="yyyy.MM.dd"/>
								</td>
							
								<td>
									<c:if test="${empty qna.qreplycontent }">
										<img alt="wait" src="${path }/images/waitanswer.png" width="70px">
									</c:if>
									
									<c:if test="${not empty qna.qreplycontent }">
										<img alt="complete" src="${path }/images/completeanswer.png" width="70px">
									</c:if>
								</td>
								
								<td width="60%">
									<a href="mypage_myQnaShow.do?qid=${qna.qid }" class="red-active">${qna.qsubject }</a>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty myQnaList }">
							<tr>
								<td colspan="3"><h4 style="color: #cd1726">문의 내역이 없습니다.</h4></td>
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