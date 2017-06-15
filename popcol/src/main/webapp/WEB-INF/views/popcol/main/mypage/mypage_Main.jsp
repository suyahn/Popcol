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
		
		$('a', '.mypage').click(function() {
			var id = $(this).attr('id');
			$('#view').load(id + '.do');
			
			// 기존 active되어있던 li 클래스에서 active 빼주기
			var className = $(this).attr('class');
			$('.active').attr('class', className);

			// 클린된 li 클래스에 active 넣어주기
			$('#' + id + "_li").attr('class', 'active ' + className);
		});
		

		$('#view').load('mypage_Home.do');
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
			
			<div class="col-sm-9 col-sm-push-3 contentAreaStyle" id="view">
			
			</div>
			
			<!-- sidebar area start -->
			<div class="col-sm-3 col-sm-pull-9 ">
				<div class="text-xs-center text-sm-left">			
					<ul class="nav nav-stacked menu">
						<li class="active mypage" id="mypage_Home_li"><a href="#" class="mypage" id="mypage_Home">My PopCol Home</a></li>
						<li class="mypage" id="mypage_reservation_li"><a href="#" class="mypage" id="mypage_reservation">나의 예매내역</a></li>
						<li class="mypage" id="mypage_seeMovie_li"><a href="#" class="mypage" id="mypage_seeMovie">내가 본 영화</a></li>
						<li class="mypage" id="mypage_myPoint_li"><a href="#" class="mypage" id="mypage_myPoint">나의 포인트 내역</a></li>
						<li class="mypage" id="mypage_myInfoModify_li"><a href="#" class="mypage" id="mypage_myInfoModify">회원 정보 수정</a></li>
						<li class="mypage" id="mypage_byePopcol_li"><a href="#" class="mypage" id="mypage_byePopcol">회원 탈퇴</a></li>
						<li class="mypage" id="mypage_myQna_li"><a href="#" class="mypage" id="mypage_myQna">나의 문의 내역</a></li>
					</ul>
				</div>
			</div>
			<!-- sidebar area end -->
    </div>
</body>
</html>