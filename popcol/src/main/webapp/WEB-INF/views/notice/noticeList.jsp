<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container" align="center">
		<h1 align="left"><a href='noticeList.do'>공지사항</a></h1>
		<div align="right">
			<form action="noticeList.do">
				<input type="hidden" name="pageNum" value="1">
				<select name="search" style="height: 25px;">
					<option value="nsubject" <c:if test="${ search eq 'nsubject' }">selected="selected"</c:if>>제목</option>
					<option value="ncontent" <c:if test="${ search eq 'ncontent' }">selected="selected"</c:if>>내용</option>
					<option value="subcon" <c:if test="${ search eq 'subcon' }">selected="selected"</c:if>>제목+내용</option>
				</select>
				<input type="text" name="keyword" value="${ keyword }">
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
					<th colspan="3" style="text-align: center;">공지사항이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${ not empty list }">
				<c:set var="no1" value="${ no }"></c:set>
				<c:forEach var="notice" items="${ list }">
					<tr>
						<td>${ no1 }</td>
						<td>
							<a href="noticeView.do?num=${ notice.nid }&pageNum=${ pageNum }" class="btn btn-link">${ notice.nsubject }</a>
						</td>
						<td>${ notice.ndate }</td>
					</tr>
					<c:set var="no1" value="${ no1 - 1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 아이디가 마스터면 -->
		<div align="left">
			<button type="button" class="btn btn-primary" onclick="location.href='noticeInsertForm.do?pageNum=${ pageNum }'"
					style="border-color: #EBCDD5; background-color: #EBCDD5;">글 작성</button>
			
			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${ not empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="noticeList.do?pageNum=${ pp.startPage - 1 }&search=${ search }&keyword=${ keyword }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a href="noticeList.do?pageNum=${ i }&search=${ search }&keyword=${ keyword }">${ i }</a>
							</c:forEach>
							
							<c:if test="${ pp.endPage < pp.totPage }">
								<li>
									<a href="noticeList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }&search=${ search }&keyword=${ keyword }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</c:if>
						</c:if>
						
						<c:if test="${ empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="noticeList.do?pageNum=${ pp.startPage - 1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a href="noticeList.do?pageNum=${ i }">${ i }</a>
							</c:forEach>
							
							<c:if test="${ pp.endPage < pp.totPage }">
								<li>
									<a href="noticeList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</c:if>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>