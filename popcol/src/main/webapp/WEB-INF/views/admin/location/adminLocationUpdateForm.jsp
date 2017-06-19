<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin UpdateForm</title>
</head>
<body>
	<div class="container" align="center">
		<h2>
			<img src="location/logo.png" width="250" height="70"> 영화관 수정
		</h2>
		<form action="adminLocationUpdate.do" method="post">
			<input type="hidden" name="lid" value="${location.lid}">

			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>${location.lid}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="lname" required="required"
						size="30" value="${location.lname}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="laddress" required="required"
						size="30" value="${location.laddress}"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="lphone" required="required"
						size="30" value="${location.lphone}"></td>
				</tr>
				<tr>
					<td>위도</td>
					<td><input type="text" name="lat" required="required"
						size="30" value="${location.lat}"></td>
				</tr>
				<tr>
					<td>경도</td>
					<td><input type="text" name="lon" required="required"
						size="30" value="${location.lon}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>