<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../popcol/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin UpdateForm</title>
</head>
<body>
	<div class="container" align="center" style="width: 800px;">
		<h2 class="text-primary" style="color: #cd1726;">영화 수정</h2>
		<form action="adminUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mid" value="${movie.mid}"> 
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="murlPoster" value="${ movie.murlPoster }">
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td>${movie.mid}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="mtitle" required="required"
					value="${movie.mtitle}"></td>
			</tr>
			<tr>
				<td>원제</td>
				<td><input type="text" name="moriginaltitle"
					required="required" value="${movie.moriginaltitle}"></td>
			</tr>
			<tr>
				<td>감독</td>
				<td><input type="text" name="mdirector" required="required"
					value="${movie.mdirector}"></td>
			</tr>
			<tr>
				<td>배우</td>
				<td><input type="text" name="mactor" required="required"
					value="${movie.mactor}"></td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td>
					<textarea rows="5" cols="50" name="mcontent" required="required" maxlength="480" style="resize:none;">${movie.mcontent}</textarea>
				</td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><input type="date" name="mreleaseDateString" required="required" value="${movie.mreleaseDate}"></td>
			</tr>
			<tr>
				<td>러닝타임</td>
				<td><input type="text" name="mrunningTime" required="required"
					value="${movie.mrunningTime}"></td>
			</tr>
			<tr>
				<td>예고편</td>
				<td><input type="text" name="murlPreview" required="required"
					value="${movie.murlPreview}"></td>
			</tr>
			<tr>
				<td>포스터<span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="color: #cd1726" title="포스터 변경을 원하지 않으시면 파일 업로드 하지 마세요."></span></td>
				<td>
					<input type="file" name="murlPosterName">
				</td>
			</tr>
			<tr>
				<td>상영등급</td>
				<td>
					<select id="mgrade" name="mgrade">
						<option value="all" <c:if test="${movie.mgrade == all}">selected</c:if>>전체이용가</option>
						<option value="12" <c:if test="${movie.mgrade == 12}">selected</c:if>>12세이용가</option>
						<option value="15" <c:if test="${movie.mgrade == 15}">selected</c:if>>15세이용가</option>
						<option value="19" <c:if test="${movie.mgrade == 19}">selected</c:if>>청소년관람불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>국가</td>
				<td><input type="text" name="mnation" required="required"
					value="${movie.mnation}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인" class="btn btn-info btn-sm" style="background-color: #cd1726; border-color: #cd1726;">
					<input type="button" value="이전" class="btn btn-default btn-sm" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
		</form>
	<%-- 	<a href="adminList.do?pageNum=${pageNum}" class="btn btn-info">목록</a>
		<a href="adminUpdateForm.do?num=${board.num}&pageNum=${pageNum}"
			class="btn btn-info">수정</a> <a
			href="adminDeleteForm.do?num=${board.num}&pageNum=${pageNum}"
			class="btn btn-info">삭제</a> --%>

	</div>
</body>
</html>