<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	 .red-active { color: black; text-decoration: none;}
 	.red-active:hover { color: #CD1726; text-decoration: underline; font-weight: bold;}
</style>
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;"><a href='faqList.do' class="red-active">자주하는 질문</a></h1>
		<hr>
		<div align="right">
			<form action="faqList.do">
				<input type="hidden" name="pageNum" value="1">
				<select name="search" style="height: 25px;">
					<option value="fquestion" <c:if test="${ search eq 'fquestion' }">selected="selected"</c:if>>질문</option>
					<option value="fanswer" <c:if test="${ search eq 'fanswer' }">selected="selected"</c:if>>답변</option>
					<option value="queanw" <c:if test="${ search eq 'queanw' }">selected="selected"</c:if>>질문+답변</option>
				</select>
				<input type="text" name="keyword" value="${ keyword }">
				<button type="submit" class="btn btn-default">
  					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</div>
		<table class="table table-hover">
			<tr>
				<th width="20%">번호</th>
				<th>질문</th>
			</tr>
			<c:if test="${ empty list }">
				<tr>
					<th colspan="2" style="text-align: center;">데이터가 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${ not empty list }">
				<c:set var="no1" value="${ no }"></c:set>
				<c:forEach var="faq" items="${ list }">
					<tr>
						<td>${ no1 }</td>
						<td>
							<button onclick="location.href='faqView.do?fid=${ faq.fid }&pageNum=${ pageNum }'" 
								class="btn btn-link red-active">${ faq.fquestion }</button>
						</td>
					</tr>
					<c:set var="no1" value="${ no1 - 1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 아이디가 마스터면 -->
		<div align="right">
			<button type="button" class="btn btn-primary" onclick="location.href='faqInsertForm.do?pageNum=${ pageNum }'"
				style="border-color: #CD1726; background-color: #CD1726;">글 작성</button>
			
			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${ not empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="faqList.do?pageNum=${ pp.startPage - 1 }&search=${ search }&keyword=${ keyword }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a href="faqList.do?pageNum=${ i }&search=${ search }&keyword=${ keyword }">${ i }</a>
							</c:forEach>
							
							<c:if test="${ pp.endPage < pp.totPage }">
								<li>
									<a href="faqList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }&search=${ search }&keyword=${ keyword }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</c:if>
						</c:if>
						
						<c:if test="${ empty keyword }">
							<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
								<li>
									<a href="faqList.do?pageNum=${ pp.startPage - 1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
								<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a href="faqList.do?pageNum=${ i }">${ i }</a>
							</c:forEach>
							
							<c:if test="${ pp.endPage < pp.totPage }">
								<li>
									<a href="faqList.do?pageNum=${ pp.startPage + pp.PAGE_PER_BLOCK }" aria-label="Next">
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