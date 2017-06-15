<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<h1>PopCol 영화관</h1>
		<div class="well">
			<c:set var="num" value="1"></c:set>
			<c:forEach var="location" items="${ locationList }">
				<div class="media">
					<a class="pull-left"
						href="adminLocationView.do?lid=${ location.lid }"> <img
						class="media-object" src="location/location${num}.jpg"
						style="border: 2px solid gray; width: 250px; height: 197px;">
					</a>
					<div class="media-body">
						<p>
						<font size="4" style="font-weight: bold;">${ location.lname }</font>
						</p><br><br>
						<p class="text-left"><font size="3">${ location.laddress }</font></p>
						<p class="text-left"><font size="3">${ location.lphone }</font></p>
					</div>
				</div>
				<c:set var="num" value="${num+1 }"></c:set>
			</c:forEach>
		</div>
	</div>
</body>
</html>