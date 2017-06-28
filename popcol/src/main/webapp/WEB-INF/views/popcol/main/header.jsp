<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<script type="text/javascript">
	$(function() {
		$('ul.nav li.dropdown').hover(
				function() {
					$(this).find('.dropdown-menu').stop(true, true).delay(200)
							.fadeIn(500);
				},
				function() {
					$(this).find('.dropdown-menu').stop(true, true).delay(200)
							.fadeOut(500);
				});
	});
</script>
</head>
<body> 
	<nav class="navbar" style="margin-top: 10px;">
		<div class="navbar-header">
	    	<a class="" href="home.do"><img alt="logo" src="${ path }/images/popcol logo.png" width="200px" style="margin-top: -10px; margin-bottom: -10px;"></a>
	   	</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
			<ul class="nav navbar-nav navbar-right" style="margin: 10px;">
			
			<c:if test="${empty id }">
				<li>
					<button class="btn btn-info btn-sm" onclick="location.href='loginForm.do'" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							로그인
					</button>
				</li>
			</c:if>
			
			<c:if test="${not empty id }">
				<c:if test="${not empty birthday }">
					<li>
						<img alt="fireworks" src="${ path }/images/fireworks${random}.gif" width="70px" style="margin-top: -10px; margin-bottom: -10px;">
						<font color="#cd1726">${name }님~</font>
						<font color="red">생</font>
						<font color="orange">일</font>
						<font color="yellow">을&nbsp;</font>
						<font color="green">축</font>
						<font color="blue">하</font>
						<font color="#cd1726">합</font>
						<font color="violet">니</font>
						<font color="red">다.&nbsp;</font>
						<c:if test="${checkPoint == 'n' }">
							<font color="red">마</font>
							<font color="orange">이</font>
							<font color="yellow">페</font>
							<font color="green">이 </font>
							<font color="blue">지</font>
							<font color="#cd1726">를&nbsp;</font>
							<font color="violet">확</font>
							<font color="red">인</font>
							<font color="orange">해</font>
							<font color="yellow">주</font>
							<font color="green">세</font>
							<font color="blue">요~</font>
						</c:if>
						<img alt="fireworks" src="${ path }/images/fireworks${random}.gif" width="70px" style="margin-top: -10px; margin-bottom: -10px;">
						
						<button onclick="location.href='mypage_Main.do'" class="btn btn-info btn-sm" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							마이페이지
						</button>
						<button onclick="location.href='logout.do'" class="btn btn-info btn-sm" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							로그아웃
						</button>
					</li>
				</c:if>
				
				<c:if test="${empty birthday }">
					<li>
						${name }님 환영합니다.
						<button onclick="location.href='mypage_Main.do'" class="btn btn-info btn-sm" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							마이페이지
						</button>
						<button onclick="location.href='logout.do'" class="btn btn-info btn-sm" style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							로그아웃
						</button>
					</li>
				</c:if>
			</c:if>
			</ul>
		</div>
	</nav>


	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown" style="margin-right: 100px; margin-left: 150px;">
						<a href="movieChart.do" class="dropdown-toggle head" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							영화<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="movieChart.do" class="head">무비 차트</a></li>
							<li><a href="nowMovies.do" class="head">현재 상영작</a></li>
							<li><a href="preMovies.do" class="head">개봉 예정작</a></li>
						</ul>
					</li>
					
					<li class="dropdown" style="margin-right: 100px; margin-left: 100px;">
						<a href="reservation.do" class="dropdown-toggle head" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							예매<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="reservation.do" class="head">빠른 예매</a></li>
							<li><a href="${ path }/gathering/lala.jsp" class="head">상영 시간표</a></li>
						</ul>
					</li>
					
					 <li class="">
					 	<a href="eventList.do" class="head" style="margin-right: 100px; margin-left: 100px;">이벤트</a>
					 </li>
					
					<li class="dropdown" style="margin-right: 150px; margin-left: 100px;">
						<a href="noticeList.do" class="dropdown-toggle head" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							고객센터<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="noticeList.do" class="head">공지사항</a></li>
							<li><a href="faqList.do" class="head">자주하는 질문</a></li>
							<li><a href="qnaList.do" class="head">1:1 문의</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>