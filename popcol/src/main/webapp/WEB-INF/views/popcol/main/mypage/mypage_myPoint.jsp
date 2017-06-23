<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="../../header.jsp" %>
<%@ include file="verticaltab.jsp" %>
<%@ include file="mypage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td, th {
	text-align: center !important;
}

.pagination>li.active>a {
  background: #cd1726;
  border-color: #cd1726;
  color: white !important;
}

.pagination>li.active>a:hover {
  background: #fcba2e;
  border-color: #fcba2e;
  color: white !important;
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
					
					<br>
					<br>
					
					<table class="table table-hover">
					<tr>
						<th width="20%">구매 구분</th>
						<th>구매 극장</th>
						<th>적립일</th>
						<th>적립</th>
					</tr>
					
					<c:if test="${empty pointList }">
						<tr>
							<th colspan="4" style="text-align: center;">포인트 내역이 없습니다.</th>
						</tr>
					</c:if>
					
					<c:if test="${not empty pointList }">
					<c:forEach var="point" items="${pointList }">
						<tr>
							<td>${point.psort }</td>
							
							<c:if test="${point.lname == null }">
								<td>온라인</td>
							</c:if>
							
							<c:if test="${not empty point.lname }">
								<td>${point.lname }</td>
							</c:if>
							
							<td width="20%">
								<fmt:parseDate value="${point.pdate }" var="pdate" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${pdate }" pattern="yyyy.MM.dd"/>
							</td>
							
							<td>${point.ppoint }점</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
				
				<div align="center">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm">
							<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="mypage_myPoint.do?pageNum=${pp.startPage - 1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${pp.startPage }" end="${pp.endPage }">
								<li <c:if test="${pp.currentPage == i }">class="active"</c:if>><a href="mypage_myPoint.do?pageNum=${ i }">${ i }</a>
							</c:forEach>
							
							<c:if test="${pp.endPage < pp.totPage }">
								<li>
									<a href="mypage_myPoint.do?pageNum=${pp.startPage + pp.PAGE_PER_BLOCK }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			</div>
		</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
						<li class="active" id=""><a href="mypage_myPoint.do" class="" id="">나의 포인트 내역</a></li>
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