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
		<h2 class="text-primary">영화 수정</h2>
		<form action="adminUpdate.do" method="post">
			<input type="hidden" name="mid" value="${movie.mid}"> 
			<input type="hidden" name="pageNum" value="${pageNum}"> 
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
				<td><pre>
						<textarea rows="5" cols="30" name="mcontent" required="required">${movie.mcontent}
						</textarea>
					</pre></td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><input type="date" name="mreleaseDate" required="required"
					value="${movie.mreleaseDate}"></td>
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
				<td>포스터</td>
				<td><input type="text" name="murlPoster" required="required"
					value="${movie.murlPoster}"></td>
			</tr>
			<tr>
				<td>상영등급</td>
				<td><input type="text" name="mgrade" required="required"
					value="${movie.mgrade}"></td>
			</tr>
			<tr>
				<td>국가</td>
				<td><input type="text" name="mnation" required="required"
					value="${movie.mnation}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"></td>
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