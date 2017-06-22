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
					<h4 align="left"><a href="mypage_reservation.do">나의 포인트 내역</a></h4>
					
					<table>
						<tr>
							<td>구매 구분</td>
							<td>구매 극장</td>
							<td>적립일</td>
							<td>적립</td>
						</tr>
					
						<c:if test="${empty pointList }">
							<tr>
								<td colspan="4">포인트 내역이 없습니다.</td>
							</tr>
						</c:if>
					
						<c:if test="${not empty pointList }">
						<c:forEach var="point" items="${pointList }">
							<tr>
								<td>${point.psort }</td>
								<td>${point.lname }</td>
								<td>
									<fmt:parseDate value="${point.pdate }" var="pdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${pdate }" pattern="yyyy.MM.dd"/>
								</td>
								<td>${point.ppoint }</td>
							</tr>
						</c:forEach>
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