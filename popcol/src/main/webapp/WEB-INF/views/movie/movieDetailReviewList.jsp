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
<script type="text/javascript">
	function pageMove(pageNum) {
		var formData = "mid=${ mid }" + "&pageNum=" + pageNum;
		$.post("movieDetailReviewList.do", formData, function(data) {
			$('#movieDetailReviewList').html(data);
		});
	}
</script>
</head>
<body>
	<div class="container" align="center" style="width: 100%">
		<table class="table">
			<c:if test="${ empty reviewList }">
				<tr>
					<th style="text-align: center;">후기가 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${ not empty reviewList }">
				<c:forEach var="review" items="${ reviewList }">
					<tr>
						<td width="100">
							<c:if test="${ review.rvaluation == 'g' }">
								<img alt="good" src="images/good.png" width="80" height="30" style="margin-top: 20px;">
							</c:if>
							<c:if test="${ review.rvaluation == 'b' }">
								<img alt="bad" src="images/bad.png" width="80" height="30" style="margin-top: 20px;">
							</c:if>
						</td>
						<td>
							<p>
								<font size="5" style="font-weight: bold;">${ review.cid }</font>   
								<fmt:parseDate value="${ review.rdate }" var="rdate" pattern="yyyy-MM-dd"/>
								<font size="2" style="color: gray;">
									<fmt:formatDate value="${ rdate }" pattern="yyyy.MM.dd"/>
								</font>
							</p>
							<p>${ review.rcontent }</p>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<div align="center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${ pp.startPage > pp.PAGE_PER_BLOCK }">
						<li>
							<a aria-label="Previous" onclick="pageMove(${ pp.startPage - 1 })">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach var="i" begin="${ pp.startPage }" end="${ pp.endPage }">
						<li <c:if test="${ pp.currentPage == i }">class="active"</c:if>><a onclick="pageMove(${ i })">${ i }</a>
					</c:forEach>
					
					<c:if test="${ pp.endPage < pp.totPage }">
						<li>
							<a aria-label="Next" onclick="pageMove(${ pp.startPage + pp.PAGE_PER_BLOCK })">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>						
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>