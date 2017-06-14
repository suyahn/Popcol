<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">영화 리스트</h2>
		<table class="table table-hover">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>원제</th>
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
						<td>${no}</td>
						<td><a href="movieList.do?mtitle=${movie.mtitle}"
							class="btn btn-info">${movie.mtitle}</a></td>
						<td>${movie.moriginaltitle }</td>
						<td>${movie.mdirector }</td>
						<td>${movie.mnation }</td>
						<c:set value="${no-1 }" var="no" />
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<ul class="pagination">
			<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
				<li><a href="adminList.do?pageNum=${pp.startPage - 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
					href="adminList.do?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totPage}">
				<li><a href="adminList.do?pageNum=${pp.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
		<a href="adminInsertForm.do" class="btn btn-info">영화입력</a>
	</div>
</body>
</html>