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
<script type="text/javascript">
	$(function() {
		$('#pointPage').load("pointPage.do");
	});
</script>
</head>
<body>
	<div id="pointPage" style="width: 944px; margin-right: 50px; margin-left: 50px; margin-bottom: 30px !important; 
											margin: auto; background-image: URL(${path}/images/ticket.png); ">
	</div>

	 <div class="container-fluid " align="center" style="width: 80%; margin-bottom: 50px !important; margin: auto;">
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle">
				<c:if test="${result > 0 }">
					<div class="container" align="center" style="width: 800px;">
					<h2 class="text-primary" align="left" style="color: #cd1726;">회원 정보 수정</h2>
					
					<hr>
					
					<h6 class="text-primary" style="color: #cd1726;">회원 정보 수정이 완료되었습니다.</h6>
					
					<br>
					<br>
					
					<button onclick="location.href='mypage_Main.do'" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">마이페이지</button>
					<button onclick="location.href='home.do'" class="btn btn-default btn-sm">메인</button>
					
					</div>
				</c:if>
				
				<c:if test="${result <= 0 }">
					<script type="text/javascript">
						alert("회원 정보 수정을 다시 시도해주세요.");
						history.go(-1);
					</script>
				</c:if>
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="" id=""><a href="mypage_Main.do" class="" id="">My PopCol Home</a></li>
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
						<li class="" id=""><a href="mypage_myPoint.do" class="" id="">나의 포인트 내역</a></li>
						<li class="active" id=""><a href="mypage_myInfoModifyintro.do" class="" id="">회원 정보 수정</a></li>
						<li class="" id=""><a href="mypage_byePopcolForm.do" class="" id="">회원 탈퇴</a></li>
						<li class="" id=""><a href="mypage_myQna.do" class="" id="">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>