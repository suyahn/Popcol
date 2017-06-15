<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Movie</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">영화 입력</h2>
		<form action="adminInsert.do" method="post">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<table class="table table-striped">
				<tr>
					<td>제목</td>
					<td><input type="text" name="mtitle" required="required"></td>
				</tr>
				<tr>
					<td>원제</td>
					<td><input type="text" name="moriginaltitle"
						required="required"></td>
				</tr>
				<tr>
					<td>감독</td>
					<td><input type="text" name="mdirector" required="required"></td>
				</tr>
				<tr>
					<td>배우</td>
					<td><input type="text" name="mactor" required="required"></td>
				</tr>
				<tr>
					<td>줄거리</td>
					<td><textarea rows="5" cols="30" name="mcontent"
							required="required"></textarea></td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td><input type="date" name="mreleaseDate" required="required"></td>
				</tr>
				<tr>
					<td>러닝타임</td>
					<td><input type="text" name="mrunningTime" required="required"></td>
				</tr>
				<tr>
					<td>예고편</td>
					<td><input type="url" name="murlPreview" required="required"></td>
				</tr>
				<tr>
					<td>포스터</td>
					<td><input type="url" name="murlPoster" required="required"></td>
				</tr>
				<tr>
					<td>상영등급</td>
					<td><input type="text" name="mgrade" required="required"></td>
				</tr>
				<tr>
					<td>국가</td>
					<td><input type="text" name="mnation" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>