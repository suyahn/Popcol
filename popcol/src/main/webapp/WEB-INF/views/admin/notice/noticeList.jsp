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
			<a href='adminNoticeList.do' class="red-active">공지사항</a>
		</h1>
		<hr>
		<div align="right">
			<form action="adminNoticeList.do">
				<input type="hidden" name="pageNum" value="1"> <select
					name="search" style="height: 25px;">
					<option value="nsubject"
						<c:if test="${ search eq 'nsubject' }">selected="selected"</c:if>>제목</option>
					<option value="ncontent"
						<c:if test="${ search eq 'ncontent' }">selected="selected"</c:if>>내용</option>
					<option value="subcon"
						<c:if test="${ search eq 'subcon' }">selected="selected"</c:if>>제목+내용</option>
				</select> <input type="text" name="keyword" value="${ keyword }">
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</div>
		<table class="table table-hover">
			<tr>
				<th width="10%">번호</th>
				<th>제목</th>
				<th width="20%">작성일</th>
			</tr>
			<c:if test="${ empty list }">
				<tr>
					<th colspan="3" style="text-align: center;">데이터가 없습니다.</th>
				</tr>
			</c:if>
			
			<c:if test="${ not empty list }">
				<c:set var="no1" value="${ no }"></c:set>
				<c:forEach var="notice" items="${ list }">
					<tr>
						<td>${ no1 }</td>
						<td>
							<button
								onclick="location.href='adminNoticeView.do?nid=${ notice.nid }&pageNum=${ pageNum }'"
								class="btn btn-link red-active">${ notice.nsubject }</button>
						</td>
						<td><fmt:formatDate value="${ notice.ndate }"
								pattern="yyyy.MM.dd" /></td>
					</tr>
					<c:set var="no1" value="${ no1 - 1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>

		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='adminNoticeInsertForm.do?pageNum=${ pageNum }'"
				style="border-color: #CD1726; background-color: #CD1726;">글작성</button>

			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${ not empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li><a
									href="adminNoticeList.do?pageNum=${ pp.startPage - 1 }&search=${ search }&keyword=${ keyword }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="i" begin="${ pp.startPage }"
								end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a
									href="adminNoticeList.do?pageNum=${ i }&search=${ search }&keyword=${ keyword }">${ i }</a>
							</c:forEach>

							<c:if test="${ pp.endPage < pp.totPage }">
								<li><a
									href="adminNoticeList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }&search=${ search }&keyword=${ keyword }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</c:if>

						<c:if test="${ empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li><a
									href="adminNoticeList.do?pageNum=${ pp.startPage - 1 }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="i" begin="${ pp.startPage }"
								end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a
									href="adminNoticeList.do?pageNum=${ i }">${ i }</a>
							</c:forEach>

							<c:if test="${ pp.endPage < pp.totPage }">
								<li><a
									href="adminNoticeList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>