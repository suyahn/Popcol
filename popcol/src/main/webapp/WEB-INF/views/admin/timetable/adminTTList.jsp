<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
.red-active {
	color: black;
	text-decoration: none;
}

.red-active:hover {
	color: #CD1726;
	text-decoration: underline;
	font-weight: bold;
}

.pagination>li>a {
	color: #cd1726 !important;
}

.pagination>li>a:hover {
	color: #fcba2e !important;
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
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;">
			<img src="location/logo.png" width="250" height="70"> <a
				href='adminTTList.do' class="red-active">상영시간표</a>
		</h1>
		<hr>
		<div align="right">
			<form action="adminTTList.do">
				<input type="hidden" name="pageNum" value="1"> <%-- <select
					name="search" style="height: 25px;">
					<option value="0">전체보기</option>
					<c:forEach var="runningtimetable" items="locationList">

						<option value="${runningtimetable.lid }" selected="selected">${runningtimetable.lname }</option>
					</c:forEach>
					<option value="location"
						<c:if test="${ search eq 'fquestion' }">selected="selected"</c:if>>${runningtimetable.tname }</option>
				</select> --%>
				
				<input type="text" name="keyword" value="${ keyword }">
				
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</div>
		<table class="table table-hover">
			<tr>
				<th width="20%">번호</th>
				<th>날짜</th>
				<th>상영관</th>
			</tr>
			<c:if test="${ empty adminTTList }">
				<tr>
					<th colspan="2" style="text-align: center;">데이터가 없습니다.</th>
				</tr>
			</c:if>

			<c:if test="${ not empty adminTTList }">
				<c:set var="no1" value="${ no }"></c:set>
				<c:forEach var="runningtimetable" items="${ adminTTList }">
					<tr>
						<td>${ no1 }</td>
						<td>
							<button
								onclick="location.href='adminTTView.do?rtid=${ runningtimetable.rtid }&pageNum=${ pageNum }'"
								class="btn btn-link red-active">${ runningtimetable.rtdate }</button>
						</td>
						<td>${runningtimetable.lname}</td>
					</tr>
					<c:set var="no1" value="${ no1 - 1 }"></c:set>
				</c:forEach>
			</c:if>

		</table>

		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='adminTTInsertForm.do?pageNum=${ pageNum }'"
				style="border-color: #CD1726; background-color: #CD1726;">상영시간표입력</button>

			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
							<li><a href="adminTTList.do?pageNum=${pp.startPage - 1}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
							<li <c:if test="${pp.currentPage==i}">class="active" </c:if>><a
								href="adminTTList.do?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${pp.endPage < pp.totPage}">
							<li><a href="adminTTList.do?pageNum=${pp.endPage + 1}">다음</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>