<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
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
		<h1 align="left" style="font-weight: bold;"><a href='qnaList.do' class="red-active">1:1 문의</a></h1>
		<hr>
		<table class="table table-hover">
			<tr>
				<th width="10%">번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:if test="${ empty list }">
				<tr>
					<th colspan="4" style="text-align: center;">데이터가 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${ not empty list }">
				<c:set var="no1" value="${ no }"></c:set>
				<c:forEach var="qna" items="${ list }">
					<tr>
						<td>${ no1 }</td>
						<td>
							<c:if test="${ id == qna.cid or id == 'master'}">
								<a href="qnaView.do?qid=${ qna.qid }&pageNum=${ pageNum }" 
								class="red-active">${ qna.qsubject }</a>
							</c:if>
							<c:if test="${ id != qna.cid and id != 'master'}">
								<span class="glyphicon glyphicon-lock" aria-hidden="true" style="color: gray;" title="글 작성자만 볼 수 있습니다."></span>
								${ qna.qsubject }
							</c:if>
						</td>
						<td>${ qna.cname }</td>
						<td width="20%">
							<fmt:parseDate value="${ qna.qdate }" var="qdate" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${ qdate }" pattern="yyyy.MM.dd"/>
						</td>
					</tr>
					<c:set var="no1" value="${ no1 - 1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
		
		<div align="right">
			<button type="button" class="btn btn-primary" onclick="location.href='qnaInsertForm.do?pageNum=${ pageNum }'"
				style="border-color: #CD1726; background-color: #CD1726;">글 작성</button>
			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
							<li>
								<a href="qnaList.do?pageNum=${ pp.startPage - 1 }" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						
						<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
							<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a href="qnaList.do?pageNum=${ i }">${ i }</a>
						</c:forEach>
						
						<c:if test="${ pp.endPage < pp.totPage }">
							<li>
								<a href="qnaList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>						
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>