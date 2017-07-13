<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Movie</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary" style="color: #cd1726;">영화관 입력</h2>
		<form action="adminLocationInsert.do" method="post">
			<table class="table table-striped">
				<tr>
					<td>영화관 이름</td>
					<td><input type="text" name="lname" required="required"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="laddress" required="required"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="lphone" required="required"></td>
				</tr>
				<tr>
					<td>위도</td>
					<td><input type="text" name="lat" required="required"></td>
				</tr>
				<tr>
					<td>경도</td>
					<td><input type="text" name="lon" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" class="btn btn-info btn-sm" style="border-color: #cd1726; background-color: #cd1726;">
						<input type="button" value="이전" class="btn btn-default btn-sm" onclick="history.go(-1)">
					</td>
 				</tr>
			</table>
		</form>
	</div>
</body>
</html>