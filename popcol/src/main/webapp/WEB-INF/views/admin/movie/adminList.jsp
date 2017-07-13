<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<style type="text/css">
th {
	text-align: center;
}
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
	<div class="container" align="center">
		<h2>
			<img src="location/logo.png" width="250" height="70"> 영화 리스트
		</h2>
		<table class="table table-hover">
			<tr>
				<th>No</th>
				<th width="50%">제목</th>
				<th>감독</th>
				<th>국가</th>
			</tr>

			<c:if test="${empty adminList}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			
			<c:if test="${not empty adminList }">
				<c:set var="no" value="${no }"></c:set>
				<c:forEach var="movie" items="${adminList}">
					<tr>
						<td style="text-align: center;">${no}</td>
						<td>
							<a href="adminView.do?mid=${movie.mid}&pageNum=${pp.currentPage}" class="btn btn-link red-active">
							${movie.mtitle}(${movie.moriginaltitle })
							</a>
						</td>
						<td style="text-align: center;">${movie.mdirector }</td>
						<td style="text-align: center;">${movie.mnation }</td>
						<c:set value="${no-1 }" var="no" />
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
		<div align="right">
			<button type="button" class="btn btn-info btn-sm"
				style="display: inline; border-color: #cd1726; background-color: #cd1726;"
				onclick="location.href='adminInsertForm.do?pageNum=${ pageNum }'">
				영화입력</button>
		</div>
		<ul class="pagination">
			<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
				<li><a href="adminList.do?pageNum=${pp.startPage - 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="active" </c:if>><a
					href="adminList.do?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totPage}">
				<li><a href="adminList.do?pageNum=${pp.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>