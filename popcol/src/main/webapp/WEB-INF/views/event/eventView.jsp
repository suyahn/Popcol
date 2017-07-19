<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container" align="center" style="width: 70%">
		<h1 align="left" style="font-weight: bold;">이벤트</h1>
		<hr>
		<table class="table">
			<tr style="background-color: #F0F0F0;">
				<td style="font-weight: bold;">${ event.esubject }</td>
				<td width="30%" align="right">
					<font color="gray" size="2">기간 : <fmt:formatDate value="${ event.estartingdate }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ event.eclosingdate }" pattern="yyyy.MM.dd"/></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<c:if test="${ empty event.epicture }">
						<img alt="event_default" src="images/event_default.jpg" width="50%">
					</c:if>
					<c:if test="${ not empty event.epicture }">
						<img alt="${ event.epicture }" src="images/${ event.epicture }" width="70%">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2"><pre style="white-space: none; height: 300px;">${ event.econtent }</pre></td>
			</tr>
		</table>
		
		<button type="button" onclick="location.href='eventList.do?pageNum=${ pageNum }'" class="btn btn-primary"
			style="border-color: #CD1726; background-color: #CD1726;">목록</button>
		<hr>
	</div>
</body>
</html>