<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
th, td {
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
	<div class="container" style="width: 800px;">
		<h2 style="font-weight: bold;">
			<img src="location/logo.png" width="250" height="70">이벤트
		</h2>
		<hr>

		<div align="right">
			<form action="adminEventList.do">
				<input type="hidden" name="pageNum" value="1"> <select
					name="search" style="height: 25px;">
					<option value="esubject"
						<c:if test="${ search eq 'esubject' }">selected="selected"</c:if>>제목</option>
					<option value="econtent"
						<c:if test="${ search eq 'econtent' }">selected="selected"</c:if>>내용</option>
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
				<th>No</th>
				<th>제목</th>
				<th>이벤트 기간</th>

			</tr>

			<c:if test="${ empty eventList }">
				<h2 style="font-weight: bold;">현재 해당되는 이벤트가 없습니다.</h2>
			</c:if>
			
			<c:if test="${not empty eventList }">
				<c:set var="no" value="${no }"></c:set>
				<c:forEach var="event" items="${eventList}">
					<tr>
						<td>${no}</td>
						<td><a
							href="adminEventView.do?eid=${event.eid}&pageNum=${pp.currentPage}"
							class="red-active">${event.esubject}</a></td>
						<td>${event.estartingdate }~ ${event.eclosingdate }</td>


						<c:set value="${no-1 }" var="no" />
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<%-- <c:if test="${ not empty eventList }">
			<c:forEach var="event" items="${ eventList }">
				<div class="media" style="border: 0.5px solid lightgray; border-radius: 10px; width: 70%; margin-left: 100px;">
					<div class="media-left" style="width: 200px; height: 150px; vertical-align: middle;">
						<a href="eventView.do?eid=${ event.eid }&pageNum=${ pageNum }">
							<c:if test="${ empty event.epicture }">
								<img class="media-object" src="images/event_default.jpg" alt="${ event.epicture }" width="200">
							</c:if>
							<c:if test="${ not empty event.epicture }">
								<img class="media-object" src="images/${ event.epicture }" alt="${ event.epicture }" width="200">
							</c:if>
						</a>
					</div>
					<div class="media-body" style="vertical-align: middle;">
						<h4 class="media-heading" style="font-weight: bold;">
							<a href="adminEventView.do?eid=${ event.eid }&pageNum=${ pageNum }" class="red-active">${ event.esubject }</a>
						</h4>
						<p><font color="gray">기간 : <fmt:formatDate value="${ event.estartingdate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ event.eclosingdate }" pattern="yyyy.MM.dd"/></font></p>
					</div>
				</div>
			</c:forEach>
		</c:if> --%>

		<!-- 아이디가 마스터면 -->
		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='adminEventInsertForm.do?pageNum=${ pageNum }'"
				style="border-color: #CD1726; background-color: #CD1726;">이벤트
				작성</button>

			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${ not empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li><a
									href="adminEventList.do?pageNum=${ pp.startPage - 1 }&search=${ search }&keyword=${ keyword }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="i" begin="${ pp.startPage }"
								end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a
									href="adminEventList.do?pageNum=${ i }&search=${ search }&keyword=${ keyword }">${ i }</a>
							</c:forEach>

							<c:if test="${ pp.endPage < pp.totPage }">
								<li><a
									href="adminEventList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }&search=${ search }&keyword=${ keyword }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</c:if>

						<c:if test="${ empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li><a
									href="adminEventList.do?pageNum=${ pp.startPage - 1 }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="i" begin="${ pp.startPage }"
								end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a
									href="adminEventList.do?pageNum=${ i }">${ i }</a>
							</c:forEach>

							<c:if test="${ pp.endPage < pp.totPage }">
								<li><a
									href="adminEventList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }"
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