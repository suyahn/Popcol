<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../../popcol/header.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View</title>
<!-- <script type="text/javascript">
	$(function() {
		$('#list').load('adminLocationList.do?');
	});
</script> -->
</head>
<body>
	<div class="container" align="center">
		<h2>
			<img src="location/logo.png" width="250" height="70"> 영화관
		</h2>
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>${ location.lid }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${location.lname}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${location.laddress}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${location.lphone}</td>
			</tr>
			<tr>
				<td>위도</td>
				<td>${location.lat}</td>
			</tr>
			<tr>
				<td>경도</td>
				<td>${location.lon}</td>
			</tr>
		</table>
		<a href="adminLocationList.do?" class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">목록</a>
		<a href="adminLocationUpdateForm.do?lid=${location.lid}"
			class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">수정</a>
		<a href="adminDelete.do?lid=${location.lid}" class="btn btn-info"
			style="display: inline; border-color: navy; background-color: navy;">삭제</a>
		<!-- <div id="list"></div> -->
	</div>
</body>
</html>