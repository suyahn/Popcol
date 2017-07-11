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
	<div class="container" align="center" style="width: 800px;">
		<h2 class="text-primary" style="color: #cd1726;">영화 입력</h2>
		<form action="adminInsert.do" method="post" enctype="multipart/form-data" >
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
					<td><textarea rows="5" cols="50" name="mcontent" required="required" maxlength="480" style="resize:none;"></textarea></td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td><input type="date" name="mreleaseDateString" required="required"></td>
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
					<td><input type="file" name="murlPosterName"></td>
				</tr>
				<tr>
					<td>상영등급</td>
					<td>
						<select name="mgrade">
							<option value="all">전체이용가</option>
							<option value="12">12세이용가</option>
							<option value="15">15세이용가</option>
							<option value="19">청소년관람불가</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>국가</td>
					<td><input type="text" name="mnation" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" class="btn btn-info btn-sm" style="background-color: #cd1726; border-color: #cd1726;">
						<input type="button" value="이전" class="btn btn-default btn-sm" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>