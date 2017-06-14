<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
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
				<li>
					${customer.cname }님 환영합니다.
					<button onclick="location.href='mypage.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
						마이페이지
					</button>
					<button onclick="location.href='logout.do'" class="btn btn-info btn-sm" style="display: inline; border-color: navy; background-color: navy;">
						로그아웃
					</button>
				</li>
			</c:if>
			</ul>
		</div>
	</nav>


	
</body>
</html>