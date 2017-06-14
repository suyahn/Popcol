<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
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
	    	<a class="" href="home.do"><img alt="logo" src="${ path }/images/popcol.png" width="70px" style="margin-top: -10px; margin-bottom: -10px;"></a>
	   	</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
			<ul class="nav navbar-nav navbar-right" style="margin: 10px;">
			
			<c:if test="${empty id }">
				<li>
					<button class="btn btn-info btn-sm" onclick="location.href='loginForm.do'" style="display: inline; border-color: navy; background-color: navy;">
							로그인
					</button>
				</li>
			</c:if>
			
			<c:if test="${not empty id }">
				<c:if test="${not empty birthday }">
					<li>
						<img alt="fireworks" src="${ path }/images/fireworks${random}.gif" width="50px" style="margin-top: -10px; margin-bottom: -10px;">
						<font color="navy">${name }님~</font>
						<font color="red">생</font>
						<font color="orange">일</font>
						<font color="yellow">을 </font>
						<font color="green">축</font>
						<font color="blue">하</font>
						<font color="navy">합</font>
						<font color="violet">니</font>
						<font color="red">다. </font>
						<font color="red">쿠</font>
						<font color="orange">폰</font>
						<font color="yellow">함</font>
						<font color="green">을 </font>
						<font color="blue">확</font>
						<font color="navy">인</font>
						<font color="violet">해</font>
						<font color="red">주</font>
						<font color="orange">세</font>
						<font color="yellow">요~</font>
						<img alt="fireworks" src="${ path }/images/fireworks${random}.gif" width="50px" style="margin-top: -10px; margin-bottom: -10px;">
						
						<button onclick="location.href='mypage_Main.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
							마이페이지
						</button>
						<button onclick="location.href='logout.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
							로그아웃
						</button>
					</li>
				</c:if>
				
				<c:if test="${empty birthday }">
					<li>
						${name }님 환영합니다.
						<button onclick="location.href='mypage_Main.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
							마이페이지
						</button>
						<button onclick="location.href='logout.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
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
					<li class="dropdown">
						<a href="movieChart.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							영화<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="movieChart.do">무비 차트</a></li>
							<li><a href="${ path }/gatheringCalendar/index.jsp">현재 상영작</a></li>
							<li><a href="${ path }/gatheringCalendar/index.jsp">개봉 예정작</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="reservation.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							예매<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="${ path }/gathering/lala.jsp">상영 시간표</a></li>
							<li><a href="reservation.do">빠른 예매</a></li>
						</ul>
					</li>
					
					 <li class="">
					 	<a href="adminList.do">이벤트</a>
					 </li>
					
					<li class="dropdown">
						<a href="noticeList.do" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							고객센터<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="noticeList.do">공지사항</a></li>
							<li><a href="${ path }/gatheringCalendar/index.jsp">FAQ</a></li>
							<li><a href="${ path }/gatheringCalendar/index.jsp">QnA</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>