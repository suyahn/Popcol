<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
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
			<a class="" href="adminList.do"><img alt="logo"
				src="${ path }/images/popcol logo.png" width="200px"
				style="margin-top: -10px; margin-bottom: -10px;"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right" style="margin: 10px;">

				<c:if test="${empty id }">
					<li>
						<button class="btn btn-info btn-sm"
							onclick="location.href='adminLoginForm.do'"
							style="display: inline; border-color: #cd1726; background-color: #cd1726;">
							로그인</button>
					</li>
				</c:if>
				<%
					String id = (String) session.getAttribute("id");
					if (id != null ) { /* 아이디가 있을때 */
				%>
				<c:if test="${not empty id }">
					<li>${id }님환영합니다.
						<!-- <button onclick="location.href='mypage.do'"
							class="btn btn-info btn-sm"
							style="display: inline; border-color: navy; background-color: navy;">
							마이페이지</button> -->
						<button onclick="location.href='adminLogout.do'"
							class="btn btn-info btn-sm"
							style="display: inline;border-color: #cd1726; background-color: #cd1726;">
							로그아웃</button>
					</li>
				</c:if>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class=""><a href="adminList.do">영화관리</a></li>
					<li class=""><a href="adminLocationList.do">극장관리</a></li>
					<li class=""><a href="adminTTList.do">상영시간표</a></li>
					<li class=""><a href="adminCustomerList.do">회원관리</a></li>
					<li class=""><a href="adminEventList.do">이벤트관리</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 고객센터<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminNoticeList.do">공지사항</a></li>
							<li><a href="adminFaqList.do">FAQ</a></li>
							<li><a href="adminQnaList.do">QnA</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

</body>
</html>