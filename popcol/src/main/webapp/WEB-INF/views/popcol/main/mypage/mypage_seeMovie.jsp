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
		
		$('.reviewC').each(function() {
			
			$(this).load('mypage_Review.do', {'mid' : $(this).attr('id')});
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
					<h4 align="left"><a href="mypage_reservation.do">내가 본 영화</a></h4>
					
					<table class="table table-stripped">
						<c:if test="${not empty mySeeMovieList }">
						<c:forEach var="myMovie" items="${mySeeMovieList }">
							<tr>
								<td width="25%"><img alt="${myMovie.mtitle }" src="${path }/poster/${myMovie.murlposter }.jpg" width="150px"></td>
								<td colspan="4" style="text-align: left;">
									<div align="left">
										<font size="5px" style="font-weight: bold;">${myMovie.mtitle }${myMovie.mid }</font><br>
									
										<font size="2px">
										${myMovie.moriginaltitle }<br><br><br><br>
										${myMovie.theDate }&nbsp;(${myMovie.theDay })&nbsp;${myMovie.theTime }<br>
										Popcorn&amp;Cola&nbsp;${myMovie.lname }&nbsp;${myMovie.tname }&nbsp;/&nbsp;${myMovie.peopleC }명<br><br><br>
										</font>
									</div>
									
									<div class="reviewC" id="${myMovie.mid }"></div>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty mySeeMovieList }">
							<tr>
								<td colspan="3"><h4 style="color: #cd1726">관람하신 영화가 없습니다.</h4></td>
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
						<li class="" id=""><a href="mypage_reservation.do" class="" id="">나의 예매내역</a></li>
						<li class="active" id=""><a href="mypage_seeMovie.do" class="" id="">내가 본 영화</a></li>
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