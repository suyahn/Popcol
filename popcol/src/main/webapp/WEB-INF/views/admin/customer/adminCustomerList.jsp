<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
	<div class="container" align="center">
		<h2>
			<img src="location/logo.png" width="250" height="70"> 고객 리스트
		</h2>
		<table class="table table-hover">
			<tr>
				<th>No</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
			</tr>

			<c:if test="${empty adminCustomerList}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<%
				String id = (String) session.getAttribute("id");
				if (id != null) { /* 아이디가 있을때 */
			%>
			<c:if test="${not empty adminCustomerList }">
				<c:set var="no" value="${no }"></c:set>
				<c:forEach var="customer" items="${adminCustomerList}">
					<tr>
						<td>${no}</td>
						<td><a
							href="adminCustomerView.do?cid=${customer.cid}&pageNum=${pp.currentPage}"
							class="btn btn-default">${customer.cid}</a></td>
						<td>${customer.cname }</td>
						<td>${customer.cphone }</td>
						
						<c:set value="${no-1 }" var="no" />
					</tr>
				</c:forEach>
			</c:if>

			<%
				} else {
			%>
			<script type="text/javascript">
				location.href = "adminLoginForm.do"
			</script>
			<%
				}
			%>
		</table>
		<%-- <div align="left">
			<button type="button" class="btn btn-info btn-sm"
				style="display: inline; border-color: navy; background-color: navy;"
				onclick="location.href='adminInsertForm.do?pageNum=${ pageNum }'">
				영화입력</button>
		</div> --%>
		<ul class="pagination">
			<c:if test="${pp.startPage > pp.PAGE_PER_BLOCK }">
				<li><a href="adminCustomerList.do?pageNum=${pp.startPage - 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="active" </c:if>><a
					href="adminCustomerList.do?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totPage}">
				<li><a href="adminCustomerList.do?pageNum=${pp.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>