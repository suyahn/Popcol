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
		<h2>
			<img src="location/logo.png" width="250" height="70"> 영화관
		</h2>
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
							<font size="5" style="font-weight: bold;">${ location.lname }
							</font>
						</p>
						<br> <br>
						<p class="text-left">
							<font size="3">${ location.laddress }</font>
						</p>
						<p class="text-left">
							<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"
								style="color: #cd1726"></span>
							<!-- <img src="location/call3.png" width="20" height="20"> -->
							<font size="3"> ${ location.lphone }</font>
						</p>
					</div>
				</div>
				<c:set var="num" value="${num+1 }"></c:set>
			</c:forEach>
			<br><br>
			<div align="right">
				<button type="button" class="btn btn-info btn-sm"
					style="display: inline; border-color: #cd1726; background-color: #cd1726;"
					onclick="location.href='adminLocationInsertForm.do'">
					영화관 입력</button>
			</div>
			
		</div>
	</div>
</body>
</html>